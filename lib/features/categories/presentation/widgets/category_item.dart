import 'package:flutter/material.dart';

import '../../domain/entities/category_entity.dart';

class CategoryItem extends StatelessWidget {
  static const _placeholderColor = Color(0xFFF2F2F2);

  final CategoryEntity category;
  final VoidCallback? onTap;

  const CategoryItem({required this.category, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
             decoration: BoxDecoration(
        borderRadius: const .all(.circular(20)),
        border: Border.all(
          color: const Color(0xFFE8E8E8),
          width: 2,
        ),
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipOval(
                      child: Image.network(
                        category.image,
                        fit: BoxFit.cover,
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
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 8,
              ),
              child: Text(
                category.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: CategoryItem._placeholderColor,
      child: Center(
        child: Icon(Icons.image_not_supported_outlined, color: Colors.grey),
      ),
    );
  }
}
