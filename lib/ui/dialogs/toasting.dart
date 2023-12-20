import 'package:auto_size_text/auto_size_text.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:gap/gap.dart';
import 'package:teste_firebase_web/core/common/constants/app_assets.dart';
import 'package:teste_firebase_web/core/common/constants/app_colors.dart';
import 'package:teste_firebase_web/core/common/constants/app_routes.dart';
import 'package:teste_firebase_web/core/common/extensions/context_extension.dart';
import 'package:teste_firebase_web/core/common/extensions/widget_extension.dart';

class Toasting {
  static void error(
    BuildContext context, {
    Color? textColor,
    String? title,
    String? subtitle,
    Duration? duration,
    Alignment? position,
  }) {
    if (!kIsWeb) {
      Vibrate.feedback(FeedbackType.error);
    }
    showNotification(
      context,
      color: Colors.white,
      title: title ?? 'Erro',
      textColor: textColor ?? AppColors.red_400,
      position: position,
      icon: const Icon(
        Icons.error,
        color: AppColors.red_400,
      ),
      duration: duration,
      subtitle: subtitle,
    );
  }

  static void info(
    BuildContext context, {
    String? title,
    String? subtitle,
    Duration? duration,
    Alignment? position,
  }) {
    if (!kIsWeb) {
      Vibrate.feedback(FeedbackType.success);
    }
    showNotification(
      context,
      color: Colors.blue,
      title: title ?? 'Info',
      position: position,
      icon: const Icon(
        Icons.info,
        color: AppColors.white,
      ),
      duration: duration,
      subtitle: subtitle,
    );
  }

  static void success(
    BuildContext context, {
    String? title,
    String? subtitle,
    Duration? duration,
    Alignment? position,
  }) {
    if (!kIsWeb) {
      Vibrate.feedback(FeedbackType.success);
    }
    showNotification(
      context,
      color: AppColors.white,
      title: title ?? 'Sucesso',
      position: position,
      icon: SvgPicture.asset(AppAssets.checked),
      // icon: Icon(
      //   Icons.check_circle,
      //   color: AppColors.green500,
      // ),
      duration: duration,
      subtitle: subtitle,
    );
  }

  static void noConnection(
    BuildContext context, {
    String? title,
    String? subtitle,
    Duration? duration,
    Alignment? position,
  }) {
    if (!kIsWeb) {
      Vibrate.feedback(FeedbackType.error);
    }
    showNotification(
      context,
      color: Colors.red,
      title: title ?? 'Sem conexão com a internet',
      position: position,
      icon: const Icon(
        Icons.wifi_off_rounded,
        color: AppColors.white,
      ),
      duration: duration,
      subtitle: subtitle,
    );
  }

  static void warning(
    BuildContext context, {
    String? title,
    String? subtitle,
    Duration? duration,
    Alignment? position,
  }) {
    if (!kIsWeb) {
      Vibrate.feedback(FeedbackType.warning);
    }
    showNotification(
      context,
      color: Colors.yellow.shade800,
      title: title ?? 'Aviso',
      position: position,
      icon: const Icon(
        Icons.warning,
        color: AppColors.white,
      ),
      duration: duration,
      subtitle: subtitle,
    );
  }

  static void showNotification(
    BuildContext context, {
    required Color color,
    required String title,
    String? subtitle,
    required Widget icon,
    Duration? duration,
    Alignment? position,
    Color? textColor,
    bool? notification,
  }) {
    BotToast.showCustomNotification(
      backButtonBehavior: BackButtonBehavior.close,
      duration: duration ?? const Duration(seconds: 3),
      align: position,
      toastBuilder: (close) {
        return GestureDetector(
          onTap: () {
            if (notification == true) {
              Modular.to.pushNamed(AppRoutes.notification);
              close();
            }
          },
          child: _CustomWidget(
            textColor: textColor,
            cancelFunc: close,
            title: title,
            color: color,
            subtitle: subtitle,
            icon: icon,
          ),
        );
      },
    );
  }
}

class _CustomWidget extends StatefulWidget {
  const _CustomWidget({
    required this.cancelFunc,
    required this.title,
    required this.color,
    this.textColor,
    this.subtitle,
    required this.icon,
  });

  final CancelFunc cancelFunc;
  final String title;
  final String? subtitle;
  final Widget icon;
  final Color color;
  final Color? textColor;

  @override
  _CustomWidgetState createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<_CustomWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(7),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(0.05),
            ),
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              constraints: const BoxConstraints(
                minHeight: 50,
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: widget.color,
                          ),
                          width: (context.widthPx - 20) * 0.2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Gap(((context.widthPx - 20) * 0.3) * 0.2),
                              widget.icon,
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(
                        (context.widthPx - 20) * 0.15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: widget.subtitle != null ? MainAxisAlignment.start : MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              widget.title,
                              maxLines: 1,
                              style: TextStyle(
                                color: widget.textColor ?? AppColors.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (widget.subtitle != null) ...[
                              const Gap(10),
                              Text(
                                widget.subtitle!,
                                style: TextStyle(
                                  color: widget.textColor?.withOpacity(0.8) ?? AppColors.primary.withOpacity(0.8),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ).expanded(),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: widget.cancelFunc,
                            child: const Padding(
                              padding: EdgeInsets.only(right: 10, top: 10),
                              child: Icon(Icons.close),
                            ),
                          ),
                        ],
                      ),
                    ],
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
