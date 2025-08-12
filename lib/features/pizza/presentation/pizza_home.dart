import 'package:flutter/material.dart';
import 'package:pizza_mock/features/pizza/data/database_repository.dart';
import 'package:pizza_mock/features/pizza/data/pizza_db.dart';
import 'package:pizza_mock/features/pizza/presentation/pizza_edit_screen.dart';
import 'package:pizza_mock/features/pizza/presentation/pizza_list_screen.dart';
import '../../pizza/domain/pizza.dart';

import 'pizza_detail_screen.dart';

class PizzaHome extends StatefulWidget {
  final DatabaseRepository db;
  const PizzaHome({super.key, required this.db});

  @override
  State<PizzaHome> createState() => _PizzaHomeState();
}

class _PizzaHomeState extends State<PizzaHome> {
  DatabaseRepository get db => widget.db;

  void _create(Pizza draft) {
    db.create(draft);
    setState(() {});
  }

  void _update(Pizza updated) {
    db.update(updated);
    setState(() {});
  }

  void _delete(String id) {
    db.delete(id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return PizzasListScreen(
      pizzas: db.items,
      onCreate: _create,
      onUpdate: _update,
      onDelete: _delete,
      openDetails: (pizza) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => PizzaDetailScreen(
              pizzaId: pizza.id,
              findById: (id) => db.byId(id) ?? Pizza.empty(),
              onUpdate: _update,
              onDelete: (id) {
                _delete(id);
                Navigator.of(context).pop();
              },
              openEditor: (initial) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => EditPizzaScreen(
                      mode: EditMode.edit,
                      initial: initial,
                      onSubmit: _update,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
      openCreate: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) =>
                EditPizzaScreen(mode: EditMode.create, onSubmit: _create),
          ),
        );
      },
    );
  }
}
