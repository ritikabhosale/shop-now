import 'package:flutter/material.dart';
import 'package:provider/model/item.dart';
import 'package:provider/widgets/cart/cart_item.dart';

class Cart extends StatelessWidget {
  const Cart(this.itemsAddedToCart,
      {super.key, required this.onQuantityUpdate});

  final String heading = "Cart";
  final List<Item> itemsAddedToCart;
  final Function(String, int) onQuantityUpdate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(heading),
      ),
      body: ListView.builder(
        itemCount: itemsAddedToCart.length,
        itemBuilder: (BuildContext context, int index) {
          return CartItem(
            itemsAddedToCart[index],
            onQuantityUpdate: onQuantityUpdate,
          );
        },
      ),
    );
  }
}
