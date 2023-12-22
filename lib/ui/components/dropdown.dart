import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:teste_firebase_web/core/common/constants/app_colors.dart';
import 'package:teste_firebase_web/core/common/extensions/widget_extension.dart';

class Dropdown extends StatelessWidget {
  const Dropdown({super.key, this.selected, this.onTap, this.label, this.optional = false, this.hasDrop});
  final String? label;
  final Widget? selected;
  final bool optional;
  final void Function()? onTap;
  final bool? hasDrop;

  @override
  Widget build(BuildContext context) {
    var newChild = selected ??
        const Text(
          'Selecione',
        );
    if (newChild is Text) {
      newChild = Text(newChild.data!, style: const TextStyle(fontSize: 15)).expanded();
    }

    return Material(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            const Gap(10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: label,
                    style: const TextStyle(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (optional)
                    TextSpan(
                      text: ' (opcional)',
                      style: TextStyle(
                        color: AppColors.black.withOpacity(0.5),
                      ),
                    ),
                ],
              ),
            ),
            const Gap(10),
          ],
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(15),
            child: Container(
              // padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.secondary.withOpacity(0.5),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              width: double.infinity,
              child: Row(
                children: [
                  newChild,
                  Visibility(
                    visible: hasDrop != null ? false : true,
                    child: const Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
