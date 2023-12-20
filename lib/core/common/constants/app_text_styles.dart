import 'package:flutter/material.dart';
import 'package:teste_firebase_web/core/common/constants/app_colors.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get primary => 'Avenir';

  TextStyle get bold => const TextStyle(fontWeight: FontWeight.w700);
  TextStyle get light => const TextStyle(fontWeight: FontWeight.w300);
  TextStyle get regular => const TextStyle(fontWeight: FontWeight.w500);

  TextStyle get titleGrey => bold.copyWith(fontSize: 30, color: AppColors.grey700);
  TextStyle get titleWhite => bold.copyWith(fontSize: 30, color: AppColors.white);
  TextStyle get titleGreen => bold.copyWith(fontSize: 30, color: AppColors.primary);

  TextStyle get item => regular.copyWith(fontSize: 12, color: AppColors.grey400);
  TextStyle get itemNavBarUnselected => regular.copyWith(fontSize: 14, color: AppColors.grey600);
  TextStyle get itemNavBarSelected => regular.copyWith(fontSize: 14, color: AppColors.white);

  TextStyle get buttonTextWhite => bold.copyWith(fontSize: 15, color: AppColors.white);
  TextStyle get buttonTextBlack => bold.copyWith(fontSize: 15, color: AppColors.grey600);
}

extension AppTextStyles on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}
