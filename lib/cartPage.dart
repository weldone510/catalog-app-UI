import 'package:codepur/Models/products.dart';
import 'package:codepur/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Models/cart.dart';
class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Cart"),
      ),
      body:Column(
        children: [
          CartList().p24().expand(),  // cartList
          Divider(),
          CartTotal(),   //widget
        ],
      ),
    );
  }
}


class CartTotal extends StatelessWidget {
   final cartObj = CartModel();  // make a obj of CartModel
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          "Rs ${cartObj.totalPrice}".text.xl3.bold.make(),30.widthBox,  // total price
          ElevatedButton(
              onPressed: (){
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                 content:Text('Buy not Supported yet')
               ),
              );
              },
              child: "Buy".text.lg.bold.make(),
          ).w32(context)
        ],
      ).p24(),
    );
  }
}

class CartList extends StatefulWidget {

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {

  final cartObj = CartModel();  //make a obj of cart

  @override
  Widget build(BuildContext context) {
    return cartObj.itms.isEmpty?"Noting to show".text.color(Colors.grey).bold.underline.xl2.make(): ListView.builder(
      itemCount:cartObj.itms.length,
      itemBuilder: (context,index)=>
      ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon:Icon(Icons.remove_circle_outline),
          onPressed: (){
              cartObj.remove(cartObj.itms[index]);   //remove product from cart
              setState(() {

              });
          },
        ),
        title: cartObj.itms[index].name.text.make(),   // item check by index of all items

      ),
    );
  }
}

