//CRUD und DB Repo

import 'package:pizza_mock/features/pizza/data/database_repository.dart';
import 'package:pizza_mock/features/pizza/domain/pizza.dart';

class InMemoryPizzaDB implements DatabaseRepository{
  final List<Pizza> _items = [
    const Pizza(
      id: "1",
      name: "Hawaii",
      price: 8.5,
      toppings: ["Schinken", "Ananas"],
    ),
    const Pizza(
      id: "1",
      name: "Hawaii 2",
      price: 8.5,
      toppings: ["Schinken", "Ananas"],
    ),
    const Pizza(
      id: "1",
      name: "Hawaii 3",
      price: 8.5,
      toppings: ["Schinken", "Ananas"],
    ),
  ];

  int _idCounter = 3;

  List<Pizza> get items => List.unmodifiable(_items);

  Pizza? byId(String id) => _items
      .where((p) => p.id == id)
      .cast<Pizza?>()
      .firstWhere((p) => p != null, orElse: () => null);

  //CREATE
  Pizza create(Pizza draft) {
    final created = draft.copyWith(id: (_idCounter++).toString());
    _items.add(created);
    return created;
  }

  //UPDATE
  void update(Pizza updated) {
    final i = _items.indexWhere((p) => p.id == updated.id);
    if (i == -1) return;
    _items[i] = updated;
  }

  //DELETE
  void delete(String id) {
    _items.removeWhere((p) => p.id == id);
  }

}
