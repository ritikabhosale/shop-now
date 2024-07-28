class Item {
  final String id;
  final String name;
  int? quantity;
  final double price;

  Item({
    required this.id,
    required this.name,
    required this.price,
    this.quantity,
  });
}
