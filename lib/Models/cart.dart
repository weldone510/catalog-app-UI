import 'package:codepur/Models/products.dart';

class CartModel{

  static final cartModel = CartModel.internal();   // singleTon Class
  CartModel.internal();
  factory CartModel()=>cartModel;

  // catalogModel field
  late CatalogModel _catalogItms;

  //store ids of each items
  final List<int> itemIds = [];

  // get catalogItem

CatalogModel get catalogItms => _catalogItms;

//set catalogitems using CatalogModel

set catalogItms(CatalogModel newItem){
  _catalogItms = newItem;
}

// map card items to all ids || get items in the cart

List<Item> get itms => itemIds.map((id)=>_catalogItms.getById(id)).toList();

// Get Total price

num get totalPrice =>
  itms.fold(0, (previousValue, currentValue) => previousValue+currentValue.price);

//add Item
void add(Item item){
  itemIds.add(item.id.toInt());
}

//remove item
void remove(Item item){
  itemIds.remove(item.id);
}


}