import 'dart:io';

import 'package:fruits_hub_admin/features/add_product/data/models/review_model.dart';
import 'package:fruits_hub_admin/features/add_product/domain/entities/product_entity.dart';

class ProductModel {
  final String name;
  final num price;
  final String code;
  final String description;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num averageRating;
  final num ratingCount;
  final int sellingCount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.name,
    required this.price,
    required this.code,
    required this.description,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationsMonths,
    this.isOrganic = false,
    required this.numberOfCalories,
    required this.unitAmount,
    this.averageRating = 0,
    this.ratingCount = 0,
    this.reviews = const [],
    this.sellingCount = 0,
  });

  factory ProductModel.fromEntity(ProductEntity addProductInputEntity) {
    return ProductModel(
      name: addProductInputEntity.name,
      price: addProductInputEntity.price,
      code: addProductInputEntity.code,
      description: addProductInputEntity.description,
      image: addProductInputEntity.image,
      isFeatured: addProductInputEntity.isFeatured,
      imageUrl: addProductInputEntity.imageUrl,
      expirationsMonths: addProductInputEntity.expirationsMonths,
      isOrganic: addProductInputEntity.isOrganic,
      numberOfCalories: addProductInputEntity.numberOfCalories,
      unitAmount: addProductInputEntity.unitAmount,
      reviews: addProductInputEntity.reviews
          .map((e) => ReviewModel.fromEntity(e))
          .toList(),
    );
  }

  toJson() {
    return {
      'name': name,
      'price': price,
      'code': code,
      'description': description,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'sellingCount': sellingCount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
