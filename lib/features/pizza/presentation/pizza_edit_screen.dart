import 'package:flutter/material.dart';
import '../../pizza/domain/pizza.dart';

enum EditMode { create, edit }

class EditPizzaScreen extends StatefulWidget {
  final EditMode mode;
  final Pizza? initial;
  final void Function(Pizza pizza) onSubmit;

  const EditPizzaScreen({
    super.key,
    required this.mode,
    this.initial,
    required this.onSubmit,
  });

  @override
  State<EditPizzaScreen> createState() => _EditPizzaScreenState();
}

class _EditPizzaScreenState extends State<EditPizzaScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameCtrl;
  late TextEditingController _priceCtrl;
  late TextEditingController _toppingsCtrl;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.initial?.name ?? '');
    _priceCtrl = TextEditingController(
      text: widget.initial != null
          ? widget.initial!.price.toStringAsFixed(2)
          : '',
    );
    _toppingsCtrl = TextEditingController(
      text: widget.initial?.toppings.join(', ') ?? '',
    );
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _priceCtrl.dispose();
    _toppingsCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final name = _nameCtrl.text.trim();
    final price = double.tryParse(_priceCtrl.text.replaceAll(',', '.')) ?? 0;
    final toppings = _toppingsCtrl.text
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();

    final base = widget.initial ?? Pizza.empty();
    final result = base.copyWith(name: name, price: price, toppings: toppings);

    widget.onSubmit(result);
    Navigator.of(context).pop(); // zurück zur Liste/Details
  }

  @override
  Widget build(BuildContext context) {
    final isCreate = widget.mode == EditMode.create;
    return Scaffold(
      appBar: AppBar(
        title: Text(isCreate ? 'Pizza hinzufügen' : 'Pizza bearbeiten'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameCtrl,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? 'Bitte Name eingeben'
                  : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _priceCtrl,
              decoration: const InputDecoration(labelText: 'Preis (€)'),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              validator: (v) {
                final d = double.tryParse((v ?? '').replaceAll(',', '.'));
                if (d == null || d <= 0) return 'Preis ungültig';
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _toppingsCtrl,
              decoration: const InputDecoration(
                labelText: 'Toppings (kommagetrennt)',
                hintText: 'z.B. Tomate, Mozzarella, Basilikum',
              ),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _submit,
              child: Text(isCreate ? 'Hinzufügen' : 'Speichern'),
            ),
          ],
        ),
      ),
    );
  }
}
