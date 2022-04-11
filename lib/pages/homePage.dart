// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final Profile_url =
      "https://pbs.twimg.com/profile_images/1247651655065075712/fszwVtCL_400x400.jpg";
  final bridgeurl =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Tower_Bridge_from_Shad_Thames.jpg/1200px-Tower_Bridge_from_Shad_Thames.jpg";
   
   final london_Url="https://cdn.londonandpartners.com/-/media/images/london/visit/things-to-do/sightseeing/london-attractions/coca-cola-london-eye/the-london-eye-2-640x360.jpg?mw=640&hash=F7D574072DAD523443450DF57E3B91530064E4EE";
  
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.purple500,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: VStack([
          VxBox().size(20, 2).white.make(),
          5.heightBox,
          VxBox().size(20, 2).white.make(),
          5.heightBox,
          VxBox().size(20, 2).white.make()
        ]).pOnly(left: 16, top: 16),
      ),
      body: VStack([
        VxBox(
                child: [
          VxBox()
              .square(100)
              .roundedFull
              .neumorphic(color: Vx.purple500, elevation: 30.0)
              .bgImage(DecorationImage(image: NetworkImage(Profile_url)))
              .make(),
          "Hi "
              .richText
              .withTextSpanChildren(["Miracle".textSpan.bold.make()])
              .white
              .xl3
              .make()
              .p12(),
          "Solo Traveler".text.white.bold.xl.make(),
          VxTextField(
            borderType: VxTextFieldBorderType.none,
            borderRadius: 18,
            hint: "Searh",
            fillColor: Vx.gray200.withOpacity(0.3),
            contentPaddingTop: 14,
            autofocus: false,
            prefixIcon:
                const Icon(Icons.search_off_outlined, color: Colors.white),
          )
              .customTheme(themeData: ThemeData(brightness: Brightness.dark))
              .cornerRadius(10)
              .p16()
        ].column())
            .makeCentered()
            .h40(context),
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: VxBox(
              child: VStack([
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.purple,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Vx.purple500,
              unselectedLabelColor: Vx.gray500,
              labelPadding: Vx.m16,
              tabs: const [
                Icon(
                  Icons.location_on,
                  size: 30,
                ),
                Icon(
                  Icons.search_outlined,
                  size: 30,
                ),
                Icon(
                  Icons.restaurant_outlined,
                  size: 30,
                ),
                Icon(
                  Icons.person_outlined,
                  size: 30,
                )
              ],
            ),
            TabBarView(
              controller: _tabController,
              children: ["1", "2", "3", "4"]
                  .map((e) => VStack([
                        "Discover places in london"
                            .text
                            .gray600
                            .xl2
                            .bold
                            .make(),
                        HeightBox(10),
                      TravelCard
                      (imageurl: bridgeurl,title: "Tower Bridge", subtitle: "lover tower",)
                       ,HeightBox(10),
                        TravelCard(imageurl:london_Url ,title: "London", subtitle: "Park",) //
                      ]).p16())
                  .toList(),
            ).expand()
          ])).white.make(),
        ).expand()
      ]),
    );
  }
}

class TravelCard extends StatelessWidget {
  final String title, subtitle, imageurl;
  const TravelCard({
    Key? key,
    required this.imageurl, required this.title, required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HStack(
      [
        Image.network(
          imageurl,
          fit: BoxFit.cover,
        )
            .w(
              context.percentWidth * 40,
            )
            .cornerRadius(10),
        30.widthBox,
        VStack([
          title.text.semiBold.make(),
          3.heightBox,
          subtitle.text.pink400.make().shimmer(),
          5.heightBox,
          [
            VxRating(
              size: 13,
              onRatingUpdate: (value) {},
            ),
            5.widthBox,
            "100".text.bold.gray400.make(),
          ].row()
        ], crossAlignment: CrossAxisAlignment.start)
            .expand()
      ],
    ).cornerRadius(8).backgroundColor(Vx.gray200);
  }
}
