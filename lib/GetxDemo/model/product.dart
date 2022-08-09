import 'package:get/state_manager.dart';

class Product {
  final int id;
  final String productName;
  final String productImage;
  final String? productDescription;
  final double? price;

  Product({
    required this.id,
    required this.productName,
    required this.productImage,
    this.productDescription,
    this.price,
  });

  final isFavorite = false.obs;
}