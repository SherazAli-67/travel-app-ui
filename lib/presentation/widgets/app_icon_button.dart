import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/core/app_colors.dart';

class AppIconButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback? onTap;
  final double size;
  final Color color;

  const AppIconButton({
    super.key,
    required this.iconPath,
    this.onTap,
    this.size = 32,
    this.color = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        iconPath,
        width: size,
        height: size,
        colorFilter: .mode(color, .srcIn),
      ),
    );
  }
}
