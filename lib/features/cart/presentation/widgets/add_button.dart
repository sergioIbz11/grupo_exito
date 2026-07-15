import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/cart_provider.dart';

class AddButton extends ConsumerWidget {
  final String id;
  static const _addButtonColor = Color(0xFFFF6D00);
  static const _stepperBackgroundColor = Color(0xFFF2F2F2);

  const AddButton({required this.id, super.key});

  int get _productId => int.parse(id);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity = ref.watch(cartItemQuantityProvider(_productId));
    final cartNotifier = ref.read(cartProvider.notifier);

    if (quantity <= 0) {
      return _AddToCartButton(onPressed: () => cartNotifier.addItem(_productId));
    }

    return _QuantityStepper(
      quantity: quantity,
      onIncrement: () => cartNotifier.addItem(_productId),
      onDecrement: () => cartNotifier.removeItem(_productId),
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _AddToCartButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AddButton._addButtonColor,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 12),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text('Agregar'),
      ),
    );
  }
}

class _QuantityStepper extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const _QuantityStepper({
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSingleUnit = quantity == 1;

    return SizedBox(
      height: 40,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AddButton._stepperBackgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isSingleUnit
                ? _TrashControl(onPressed: onDecrement)
                : _CircleControl(icon: Icons.remove, onPressed: onDecrement),
            Text(
              '$quantity und',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            _CircleControl(icon: Icons.add, onPressed: onIncrement),
          ],
        ),
      ),
    );
  }
}

class _TrashControl extends StatelessWidget {
  final VoidCallback onPressed;

  const _TrashControl({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.delete_outline, color: Colors.black54),
      iconSize: 20,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
    );
  }
}

class _CircleControl extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _CircleControl({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28,
      height: 28,
      child: Material(
        color: Colors.white,
        shape: const CircleBorder(
          side: BorderSide(color: AddButton._addButtonColor, width: 1.5),
        ),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          child: Icon(icon, size: 16, color: AddButton._addButtonColor),
        ),
      ),
    );
  }
}
