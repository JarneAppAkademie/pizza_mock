import 'package:flutter/material.dart';
import 'package:pizza_mock/features/pizza/domain/pizza.dart';

class PizzaTile extends StatefulWidget {
  final Pizza pizza;
  final VoidCallback? onTap;
  const PizzaTile({super.key, required this.pizza, this.onTap});

  @override
  State<PizzaTile> createState() => _PizzaTileState();
}

class _PizzaTileState extends State<PizzaTile> {
  @override
  Widget build(BuildContext context) {
    final p = widget.pizza;
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      title: Text(p.name),
      subtitle: Text(
        '${p.price.toStringAsFixed(2)} € • ${p.toppings.join(", ")}',
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: widget.onTap,
    );
  }
}
