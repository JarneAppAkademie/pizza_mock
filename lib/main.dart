import 'package:flutter/material.dart';
import 'package:pizza_mock/features/pizza/data/pizza_db.dart';
import 'features/pizza/presentation/pizza_home.dart';

void main() => runApp(const PizzaApp());

class PizzaApp extends StatelessWidget {
  const PizzaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Demo',
      theme: ThemeData(colorSchemeSeed: Colors.red, useMaterial3: true),
      home: PizzaHome(db: InMemoryPizzaDB()),
    );
  }
}
