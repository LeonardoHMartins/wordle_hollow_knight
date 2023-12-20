import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:teste_firebase_web/core/common/constants/app_colors.dart';
import 'package:teste_firebase_web/core/common/constants/app_text_styles.dart';
import 'package:teste_firebase_web/core/common/extensions/widget_extension.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    this.hint,
    this.value,
    this.onChange,
    this.title,
    required this.values,
  });

  final String? hint;
  final String? value;
  final List<DropdownMenuItem<String>>? values;
  final String? title;
  final void Function(String?)? onChange;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            widget.title ?? '',
            style: context.textStyles.item.copyWith(fontSize: 14, color: AppColors.black),
          ),
        ),
        const Gap(2),
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            barrierColor: Colors.black.withOpacity(0.6),
            hint: Row(
              children: [
                const Icon(
                  Icons.list,
                  size: 16,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    widget.hint ?? 'Selecione',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: widget.values,
            value: widget.value,
            onChanged: widget.onChange,
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: 160,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.grey200,
                  width: 2,
                ),
                color: AppColors.white,
              ),
              elevation: 0,
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              iconSize: 14,
              iconEnabledColor: AppColors.primary,
              iconDisabledColor: AppColors.grey200,
            ),
            dropdownStyleData: DropdownStyleData(
              useRootNavigator: true,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: AppColors.grey200,
              ),
              offset: const Offset(0, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all(10),
                thumbVisibility: MaterialStateProperty.all(true),
                interactive: true,
              ),
            ),
            menuItemStyleData: MenuItemStyleData(
              height: 50,
              padding: const EdgeInsets.only(left: 20, right: 20),
              selectedMenuItemBuilder: (context, child) {
                return Stack(
                  children: [
                    Container(
                      color: AppColors.primary.withOpacity(0.25),
                      height: 50,
                    ),
                    child,
                  ],
                );
              },
              overlayColor: MaterialStatePropertyAll(AppColors.primary.withOpacity(0.25)),
            ),
          ),
        ).expandedH(),
      ],
    );
  }
}
