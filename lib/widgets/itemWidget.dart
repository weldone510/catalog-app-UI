import 'package:codepur/Models/products.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item; // Item item = new Item(
  // id:1,
  // name:'OPPO F19',
  // desc: 'New OS Version',
  // price:35000,
  // color: '#fcf565',
  // image: 'https://images.priceoye.pk/oppo-f19-pro-pakistan-priceoye-v3d9q-500x500.webp',
  // ),
  const ItemWidget({Key? key, required this.item}) : assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 0.0,
      child: ListTile(
        onTap: () {
          print('${item.name} pressed');
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          'Rs:${item.price}',
          textScaleFactor: 1.2,
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
        ),
      ),
    );
  }
}
