import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:teste_firebase_web/core/common/constants/app_assets.dart';
import 'package:teste_firebase_web/core/common/constants/app_colors.dart';

class SyncBadge extends StatefulWidget {
  final int number;
  final bool isSyncing;
  final bool isSimple;

  const SyncBadge({
    super.key,
    required this.number,
    required this.isSyncing,
    this.isSimple = false,
  });

  @override
  State<SyncBadge> createState() => _SyncBadgeState();
}

class _SyncBadgeState extends State<SyncBadge> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late int? number = widget.number;
  late bool isSyncing = widget.isSyncing;
  late bool isSimple = widget.isSimple;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 7));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isSyncing == true) {
      animationController.repeat();
    }

    if (widget.isSimple == true) {
      return _icon;
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Text(
              '${widget.number}',
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const Gap(5),
            _icon,
          ],
        ),
      ),
    );
  }

  Widget get _icon => (() {
        Color color = Colors.white;

        if (widget.isSimple) {
          color = AppColors.primary;
        }

        if (widget.isSyncing == false) {
          return SizedBox(
            height: 17.0,
            width: 17.0,
            child: SvgPicture.asset(AppAssets.car, colorFilter: ColorFilter.mode(color, BlendMode.srcIn), width: 17, height: 17),
          );
        }

        return AnimatedBuilder(
          animation: animationController,
          child: SizedBox(
            height: 17.0,
            width: 17.0,
            child: SvgPicture.asset(AppAssets.car, colorFilter: ColorFilter.mode(color, BlendMode.srcIn), width: 17, height: 17),
          ),
          builder: (BuildContext context, Widget? widget) {
            return Transform.rotate(
              angle: animationController.value * 6.3,
              child: widget,
            );
          },
        );
      })();
}
