import 'package:open_fashion/core/utils/app_strings.dart';
import '../core/utils/assets.dart';

class ProductModel {
  final String image;
  final String name;
  final double price;
  final String description;

  ProductModel({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });


  static List<ProductModel> products = [
    ProductModel(
      image: AppImages.product6,
      name: AppStrings.october,
      price: 110.0,
      description: AppStrings.reversibleAngoraCardigan,
    ),
    ProductModel(
      image: AppImages.product1,
      name: AppStrings.october,
      price: 100.0,
      description: AppStrings.reversibleAngoraCardigan,
    ),
    ProductModel(
      image: AppImages.product3,
      name: AppStrings.october,
      price: 40.0,
      description: AppStrings.reversibleAngoraCardigan,
    ),
    ProductModel(
      image: AppImages.product4,
      name: AppStrings.october,
      price: 120.0,
      description: AppStrings.reversibleAngoraCardigan,
    ),
    ProductModel(
      image: AppImages.product2,
      name: AppStrings.october,
      price: 200.0,
      description: AppStrings.reversibleAngoraCardigan,
    ),
    ProductModel(
      image: AppImages.product3,
      name: AppStrings.october,
      price: 140.0,
      description: AppStrings.reversibleAngoraCardigan,
    ),
  ];

}