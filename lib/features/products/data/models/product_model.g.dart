// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      slug: json['slug'] as String,
      price: (json['price'] as num).toInt(),
      description: json['description'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      creationAt: DateTime.parse(json['creationAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'price': instance.price,
      'description': instance.description,
      'images': instance.images,
      'creationAt': instance.creationAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
