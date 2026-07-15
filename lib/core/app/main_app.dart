import 'package:flutter/material.dart';

import '../router/app_router.dart';
import '../theme/app_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Grupo exito',
      routerConfig: appRouter,
      theme: AppTheme().getThemeData,
    );
  }
}
