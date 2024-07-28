import 'package:flutter/material.dart';
import 'package:provider/model/item.dart';
import 'package:provider/widgets/cart/cart.dart';
import 'package:provider/widgets/catalog_item.dart';

class Catalog extends StatefulWidget {
  const Catalog({super.key, required this.items});

  final String heading = "My catalog";
  final List<Item> items;

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  List<Item> itemsAddedToCart = [];

  void _onQuantityUpdate(String id, int quantity) {
    setState(() {
      List<Item> newItems = [];
      for (var i = 0; i < itemsAddedToCart.length; i++) {
        var item = itemsAddedToCart[i];
        if (item.id == id) {
          item.quantity = item.quantity! + quantity;
        }

        newItems.add(item);
      }

      itemsAddedToCart = newItems;
    });
  }

  void _onItemTap(Item i) {
    List<Item> newItems = [];
    bool isItemPresent = false;
    for (var element in itemsAddedToCart) {
      element.toString();
      if (element.id == i.id) {
        isItemPresent = true;
        element.quantity = element.quantity! + 1;
      }
      newItems.add(element);
    }
    setState(
      () {
        itemsAddedToCart = isItemPresent
            ? newItems
            : [
                ...newItems,
                Item(
                  id: i.id,
                  name: i.name,
                  price: i.price,
                  quantity: 1,
                )
              ];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.heading),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Cart(
                  itemsAddedToCart,
                  onQuantityUpdate: _onQuantityUpdate,
                ),
              ),
            ),
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 50,
            child: CatalogItem(
              item: widget.items[index],
              onItemTap: (i) {
                _onItemTap(i);
              },
            ),
          );
        },
      ),
    );
  }
}
