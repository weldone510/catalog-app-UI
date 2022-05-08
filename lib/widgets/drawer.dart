import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  // final imageUrl = '"F:\S'eries Work'\hassan.jpg"';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple,
        ),
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                // decoration: BoxDecoration(      // color of dreawerHeader
                //   color: Colors.deepPurple,
                // ),
                margin: EdgeInsets.zero,
                accountName: Text('Muhammad Hassan'),
                accountEmail: Text('muharramkhan110@gmail.com'),
                currentAccountPicture: CircleAvatar(
                 backgroundImage: AssetImage('assets/img/hassan.jpg'),
                ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home,color: Colors.white,),
              // leading: Image.asset('assets/img/hassan.jpg'),
              title: Text('Home', textScaleFactor:1.2,style: TextStyle(color: Colors.white,)),
              // subtitle:Text('The airplane is only in Act II.'),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled,color: Colors.white,),
              title: Text('Profile',textScaleFactor:1.2,style: TextStyle(color: Colors.white,)),
              // subtitle:Text('The airplane is only in Act II.'),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail,color: Colors.white,),
              title: Text('Email me',textScaleFactor:1.2,style: TextStyle(color: Colors.white,)),
              // subtitle:Text('The airplane is only in Act II.'),
            ),
          ],
        ),
      ),
      );

  }
}
