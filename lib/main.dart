import 'package:flutter/material.dart';
import 'package:pizza_mock/features/pizza/data/database_repository.dart';
import 'package:pizza_mock/features/pizza/data/onlinedb_repository.dart';
import 'package:pizza_mock/features/pizza/data/pizza_db.dart';
import 'features/pizza/presentation/pizza_home.dart';

void main() => runApp(PizzaApp());

class PizzaApp extends StatelessWidget {
  PizzaApp({super.key});

  DatabaseRepository db = OnlinedbRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Demo',
      theme: ThemeData(colorSchemeSeed: Colors.red, useMaterial3: true),
      home: PizzaHome(db: db),
    );
  }
}
