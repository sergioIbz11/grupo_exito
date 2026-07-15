import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_model.freezed.dart';
part 'cart_item_model.g.dart';

@freezed
abstract class CartItemModel with _$CartItemModel {
  const factory CartItemModel({
    required String id,
    int? units,
  }) = _CartItemModel;

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
}
