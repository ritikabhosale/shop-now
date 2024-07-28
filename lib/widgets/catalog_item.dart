import 'package:flutter/material.dart';
import 'package:provider/model/item.dart';

class CatalogItem extends StatelessWidget {
  final Item item;

  final Function(Item item) onItemTap;
  const CatalogItem({super.key, required this.item, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor: MaterialStateMouseCursor.clickable,
      onTap: () => onItemTap(item),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          item.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            decoration: TextDecoration.none,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
