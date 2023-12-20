import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:teste_firebase_web/core/common/constants/app_colors.dart';
import 'package:teste_firebase_web/ui/components/loader.dart';

Future<dynamic> loaderFullscreen(BuildContext context, {String? message}) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.7),
    transitionBuilder: (context, a1, a2, widget) {
      final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
      return Transform(
        transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
        child: Opacity(
          opacity: a1.value,
          child: Dialog.fullscreen(
            backgroundColor: Colors.transparent,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(60),
                decoration: BoxDecoration(
                  color: AppColors.grey200.withOpacity(0.9),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Loader(size: 50),
                    const Gap(10),
                    Text(
                      message ?? 'Carregando',
                      style: const TextStyle(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (BuildContext context, Animation<double> a1, Animation<double> a2) => const SizedBox.shrink(),
  );
}
