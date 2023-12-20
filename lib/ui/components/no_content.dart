import 'package:flutter/material.dart';
import 'package:teste_firebase_web/core/common/constants/app_text_styles.dart';

class NoContent extends StatelessWidget {
  const NoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Nenhum conteúdo disponível no momento.',
        style: context.textStyles.item,
        textAlign: TextAlign.center,
      ),
    );
  }
}
