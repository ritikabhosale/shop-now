import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/model/item.dart';
import 'package:provider/widgets/cart/cart_item.dart';
import 'package:provider/widgets/cart/quantity_counter.dart';

void main() {
  testWidgets('CartItem renders title, price and total', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CartItem(
            Item(id: "123", name: "Item1", price: 20, quantity: 2),
            onQuantityUpdate: (id, quantity) {},
          ),
        ),
      ),
    );

    expect(find.text("Item1"), findsOneWidget);
    expect(find.text("Price"), findsOneWidget);
    expect(find.text("20.0"), findsOneWidget);
    expect(find.text("40.0"), findsOneWidget);
    expect(find.byType(QuantityCounter), findsOneWidget);
  });

  testWidgets(
      'CartItem executes callback when quantity decrement icon is clicked',
      (tester) async {
    Map<String, int> idToQuantityMapper = {};

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CartItem(
            Item(id: "123", name: "Item1", price: 20, quantity: 2),
            onQuantityUpdate: (id, quantity) {
              idToQuantityMapper[id] = quantity;
            },
          ),
        ),
      ),
    );

    expect(find.byType(QuantityCounter), findsOneWidget);

    await tester.tap(find.byKey(const Key("remove_icon")).first);
    await tester.pumpAndSettle();

    // asserting that the onQuantityUpdate callback was called with correct parameters
    expect(idToQuantityMapper["123"], equals(-1));
  });
}
