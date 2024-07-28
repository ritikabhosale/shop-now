import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/model/item.dart';
import 'package:provider/widgets/catalog_item.dart';

void main() {
  testWidgets('CatalogItem renders title', (tester) async {
    Item item = Item(id: "123", name: "Item1", price: 12);

    await tester.pumpWidget(
      MaterialApp(
          home: Scaffold(
        body: CatalogItem(
          item: item,
          onItemTap: (item) {},
        ),
      )),
    );

    expect(find.text("Item1"), findsOneWidget);
  });

  testWidgets('CatalogItem calls onItemTap when clicked on item',
      (tester) async {
    Item item = Item(id: "123", name: "Item1", price: 12);
    Item? itemClickedOn;

    await tester.pumpWidget(
      MaterialApp(
          home: Scaffold(
        body: CatalogItem(
          item: item,
          onItemTap: (item) {
            itemClickedOn = item;
          },
        ),
      )),
    );

    await tester.tap(find.text("Item1"));
    expect(itemClickedOn, item);
  });
}
