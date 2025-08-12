import 'package:flutter/material.dart';
import '../../pizza/domain/pizza.dart';

class PizzaDetailScreen extends StatefulWidget {
  final String pizzaId;
  final Pizza Function(String id) findById;
  final void Function(Pizza pizza) onUpdate;
  final void Function(String id) onDelete;
  final void Function(Pizza initial) openEditor;

  const PizzaDetailScreen({
    super.key,
    required this.pizzaId,
    required this.findById,
    required this.onUpdate,
    required this.onDelete,
    required this.openEditor,
  });

  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
}

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final pizza = widget.findById(widget.pizzaId);
    if (pizza.id.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Pizza')),
        body: const Center(child: Text('Pizza nicht gefunden.')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(pizza.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => widget.openEditor(pizza),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => widget.onDelete(pizza.id),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pizza.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text('Preis: ${pizza.price.toStringAsFixed(2)} €'),
                  const SizedBox(height: 12),
                  Text(
                    'Toppings:',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: pizza.toppings.isEmpty
                        ? [const Text('—')]
                        : pizza.toppings
                              .map((t) => Chip(label: Text(t)))
                              .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
