import 'package:flutter/material.dart';
import 'package:provider/model/item.dart';
import 'package:provider/widgets/cart/quantity_counter.dart';

class CartItem extends StatelessWidget {
  final Item item;
  final Function(String, int) onQuantityUpdate;

  const CartItem(this.item, {super.key, required this.onQuantityUpdate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey))),
      height: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                item.name,
                style: const TextStyle(fontSize: 20),
              ),
              const InkWell(
                child: Icon(Icons.close),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QuantityCounter(
                item.quantity!,
                onQuantityUpdate: (int i) {
                  onQuantityUpdate(item.id, i);
                },
              ),
              CartComponent(
                label: "Price",
                value: item.price.toString(),
              ),
              CartComponent(
                label: "Total",
                value: (item.price * item.quantity!).toString(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CartComponent extends StatelessWidget {
  const CartComponent({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label), Text(value)],
      ),
    );
  }
}
