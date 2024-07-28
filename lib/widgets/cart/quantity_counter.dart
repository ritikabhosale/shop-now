import 'package:flutter/material.dart';

class QuantityCounter extends StatefulWidget {
  const QuantityCounter(this.quantity,
      {super.key, required this.onQuantityUpdate});

  final int quantity;
  final Function(int counter) onQuantityUpdate;

  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  late int quantity;

  @override
  void initState() {
    quantity = widget.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      width: 80,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            child: const Icon(
              Icons.remove,
              color: Colors.white,
              key: Key("remove_icon"),
            ),
            onTap: () {
              if (quantity == 1) {
                return;
              }
              setState(() {
                quantity = quantity - 1;
              });
              widget.onQuantityUpdate(-1);
            },
          ),
          Container(
            color: Colors.white,
            width: 25,
            height: double.infinity,
            child: Center(
              child: Text(
                quantity.toString(),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          InkWell(
            child: const Icon(
              Icons.add,
              color: Colors.white,
              key: Key("add_icon"),
            ),
            onTap: () {
              widget.onQuantityUpdate(1);
              setState(() {
                quantity = quantity + 1;
              });
            },
          ),
        ],
      ),
    );
  }
}
