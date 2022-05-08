import 'package:flutter/material.dart';

class CatalogModel{

  static final catalogModel = CatalogModel.internal();   // singleTon Class
  CatalogModel.internal();
  factory CatalogModel() => catalogModel;

  static List<Item> items = [
    // Item(
    //   id: 1,
    //   name: 'Nokia G34',
    //   desc: 'Hello New Mobile',
    //   price: 999,
    //   color: '#fc6569',
    //   image:
    //   'https://www.pakmobizone.pk/wp-content/uploads/2021/05/Oppo-F19-Pro-Crystal-Silver-1.png',
    // )
  ];

  //Item Get by id...
  Item getById(int id)=> items.firstWhere((element) => element.id==id, orElse: null);

  //Item Get by position...
  Item getByPosition(int pos)=>items[pos];


}
class Item {
  final num id;
  final String name;
  final String desc;
  final String aboutMobile;
  final num price;
  final String color;
  final String image;

//Constructor of Item class 1..

  Item({required this.id,
    required this.name,
    required this.desc,
    required this.aboutMobile,
    required this.price,
    required this.color,
    required this.image,
  });

  //constructor of Item class 2..
  factory Item.fromMap(Map<String,dynamic>map){
    return Item(
      id:map['id'],
      name:map["name"],
      desc:map['desc'],
      price: map["price"],
      aboutMobile: map['aboutMobile'],
      color:map['color'],
      image:map['image'],
    );
  }
  // toMap()=>{
  //   'id':id,
  //   'name':name,
  //   'desc':desc,
  //   'price':price,
  //   'color':color,
  //   'image':image,
  // };

}