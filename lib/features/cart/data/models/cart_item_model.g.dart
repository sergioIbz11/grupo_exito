// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    _CartItemModel(
      id: json['id'] as String,
      units: (json['units'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CartItemModelToJson(_CartItemModel instance) =>
    <String, dynamic>{'id': instance.id, 'units': instance.units};
