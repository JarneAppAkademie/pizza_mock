class Pizza {
  final String id;
  final String name;
  final double price;
  final List<String> toppings;

  const Pizza({
    required this.id,
    required this.name,
    required this.price,
    required this.toppings,
  });

  Pizza copyWith({
    String? id,
    String? name,
    double? price,
    List<String>? toppings,
  }) {
    return Pizza(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      toppings: toppings ?? this.toppings,
    );
  }

  factory Pizza.empty() =>
      const Pizza(id: "", name: "", price: 0, toppings: []);
}
