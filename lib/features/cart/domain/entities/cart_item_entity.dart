import 'package:flutter/widgets.dart';

class CartItemEntity {
  final String id;
  final int? units;

  CartItemEntity({required this.id, this.units});

  CartItemEntity copyWith({
    String? id,
    ValueGetter<int?>? units,
  }) {
    return CartItemEntity(
      id: id ?? this.id,
      units: units != null ? units() : this.units,
    );
  }
}
