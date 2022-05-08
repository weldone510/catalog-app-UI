import 'package:codepur/Models/cart.dart';
import 'package:codepur/Models/products.dart';
import 'package:codepur/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/velocity_x.dart';
import '../homeDetails.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context,index){
        final catalogItems= CatalogModel.items[index];
        return InkWell(
          onTap: ()=>{
            Navigator.push(context, MaterialPageRoute(builder: (contex)=>DetailHomePage(items:catalogItems))),
          },
            child: CatalogItem(items:catalogItems)
        );
      },
    );
  }
}

//Catalog Items
class CatalogItem extends StatelessWidget {
  final Item items;
  CatalogItem({
    required this.items
  })
      :assert(items!=null);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: items.id,
            child: Image.network(
              items.image,
            ).box.rounded.p12.color(MyTheme.creamColor).make().p8().w40(context),
          ),
          Expanded(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                items.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
                items.desc.text.coolGray500.make(),
                15.heightBox,  // for sizeBox
                ButtonBar(
                  // alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Rs:${items.price}".text.bold.make(),
                     AddToCart(items:items),5.heightBox,   // Named arg
                  ],
                ),
              ],
            ),
          ),
        ],

      ),
    ).white.square(150).rounded.make().py8();
  }
}

class AddToCart extends StatefulWidget {
  final Item items;
  AddToCart({required this.items});

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {


  final catalogItm = CatalogModel();  // obj of CatalogModel
  final cart = CartModel();           // obj of CartModel

  @override
  Widget build(BuildContext context) {

    bool isAdded = cart.itms.contains(widget.items);   // when click then be clicked

    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            MyTheme.darkBluishColor,
          ),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          ),
        ),
        onPressed:(){
          setState(() {

          });
          cart.catalogItms = catalogItm;   // set catalogItem
          cart.add(widget.items);
        }, child:isAdded?Icon(Icons.done): "Add to cart".text.make(),
    ).centered();
  }
}

