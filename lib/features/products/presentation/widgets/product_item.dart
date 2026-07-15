import 'package:flutter/material.dart';

import '../../../../core/utils/formatters.dart';
import '../../../cart/presentation/widgets/add_button.dart';
import '../../domain/entities/product_entity.dart';

class ProductItem extends StatelessWidget {
  static const _priceColor = Color(0xFFE2231A);
  static const _placeholderColor = Color(0xFFF2F2F2);

  final ProductEntity product;
  final VoidCallback? onTap;
  final VoidCallback? onAddToList;

  const ProductItem({
    required this.product,
    this.onTap,
    this.onAddToList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final imageUrl = product.images.isNotEmpty ? product.images.first : null;

    return Container(
      decoration: BoxDecoration(
        borderRadius: const .all(.circular(20)),
        border: Border.all(
          color: const Color(0xFFE8E8E8),
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _ProductImage(
                  imageUrl: imageUrl,
                  onAddToList: onAddToList,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                product.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                formatPrice(product.price),
                style: textTheme.titleLarge?.copyWith(
                  color: _priceColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              AddButton(
                id: '${product.id}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  final String? imageUrl;
  final VoidCallback? onAddToList;

  const _ProductImage({required this.imageUrl, required this.onAddToList});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: imageUrl == null
              ? const _ImagePlaceholder()
              : Image.network(
                  imageUrl!,
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  },
                  errorBuilder: (_, _, _) => const _ImagePlaceholder(),
                ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: _AddToListButton(onPressed: onAddToList),
        ),
      ],
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: ProductItem._placeholderColor,
      child: Center(
        child: Icon(Icons.image_not_supported_outlined, color: Colors.grey),
      ),
    );
  }
}

class _AddToListButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const _AddToListButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: 1,
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.playlist_add),
        iconSize: 18,
        padding: const EdgeInsets.all(6),
        constraints: const BoxConstraints(),
        tooltip: 'Agregar a la lista',
      ),
    );
  }
}
