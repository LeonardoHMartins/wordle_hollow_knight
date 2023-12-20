import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste_firebase_web/core/common/constants/app_colors.dart';
import 'package:teste_firebase_web/core/common/extensions/widget_extension.dart';

class Input extends StatefulWidget {
  final Widget? label;
  final TextInputType keyboard;
  final TextEditingController controller;
  final bool enableInteractiveSelection;
  final String? Function(String?)? validation;
  final AutovalidateMode autovalidateMode;
  final List<TextInputFormatter>? formatter;
  final String? hint;
  final int? minLines;
  final int? maxLines;
  final bool readOnly;
  final bool showError;
  final bool? errorValidate;
  final Function(String?)? onChange;
  final Function()? onTap;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final bool? showPrefixIcon;
  final bool? hasError;
  final Color? backgroundColor;
  final Color? textColor;
  final double? textSize;
  final bool? isDense;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final bool? lineThrough;

  final bool isSearch;
  final void Function()? searchAction;

  const Input(
    this.controller, {
    super.key,
    this.label,
    this.keyboard = TextInputType.text,
    this.formatter,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.enableInteractiveSelection = true,
    this.hint,
    this.minLines,
    this.maxLines,
    this.readOnly = false,
    this.showError = true,
    this.onTap,
    this.onChange,
    this.focusNode,
    this.prefixIcon,
    this.showPrefixIcon = false,
    this.hasError = false,
    this.backgroundColor = Colors.white,
    this.textColor,
    this.textSize,
    this.isDense,
    this.contentPadding,
    this.textAlign,
    this.fontWeight,
    this.lineThrough,
    this.errorValidate,
  })  : isSearch = false,
        searchAction = null;

  const Input.primary(
    this.controller, {
    super.key,
    this.label,
    this.keyboard = TextInputType.text,
    this.formatter,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.enableInteractiveSelection = true,
    this.hint,
    this.minLines,
    this.maxLines,
    this.readOnly = false,
    this.showError = true,
    this.onTap,
    this.onChange,
    this.focusNode,
    this.prefixIcon,
    this.showPrefixIcon = false,
    this.hasError = false,
    this.backgroundColor = Colors.white,
    this.textColor,
    this.textSize,
    this.isDense,
    this.contentPadding,
    this.textAlign,
    this.fontWeight,
    this.lineThrough,
    this.errorValidate,
  })  : isSearch = false,
        searchAction = null;

  const Input.email(
    this.controller, {
    super.key,
    this.label,
    this.keyboard = TextInputType.emailAddress,
    this.formatter,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.enableInteractiveSelection = true,
    this.hint,
    this.minLines,
    this.maxLines,
    this.readOnly = false,
    this.showError = true,
    this.onTap,
    this.onChange,
    this.focusNode,
    this.prefixIcon,
    this.showPrefixIcon = false,
    this.hasError = false,
    this.backgroundColor = Colors.white,
    this.textColor,
    this.textSize,
    this.isDense,
    this.contentPadding,
    this.textAlign,
    this.fontWeight,
    this.lineThrough,
    this.errorValidate,
  })  : isSearch = false,
        searchAction = null;

  const Input.availability(
    this.controller, {
    super.key,
    this.label,
    this.keyboard = TextInputType.none,
    this.formatter,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.enableInteractiveSelection = false,
    this.hint,
    this.minLines = 1,
    this.maxLines = 1,
    this.readOnly = true,
    this.showError = false,
    this.onTap,
    this.onChange,
    this.focusNode,
    this.prefixIcon,
    this.showPrefixIcon = false,
    this.hasError = false,
    this.backgroundColor = AppColors.grey200,
    this.textColor = AppColors.secondary,
    this.textSize = 12,
    this.isDense = true,
    this.contentPadding = const EdgeInsets.fromLTRB(8, 8, 8, 8),
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.bold,
    this.lineThrough,
    this.errorValidate,
  })  : isSearch = false,
        searchAction = null;

  const Input.password(
    this.controller, {
    super.key,
    this.label,
    this.keyboard = TextInputType.visiblePassword,
    this.formatter,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.enableInteractiveSelection = true,
    this.hint,
    this.minLines,
    this.maxLines,
    this.readOnly = false,
    this.showError = true,
    this.onTap,
    this.onChange,
    this.focusNode,
    this.prefixIcon,
    this.showPrefixIcon = false,
    this.hasError = false,
    this.backgroundColor = Colors.white,
    this.textColor,
    this.textSize,
    this.isDense,
    this.contentPadding,
    this.textAlign,
    this.fontWeight,
    this.lineThrough,
    this.errorValidate,
  })  : isSearch = false,
        searchAction = null;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    Widget? suffix;

    if (widget.keyboard == TextInputType.visiblePassword) {
      suffix = widget.keyboard == TextInputType.visiblePassword
          ? IconButton(
              color: AppColors.black.withOpacity(0.5),
              splashColor: Colors.transparent,
              splashRadius: 0.1,
              icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
              onPressed: () => setState(() => visible = !visible),
            )
          : null;
    } else if (widget.isSearch) {
      suffix = IconButton(
        color: AppColors.black.withOpacity(0.8),
        icon: const Icon(Icons.search),
        onPressed: widget.searchAction,
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (widget.showPrefixIcon ?? false)
              Padding(
                padding: EdgeInsets.only(bottom: widget.errorValidate != null && widget.errorValidate == true ? 25 : 0),
                child: Container(
                  height: 56,
                  width: 56,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                    color: AppColors.white,
                  ),
                  child: widget.prefixIcon,
                ),
              ),
            if (widget.showPrefixIcon ?? false)
              const SizedBox(
                height: 56,
                width: 2,
              ),
            TextFormField(
              key: widget.key,
              controller: widget.controller,
              autovalidateMode: widget.autovalidateMode,
              textAlign: widget.textAlign ?? TextAlign.start,
              validator: widget.validation,
              inputFormatters: widget.formatter,
              keyboardType: widget.keyboard,
              minLines: widget.minLines,
              maxLines: widget.maxLines ?? 1,
              readOnly: widget.readOnly,
              enableInteractiveSelection: widget.enableInteractiveSelection,
              obscureText: widget.keyboard == TextInputType.visiblePassword ? !visible : false,
              onChanged: widget.onChange,
              onTap: widget.onTap,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              focusNode: widget.focusNode,
              style: TextStyle(
                color: widget.textColor ?? AppColors.grey900,
                fontSize: widget.textSize ?? 15,
                fontWeight: widget.fontWeight ?? FontWeight.w500,
                decoration: widget.lineThrough ?? false ? TextDecoration.lineThrough : null,
              ),
              decoration: InputDecoration(
                errorStyle: widget.showError
                    ? const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      )
                    : const TextStyle(
                        color: Colors.transparent,
                        fontSize: 0,
                      ),
                isDense: widget.isDense,
                contentPadding: widget.contentPadding,
                fillColor: widget.backgroundColor,
                suffixIcon: suffix,
                label: widget.label,
                hintText: widget.hint,
                hintStyle: const TextStyle(color: Colors.grey),
                focusedBorder: widget.readOnly
                    ? OutlineInputBorder(
                        borderSide: const BorderSide(width: 0, color: Colors.transparent),
                        borderRadius: BorderRadius.only(
                          bottomRight: const Radius.circular(10),
                          topRight: const Radius.circular(10),
                          topLeft: widget.showPrefixIcon ?? false ? Radius.zero : const Radius.circular(10),
                          bottomLeft: widget.showPrefixIcon ?? false ? Radius.zero : const Radius.circular(10),
                        ),
                      )
                    : OutlineInputBorder(
                        borderSide: const BorderSide(width: 2, color: AppColors.grey200),
                        borderRadius: BorderRadius.only(
                          bottomRight: const Radius.circular(10),
                          topRight: const Radius.circular(10),
                          topLeft: widget.showPrefixIcon ?? false ? Radius.zero : const Radius.circular(10),
                          bottomLeft: widget.showPrefixIcon ?? false ? Radius.zero : const Radius.circular(10),
                        ),
                      ),
                enabledBorder: widget.readOnly
                    ? OutlineInputBorder(
                        borderSide: const BorderSide(width: 0, color: Colors.transparent),
                        borderRadius: BorderRadius.only(
                          bottomRight: const Radius.circular(10),
                          topRight: const Radius.circular(10),
                          topLeft: widget.showPrefixIcon ?? false ? Radius.zero : const Radius.circular(10),
                          bottomLeft: widget.showPrefixIcon ?? false ? Radius.zero : const Radius.circular(10),
                        ),
                      )
                    : OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: widget.hasError ?? false ? Colors.red : AppColors.white),
                        borderRadius: BorderRadius.only(
                          bottomRight: const Radius.circular(10),
                          topRight: const Radius.circular(10),
                          topLeft: widget.showPrefixIcon ?? false ? Radius.zero : const Radius.circular(10),
                          bottomLeft: widget.showPrefixIcon ?? false ? Radius.zero : const Radius.circular(10),
                        ),
                      ),
                errorBorder: widget.readOnly
                    ? OutlineInputBorder(
                        borderSide: const BorderSide(width: 0, color: Colors.transparent),
                        borderRadius: BorderRadius.only(
                          bottomRight: const Radius.circular(10),
                          topRight: const Radius.circular(10),
                          topLeft: widget.showPrefixIcon ?? false ? Radius.zero : const Radius.circular(10),
                          bottomLeft: widget.showPrefixIcon ?? false ? Radius.zero : const Radius.circular(10),
                        ),
                      )
                    : OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: Colors.red),
                        borderRadius: BorderRadius.only(
                          bottomRight: const Radius.circular(10),
                          topRight: const Radius.circular(10),
                          topLeft: widget.showPrefixIcon ?? false ? const Radius.circular(3) : const Radius.circular(10),
                          bottomLeft: widget.showPrefixIcon ?? false ? const Radius.circular(3) : const Radius.circular(10),
                        ),
                      ),
              ),
            ).expanded(),
          ],
        ),
      ],
    );
  }
}
