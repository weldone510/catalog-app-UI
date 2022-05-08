import 'package:codepur/Models/products.dart';
import 'package:codepur/utilities/routes.dart';
import 'package:codepur/widgets/catalogListWidget.dart';
import 'package:codepur/widgets/drawer.dart';
import 'package:codepur/widgets/headerWidget.dart';
import 'package:codepur/widgets/itemWidget.dart';
import 'package:codepur/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   // final dummyList = List.generate(20, (i) => CatalogModel.items[0]);  // dummy list generate

  void initState(){
    super.initState();
    loadData();

  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString('assets/files/catalog.json');
    final dataDecoded = jsonDecode(catalogJson);
    final productsData = dataDecoded["products"];
    CatalogModel.items=List.from(productsData).map<Item>((item)=>Item.fromMap(item)).toList();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  MyTheme.creamColor,

      floatingActionButton:FloatingActionButton(
        backgroundColor: Colors.green,
        child:Icon(CupertinoIcons.shopping_cart),
        onPressed: (){
          Navigator.pushNamed(context, MyRoute.cartRoute);

        },
      ),
      body:SafeArea(
        child:Container(
            padding:Vx.m24,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatalogHeader(),

                  CatalogModel.items.isNotEmpty? CatalogList().py8().expand()
                  :CircularProgressIndicator().centered().expand(),

                ],
              ),

        ),
      ),

      // backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('Application'),
      // ),

   );
  }
}






