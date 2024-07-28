import 'package:provider/model/item.dart';
import 'package:uuid/uuid.dart';

final itemsData = [
  Item(
    id: const Uuid().v4().toString(),
    name: "Apple",
    price: 40,
  ),
  Item(
    id: const Uuid().v4().toString(),
    name: "Banana",
    price: 5,
  ),
  Item(
    id: const Uuid().v4().toString(),
    name: "Grapes",
    price: 30,
  ),
  Item(
    id: const Uuid().v4().toString(),
    name: "Watermelon",
    price: 40,
  ),
  Item(
    id: const Uuid().v4().toString(),
    name: "Jackfruit",
    price: 80,
  ),
  Item(
    id: const Uuid().v4().toString(),
    name: "Dragonfruit",
    price: 120,
  ),
  Item(
    id: const Uuid().v4().toString(),
    name: "Papaya",
    price: 60,
  ),
  Item(
    id: const Uuid().v4().toString(),
    name: "Pineapple",
    price: 50,
  ),
];
