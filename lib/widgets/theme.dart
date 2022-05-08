import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.poppins().fontFamily,

    // buttonColor: darkBluishColor,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: TextStyle(color:Colors.black,fontSize: 20),
      // textTheme: Theme.of(context).textTheme,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
  );

  static ThemeData darkTheme(BuildContext context)=>ThemeData(
    // brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: TextStyle(color:Colors.black,fontSize: 20),
      // textTheme: Theme.of(context).textTheme,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),

    ),
  );

  //colors

static Color creamColor = Color(0xfff5f5f5);
static Color darkBluishColor = Color(0xff403b58);


}