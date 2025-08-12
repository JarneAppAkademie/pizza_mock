import 'package:flutter/material.dart';
import 'package:pizza_mock/features/pizza/widgets/pizza_tile.dart';
import '../../pizza/domain/pizza.dart';

class PizzasListScreen extends StatefulWidget {
  final List<Pizza> pizzas;
  final void Function(Pizza pizza) onCreate;
  final void Function(Pizza pizza) onUpdate;
  final void Function(String id) onDelete;

  final void Function(Pizza pizza) openDetails;
  final VoidCallback openCreate;

  const PizzasListScreen({
    super.key,
    required this.pizzas,
    required this.onCreate,
    required this.onUpdate,
    required this.onDelete,
    required this.openDetails,
    required this.openCreate,
  });

  @override
  State<PizzasListScreen> createState() => _PizzasListScreenState();
}

class _PizzasListScreenState extends State<PizzasListScreen> {
  @override
  Widget build(BuildContext context) {
    final list = widget.pizzas;
    return Scaffold(
      appBar: AppBar(title: const Text('Pizzas')),
      body: list.isEmpty
          ? const Center(child: Text('Noch keine Pizzas – füge eine hinzu!'))
          : ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: list.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (_, i) {
                final p = list[i];
                return PizzaTile(pizza: p, onTap: () => widget.openDetails(p));
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: widget.openCreate,
        icon: const Icon(Icons.add),
        label: const Text('Neu'),
      ),
    );
  }
}
