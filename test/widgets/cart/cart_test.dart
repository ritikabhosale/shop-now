import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/model/item.dart';
import 'package:provider/widgets/cart/cart.dart';
import 'package:provider/widgets/cart/cart_item.dart';

void main() {
  testWidgets('Cart renders appBar with title and cart items', (tester) async {
    List<Item> itemsAddedToCart = [
      Item(id: "123", name: "Item1", price: 20, quantity: 1),
      Item(id: "345", name: "Item2", price: 25, quantity: 2),
      Item(id: "567", name: "Item3", price: 30, quantity: 3),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Cart(itemsAddedToCart, onQuantityUpdate: (String a, int b) {}),
      ),
    );

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text("Cart"), findsOneWidget);
    expect(find.byType(Cart), findsOneWidget);
    expect(find.byType(CartItem), findsNWidgets(itemsAddedToCart.length));
  });
}
