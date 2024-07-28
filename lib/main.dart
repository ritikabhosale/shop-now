import 'package:flutter/material.dart';
import 'package:provider/data/items.dart';
import 'package:provider/widgets/catalog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Catalog(items: itemsData),
    );
  }
}
