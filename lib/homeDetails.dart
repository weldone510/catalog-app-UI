import 'package:codepur/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Models/products.dart';

class DetailHomePage extends StatelessWidget {
  final Item items;    // import model for Item

  DetailHomePage({required this.items})
      :assert(items!=null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar:  Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "Rs:${items.price}".text.xl.bold.red800.make(),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    MyTheme.darkBluishColor,
                  ),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(),
                  ),
                ),
                onPressed:(){}, child: 'Add to cart'.text.lg.bold.make()
            ).wh(120, 45),
          ],
        ).p2(),
      ),
      appBar: AppBar(backgroundColor: Colors.transparent ,),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag:Key(items.id.toString()),
                child: Image.network(items.image).h32(context),
            ).p16(),
            Expanded(
                child: VxArc(
                  height: 20.0,
                  edge: VxEdge.TOP,
                  arcType:VxArcType.CONVEY,
                  child: Container(
                    width:context.screenWidth,
                     color: Colors.white,
                    child:Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      child: Column(
                        children: [
                          items.name.text.bold.color(MyTheme.darkBluishColor).xl4.make(),
                          SizedBox(
                            height: 8,
                          ),
                          items.desc.text.xl.coolGray600.make(),15.heightBox,
                          items.aboutMobile.text.center.wide.fontWeight(FontWeight.w200).make().p12(),
                        ],
                      ),
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
