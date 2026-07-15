import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/responsive_grid.dart';
import '../../../../core/widgets/custom_search_app_bar.dart';
import '../../../cart/presentation/widgets/toggle_cart.dart';
import '../../../products/presentation/screens/products_screen.dart';
import '../providers/categories_provider.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends ConsumerWidget {
  static const String name = 'categories-screen';
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesState = ref.watch(categoriesProvider);

    return Scaffold(
      appBar: const CustomSearchAppBar(),
      body: categoriesState.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ocurrió un error: $error',
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () =>
                    ref.read(categoriesProvider.notifier).reloadCategories(),
                child: const Text('Reintentar'),
              ),
            ],
          ),
        ),
        data: (categories) {
          if (categories.isEmpty) {
            return const Center(child: Text('No hay categorías disponibles.'));
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ToggleCart(),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: .end,
                    children: [
                      Text(
                        'ver todos',
                        style: TextStyle(
                          fontWeight: .bold,
                        ),
                      ),
                    ],
                  ),
                ),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridCrossAxisCount(
                      MediaQuery.sizeOf(context).width,
                    ),
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return CategoryItem(
                      category: category,
                      onTap: () => context.pushNamed(
                        ProductsScreen.name,
                        pathParameters: {
                          'id': category.id.toString(),
                        },
                        queryParameters: {
                          'categoryName': category.slug,
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
