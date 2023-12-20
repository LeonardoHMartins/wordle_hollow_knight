import 'package:flutter/material.dart';
import 'package:teste_firebase_web/core/common/constants/app_colors.dart';

class ContainerStatusOS extends StatelessWidget {
  const ContainerStatusOS({super.key, required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
