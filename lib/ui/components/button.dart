import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:teste_firebase_web/core/common/constants/app_colors.dart';
import 'package:teste_firebase_web/core/common/extensions/color_extension.dart';
import 'package:teste_firebase_web/ui/components/loader.dart';
import 'package:teste_firebase_web/ui/dialogs/toasting.dart';

// Custom buttons are created by extending the MaterialButton class
class Button extends StatefulWidget {
  final Future<void> Function()? onPressed;
  final Widget? child;
  final ButtonStyle? style;
  final bool autofocus;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChange;
  final ValueChanged<bool>? onHover;
  final VoidCallback? onLongPress;
  final bool disabled;
  final bool showLoader;
  final Size? size;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  Button({
    super.key,
    required this.onPressed,
    required this.child,
    this.autofocus = false,
    this.focusNode,
    this.onFocusChange,
    this.onHover,
    this.onLongPress,
    this.size,
    this.disabled = false,
    this.showLoader = true,
    this.elevation,
    this.padding,
    this.color,
  }) : style = ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          elevation: MaterialStateProperty.all<double>(elevation ?? 2),
          backgroundColor: (disabled ? (color ?? AppColors.primary).withOpacity(0.4) : color ?? AppColors.primary).toMaterialStateProperty(),
          foregroundColor: (color == AppColors.white ? AppColors.black : AppColors.white).toMaterialStateProperty(),
          textStyle: const MaterialStatePropertyAll(
            TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            padding ?? const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          ),
        );

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isLoading = false;
  late Future<void> Function() action;

  @override
  void initState() {
    action = () async {
      if (!mounted) return;
      try {
        if (widget.onPressed == null) return;

        isLoading = true;
        if (!mounted) return;
        setState(() {});
        if (!kIsWeb) {
          Vibrate.feedback(FeedbackType.light);
        }
        await widget.onPressed!();

        isLoading = false;
        if (!mounted) return;
        setState(() {});
      } catch (err) {
        if (!mounted) return;
        Toasting.error(context, title: 'Erro: $err');
      }
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: !widget.disabled ? action : null,
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      onFocusChange: widget.onFocusChange,
      onHover: widget.onHover,
      onLongPress: !widget.disabled
          ? () {
              if (widget.onLongPress != null) {
                Vibrate.feedback(FeedbackType.light);
                widget.onLongPress!();
              }
            }
          : null,
      style: widget.style?.copyWith(
        fixedSize: widget.size != null ? MaterialStateProperty.all<Size>(widget.size!) : MaterialStateProperty.all<Size>(const Size.fromHeight(56)),
      ),
      child: widget.showLoader
          ? isLoading
              ? const Loader(size: 18, inverted: true)
              : widget.child
          : widget.child,
    );
  }
}
