import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/model/item.dart';
import 'package:provider/widgets/cart/cart_item.dart';
import 'package:provider/widgets/catalog.dart';
import 'package:provider/widgets/catalog_item.dart';

void main() {
  testWidgets(
      'Catalog renders appBar with title and cart icon and catalog items',
      (tester) async {
    List<Item> items = [
      Item(id: "item_id_1", name: "Item1", price: 12),
      Item(id: "item_id_2", name: "Item2", price: 16),
      Item(id: "item_id_3", name: "Item2", price: 19),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Catalog(items: items),
      ),
    );

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text("My catalog"), findsOneWidget);
    expect(find.byType(IconButton), findsOneWidget);
    expect(find.byType(CatalogItem), findsNWidgets(items.length));
  });

  testWidgets('Catalog renders Cart when clicked on cart button',
      (tester) async {
    List<Item> items = [
      Item(id: "item_id_1", name: "Item1", price: 12),
      Item(id: "item_id_2", name: "Item2", price: 16),
      Item(id: "item_id_3", name: "Item2", price: 19),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Catalog(items: items),
      ),
    );

    expect(find.byType(IconButton), findsOneWidget);
    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    // assert screen change
    expect(find.text("My catalog"), findsNothing);
    expect(find.text("Cart"), findsOneWidget);
  });

  testWidgets('Catalog renders Cart with selected items', (tester) async {
    List<Item> items = [
      Item(id: "item_id_1", name: "Item1", price: 12),
      Item(id: "item_id_2", name: "Item2", price: 16),
      Item(id: "item_id_3", name: "Item3", price: 19),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Catalog(items: items),
      ),
    );

    await tester.tap(find.text("Item1"));
    await tester.tap(find.text("Item2"));

    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    // renders cart with item1 and item2
    expect(find.text("Cart"), findsOneWidget);
    expect(find.byType(CartItem), findsNWidgets(2));
    expect(find.text("Item1"), findsOneWidget);
    expect(find.text("Item2"), findsOneWidget);
    expect(find.text("1"), findsNWidgets(2));
  });

  testWidgets(
      'Catalog renders Cart with selected items when one item was selected multiple times',
      (tester) async {
    List<Item> items = [
      Item(id: "item_id_1", name: "Item1", price: 12),
      Item(id: "item_id_2", name: "Item2", price: 16),
      Item(id: "item_id_3", name: "Item3", price: 19),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Catalog(items: items),
      ),
    );

    await tester.tap(find.text("Item1"));
    await tester.tap(find.text("Item1"));
    await tester.tap(find.text("Item1"));

    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    // renders cart with item1 having 3 quantity
    expect(find.text("Item1"), findsOneWidget);
    expect(find.text("3"), findsOneWidget);
  });

  testWidgets(
      'Catalog renders cart with updated quantity for a item when quantity is changed through cart counter',
      (tester) async {
    List<Item> items = [
      Item(id: "item_id_1", name: "Item1", price: 12),
      Item(id: "item_id_2", name: "Item2", price: 16),
      Item(id: "item_id_3", name: "Item3", price: 19),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Catalog(items: items),
      ),
    );

    await tester.tap(find.text("Item1"));
    await tester.tap(find.text("Item1"));

    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    expect(find.text("2"), findsOneWidget);

    await tester.tap(find.byKey(const Key("add_icon")));
    await tester.tap(find.byType(BackButton));

    await tester.pumpAndSettle();
    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    expect(find.text("3"), findsOneWidget);
  });
}
