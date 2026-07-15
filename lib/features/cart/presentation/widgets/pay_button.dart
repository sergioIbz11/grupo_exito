import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/express_cart_provider.dart';

class PayButton extends ConsumerWidget {
  static const _backgroundColor = Color(0xFF3B82C4);

  const PayButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpressActive = ref.watch(expressCartActiveProvider);

    if (!isExpressActive) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const .only(bottom: 10),
      child: SizedBox(
        height: 44,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: _backgroundColor,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Comprar',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              SizedBox(width: 8),
              Icon(Icons.shopping_cart_outlined, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
