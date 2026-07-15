import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/cart_provider.dart';

class CartIcon extends ConsumerWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalQuantity = ref.watch(cartTotalQuantityProvider);

    return Badge(
      label: Text('$totalQuantity'),
      isLabelVisible: totalQuantity > 0,
      child: const Icon(Icons.shopping_cart_outlined),
    );
  }
}
