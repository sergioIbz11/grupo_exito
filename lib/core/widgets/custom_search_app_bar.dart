import 'package:flutter/material.dart';

import '../../features/cart/presentation/widgets/cart_icon.dart';

class CustomSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String hintText;
  final VoidCallback? onSearchTap;
  final VoidCallback? onProfileTap;

  const CustomSearchAppBar({
    this.hintText = 'Busca en tu app',
    this.onSearchTap,
    this.onProfileTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 16,
      title: _SearchField(hintText: hintText, onTap: onSearchTap),
      actions: const [
        CartIcon(),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchField extends StatelessWidget {
  final String hintText;
  final VoidCallback? onTap;

  const _SearchField({required this.hintText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.grey),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  hintText,
                  style: const TextStyle(color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
