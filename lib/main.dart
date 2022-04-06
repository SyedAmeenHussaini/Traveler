import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traveler/pages/homePage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
     theme: ThemeData(
       primaryColor: Colors.orange,
       accentColor: Colors.purple,
       fontFamily: GoogleFonts.lato().fontFamily
       
     ),
       debugShowCheckedModeBanner: false, 
      );
      
  }
}
