import 'package:teste_firebase_web/core/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension Expanding on Widget {
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  Widget expandedH({int flex = 1}) => Row(children: [Expanded(flex: flex, child: this)]);
}

extension Heroic on Widget {
  Widget hero(String? tag) => tag != null
      ? Hero(
          transitionOnUserGestures: true,
          tag: tag,
          child: this,
        )
      : this;
}

extension Shimmer on Widget {
  Widget shim() => animate(onPlay: (controller) => controller.repeat()).shimmer(duration: 3.seconds, color: AppColors.grey50.withOpacity(0.3));
}
