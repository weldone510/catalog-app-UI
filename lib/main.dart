import 'package:codepur/utilities/routes.dart';
import 'package:codepur/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './homePage.dart';
import './loginPage.dart';
import 'cartPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       //home:HomePage(),  // because of routing we have hide this home page
      // change the theme to dark
      themeMode: ThemeMode.light,
      theme:MyTheme.lightTheme(context),    // lightTheme
      darkTheme: MyTheme.darkTheme(context),   // dark brightness theme

      initialRoute: MyRoute.loginRoute,   // initial route=homeRoute
      routes: {
        // "/":(context)=>LoginPage(),  //error: home page error we dont do home main page at two times.
        // '/login':(context)=>LoginPage(),  // manually go to login page
        // '/':(context)=>LoginPage(),  // we set home route to login-Page

        MyRoute.homeRoute:(context)=>HomePage(),
        MyRoute.loginRoute:(context)=>LoginPage(),
        MyRoute.cartRoute:(context)=> CartPage(),
      },
    );
  }
}
