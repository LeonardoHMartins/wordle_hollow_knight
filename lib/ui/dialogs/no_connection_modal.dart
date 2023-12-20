import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:teste_firebase_web/core/common/constants/app_colors.dart';
import 'package:teste_firebase_web/core/common/constants/app_text_styles.dart';
import 'package:teste_firebase_web/core/common/utils/custom_dialog_utils.dart';
import 'package:teste_firebase_web/ui/dialogs/custom_dialog.dart';

class NoConnectionModal extends StatefulWidget {
  const NoConnectionModal({super.key});

  static Future<void> show(BuildContext context) async {
    return showCustomDialog(context, child: const NoConnectionModal());
  }

  @override
  State<NoConnectionModal> createState() => _NoConnectionModalState();
}

class _NoConnectionModalState extends State<NoConnectionModal> {
  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      backgroundColor: AppColors.grey200,
      child: SizedBox(
        height: 300,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sem conexão',
                style: context.textStyles.item.copyWith(fontSize: 26),
                textAlign: TextAlign.center,
              ),
              const Gap(20),
              Text(
                'Conecte-se a internet e tente novamente para acessar o site.',
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
