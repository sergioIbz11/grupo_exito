import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/responsive_grid.dart';
import '../../../../core/widgets/custom_search_app_bar.dart';
import '../providers/productos_provider.dart';
import '../widgets/product_item.dart';

class ProductsScreen extends ConsumerWidget {
  static const String name = 'products-screen';
  final int id;
  final String? categoryName;
  const ProductsScreen({required this.id, this.categoryName, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productsProvider(id));

    return Scaffold(
      appBar: const CustomSearchAppBar(),

      body: productsState.when(
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
                textAlign: .center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () =>
                    ref.read(productsProvider(id).notifier).reloadProducts(),
                child: const Text('Reintentar'),
              ),
            ],
          ),
        ),
        data: (products) {
          if (products.isEmpty) {
            return const Center(child: Text('No hay productos disponibles.'));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (categoryName != null)
                  Text(
                    categoryName!,
                    style: const TextStyle(fontWeight: .bold, fontSize: 20),
                  ),
                const SizedBox(height: 8.0),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridCrossAxisCount(
                      MediaQuery.sizeOf(context).width,
                    ),
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductItem(product: product);
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
