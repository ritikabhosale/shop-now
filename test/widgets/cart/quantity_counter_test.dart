import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/widgets/cart/quantity_counter.dart';

void main() {
  testWidgets('QuantityCounter renders quantity, plus and minus icon',
      (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QuantityCounter(
            12,
            onQuantityUpdate: (counter) {},
          ),
        ),
      ),
    );

    expect(find.text("12"), findsOneWidget);
    expect(find.byType(Icon), findsNWidgets(2));
    expect(find.byKey(const Key("remove_icon")), findsOneWidget);
    expect(find.byKey(const Key("add_icon")), findsOneWidget);
  });

  testWidgets(
      'QuantityCounter changes quantity and calls onQuantityUpdate function with quantity delta when clicked on add and remove buttons',
      (tester) async {
    int quantityDelta = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QuantityCounter(
            12,
            onQuantityUpdate: (counter) {
              quantityDelta = counter;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key("remove_icon")));
    await tester.pumpAndSettle();
    expect(find.text("11"), findsOneWidget);
    expect(quantityDelta, -1);

    await tester.tap(find.byKey(const Key("add_icon")));
    await tester.pumpAndSettle();
    expect(find.text("12"), findsOneWidget);
    expect(quantityDelta, 1);
  });
}
