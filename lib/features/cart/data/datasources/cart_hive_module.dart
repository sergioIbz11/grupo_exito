import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

const String cartBoxName = 'cart_box';

@module
abstract class CartHiveModule {
  @preResolve
  @Named(cartBoxName)
  Future<Box<int>> get cartBox => Hive.openBox<int>(cartBoxName);
}
