import 'package:go_router/go_router.dart';

import '../../features/categories/presentation/screens/categories_screen.dart';
import '../../features/products/presentation/screens/products_screen.dart';

final GoRouter appRouter = GoRouter(
  restorationScopeId: 'router',
  initialLocation: CategoriesScreen.name,

  routes: <RouteBase>[
    GoRoute(
      path: '/${CategoriesScreen.name}',
      name: CategoriesScreen.name,
      builder: (context, state) {
        return const CategoriesScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: '${ProductsScreen.name}/:id',
          name: ProductsScreen.name,
          builder: (context, state) {
            final id = int.parse(state.pathParameters['id']!);
            final categoryName = state.uri.queryParameters['categoryName'];
            return ProductsScreen(
              id: id,
              categoryName: categoryName,
            );
          },
        ),
      ],
    ),
  ],
);
