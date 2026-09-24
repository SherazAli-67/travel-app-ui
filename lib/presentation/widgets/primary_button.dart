import 'package:flutter/material.dart';
import 'package:travel_app/core/app_colors.dart';
import 'package:travel_app/core/app_textstyles.dart';

class PrimaryButton extends StatefulWidget {
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
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeInOut,
        child: Container(
          width: widget.width ?? double.infinity,
          height: widget.height,
          alignment: .center,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: .circular(widget.borderRadius),
          ),
          child: Text(widget.label, style: widget.textStyle ?? AppTextStyles.buttonBlack,),
        ),
      ),
    );
  }
}
