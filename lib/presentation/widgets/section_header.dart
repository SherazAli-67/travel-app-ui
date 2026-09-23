import 'package:flutter/material.dart';
import 'package:travel_app/constants/string_const.dart';
import 'package:travel_app/core/app_textstyles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;
  final TextStyle? titleStyle;

  const SectionHeader({
    super.key,
    required this.title,
    this.onSeeAll,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title, style: titleStyle ?? AppTextStyles.sectionTitle,)),
        GestureDetector(
          onTap: onSeeAll,
          child: Text(StringConst.seeAll, style: AppTextStyles.seeAll,),
        ),
      ],
    );
  }
}
