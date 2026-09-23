import 'package:flutter/material.dart';
import 'package:travel_app/core/app_colors.dart';
import 'package:travel_app/core/app_textstyles.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final double height;
  final double borderRadius;
  final double? width;

  const PrimaryButton({
    super.key,
    required this.label,
    this.onTap,
    this.backgroundColor = AppColors.brandLime,
    this.textStyle,
    this.height = 52,
    this.borderRadius = 10,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height,
        alignment: .center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: .circular(borderRadius),
        ),
        child: Text(label, style: textStyle ?? AppTextStyles.buttonBlack,),
      ),
    );
  }
}
