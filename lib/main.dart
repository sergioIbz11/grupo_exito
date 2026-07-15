import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/app/main_app.dart';
import 'core/di/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  await configureDependencies();
  runApp(
    const ProviderScope(child: MainApp()),
  );
}
