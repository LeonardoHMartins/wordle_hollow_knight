import 'package:flutter/material.dart';
import 'package:teste_firebase_web/core/common/constants/app_colors.dart';

class ContainerGames extends StatelessWidget {
  const ContainerGames({super.key, required this.title, required this.subTitle, this.onTap, this.width});
  final String title;
  final String subTitle;
  final double? width;
  final Future Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.secondary,
          border: Border.all(width: 2, color: AppColors.primary),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16, color: AppColors.white, fontWeight: FontWeight.w500),
              ),
              Text(
                subTitle,
                style: const TextStyle(fontSize: 12, color: AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
