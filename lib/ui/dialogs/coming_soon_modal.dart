// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:gap/gap.dart';
import 'package:teste_firebase_web/core/common/constants/app_colors.dart';
import 'package:teste_firebase_web/core/common/constants/app_text_styles.dart';
import 'package:teste_firebase_web/core/common/utils/custom_dialog_utils.dart';
import 'package:teste_firebase_web/ui/dialogs/custom_dialog.dart';

class textItemModal extends StatefulWidget {
  const textItemModal({super.key});

  static Future<void> show(BuildContext context) async {
    Vibrate.feedback(FeedbackType.light);
    return showCustomDialog(context, child: const textItemModal());
  }

  @override
  State<textItemModal> createState() => _textItemModalState();
}

class _textItemModalState extends State<textItemModal> {
  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      backgroundColor: AppColors.grey200,
      dismissible: true,
      child: SizedBox(
        height: 300,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Em breve',
                style: context.textStyles.item.copyWith(fontSize: 26),
                textAlign: TextAlign.center,
              ),
              const Gap(20),
              Text(
                'Estamos trabalhando para trazer essa funcionalidade para você.',
                textAlign: TextAlign.center,
                style: context.textStyles.item,
              ),
              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}
