import 'package:open_fashion/core/utils/app_strings.dart';
import 'package:open_fashion/core/utils/assets.dart';

class CoverModel {
  final String image;
  final String name;

  CoverModel({required this.name, required this.image});


  static List<CoverModel> covers = [
    CoverModel(name: AppStrings.blackCollection, image: AppImages.cover3),
    CoverModel(name: AppStrings.hiByHakim, image: AppImages.cover2),
    CoverModel(name: AppStrings.whiteCollection, image: AppImages.cover1),
  ];
}
