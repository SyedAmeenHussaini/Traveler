import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    final Profile_url =
       "https://pbs.twimg.com/profile_images/1247651655065075712/fszwVtCL_400x400.jpg";
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
              .neumorphic(color: Vx.purple500, elevation: 30.0).
              bgImage(DecorationImage(image: NetworkImage(Profile_url)))
              .make()
        ].column())
            .makeCentered()
      ]),
    );
  }
}
