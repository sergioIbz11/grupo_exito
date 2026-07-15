import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/express_cart_provider.dart';

class ToggleCart extends ConsumerWidget {
  const ToggleCart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAvailable = ref.watch(expressWindowAvailableProvider).value ?? false;

    if (!isAvailable) {
      return const SizedBox.shrink();
    }

    final isEnabled = ref.watch(expressCartEnabledProvider);

    return Container(
      color: Colors.black,
      padding: const .symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          const Text(
            'experiencia express',
            style: TextStyle(fontWeight: .bold, color: Colors.white),
          ),
          Switch(
            value: isEnabled,
            onChanged: (_) =>
                ref.read(expressCartEnabledProvider.notifier).toggle(),
          ),
        ],
      ),
    );
  }
}
