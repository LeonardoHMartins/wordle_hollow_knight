import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:teste_firebase_web/core/common/constants/app_colors.dart';
import 'package:teste_firebase_web/core/common/extensions/context_extension.dart';
import 'package:teste_firebase_web/core/common/utils/custom_dialog_utils.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({
    super.key,
    this.showBackButton = true,
    this.onBack,
    this.backText,
    required this.child,
    this.bottom,
    this.top,
    this.topSize = 30,
    this.bottomSize = 30,
    this.dimissAction,
    this.backgroundColor = Colors.white,
    this.dismissible = false,
  });

  final Color backgroundColor;
  final bool showBackButton;
  final bool dismissible;
  final String? backText;
  final Function()? onBack;
  final Widget child;
  final Widget? bottom;
  final double bottomSize;
  final Widget? top;
  final double topSize;
  final Function()? dimissAction;

  @override
  State<CustomDialog> createState() => _CustomDialogState();

  Future<T?> show<T>(BuildContext context) {
    return showCustomDialog<T>(context, child: this);
  }
}

class _CustomDialogState extends State<CustomDialog> {
  Widget _content(BuildContext context) => SafeArea(
        child: GestureDetector(
          onTap: () => widget.dismissible ? Navigator.pop(context) : null,
          child: Container(
            height: context.heightPx,
            width: context.widthPx,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (widget.showBackButton)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.grey200.withOpacity(0.3),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15),
                            onTap: widget.onBack ?? () => Navigator.pop(context),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.arrow_back_ios_new,
                                    color: AppColors.white,
                                  ),
                                  const Gap(5),
                                  Text(
                                    widget.backText ?? 'FECHAR',
                                    style: const TextStyle(color: AppColors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.redAccent.withOpacity(0.6),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: const Icon(
                                Icons.close,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                const Gap(10),
                Flexible(
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.top != null) ...[
                          Container(
                            padding: const EdgeInsets.only(
                              bottom: 10,
                              left: 30,
                              right: 30,
                              top: 20,
                            ),
                            child: widget.top!,
                          ),
                        ],
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 30,
                                right: 30,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: widget.backgroundColor,
                              ),
                              constraints: BoxConstraints(
                                maxHeight: (context.heightPx * 0.9) - (widget.bottom != null ? widget.bottomSize : 0) - (widget.top != null ? widget.topSize : 0),
                              ),
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: widget.child,
                              ),
                            ),
                          ),
                        ),
                        if (widget.bottom != null)
                          Container(
                            padding: const EdgeInsets.only(
                              bottom: 20,
                              left: 30,
                              right: 30,
                              top: 10,
                            ),
                            color: Colors.white,
                            child: widget.bottom!,
                          ),
                      ],
                    ),
                  ),
                ),
                Gap(MediaQuery.viewInsetsOf(context).bottom),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return _content(context);
  }
}
