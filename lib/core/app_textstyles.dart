import 'package:flutter/material.dart';
import 'package:travel_app/constants/string_const.dart';
import 'package:travel_app/core/app_colors.dart';

class AppTextStyles {
  static const _font = StringConst.appFontFamily;

  static const screenTitle = TextStyle(
    fontFamily: _font,
    fontWeight: .w700,
    fontSize: 27,
    color: AppColors.white,
  );

  static const sectionTitle = TextStyle(
    fontFamily: _font,
    fontWeight: .w600,
    fontSize: 22,
    color: AppColors.brandLime,
  );

  static const cityName = TextStyle(
    fontFamily: _font,
    fontWeight: .w600,
    fontSize: 29,
    color: AppColors.brandLime,
  );

  static const airportCode = TextStyle(
    fontFamily: _font,
    fontWeight: .w500,
    fontSize: 41,
    color: AppColors.brandLime,
  );

  static const labelBold = TextStyle(
    fontFamily: _font,
    fontWeight: .w700,
    fontSize: 14,
    color: AppColors.muted,
  );

  static const labelWhite = TextStyle(
    fontFamily: _font,
    fontWeight: .w700,
    fontSize: 14,
    color: AppColors.baseLight,
  );

  static const valueSemiBold = TextStyle(
    fontFamily: _font,
    fontWeight: .w600,
    fontSize: 17,
    color: AppColors.brandLime,
  );

  static const bodyBold = TextStyle(
    fontFamily: _font,
    fontWeight: .w800,
    fontSize: 17,
    color: AppColors.white,
  );

  static const bodyMedium = TextStyle(
    fontFamily: _font,
    fontWeight: .w500,
    fontSize: 17,
    color: AppColors.baseBlack,
  );

  static const buttonBlack = TextStyle(
    fontFamily: _font,
    fontWeight: .w700,
    fontSize: 17,
    color: AppColors.baseBlack,
  );

  static const buttonLime = TextStyle(
    fontFamily: _font,
    fontWeight: .w700,
    fontSize: 17,
    color: AppColors.brandLime,
  );

  static const seeAll = TextStyle(
    fontFamily: _font,
    fontWeight: .w700,
    fontSize: 14,
    color: AppColors.baseLight,
  );

  static const profileName = TextStyle(
    fontFamily: _font,
    fontWeight: .w700,
    fontSize: 17,
    color: AppColors.white,
  );

  static const profileSubtitle = TextStyle(
    fontFamily: _font,
    fontWeight: .w400,
    fontSize: 14,
    color: AppColors.mutedGray,
  );

  static const destinationLabel = TextStyle(
    fontFamily: _font,
    fontWeight: .w400,
    fontSize: 14,
    color: AppColors.white,
  );

  static const heroTitle = TextStyle(
    fontFamily: _font,
    fontWeight: .w700,
    fontSize: 27,
    color: AppColors.baseBlack,
  );

  static const ticketLabel = TextStyle(
    fontFamily: _font,
    fontWeight: .w400,
    fontSize: 14,
    color: AppColors.ticketGray,
  );

  static const ticketValue = TextStyle(
    fontFamily: _font,
    fontWeight: .w700,
    fontSize: 16,
    color: AppColors.ticketText,
  );

  static const ticketPrice = TextStyle(
    fontFamily: _font,
    fontWeight: .w700,
    fontSize: 27,
    color: AppColors.ticketText,
  );

  static const duration = TextStyle(
    fontFamily: _font,
    fontWeight: .w400,
    fontSize: 16,
    color: AppColors.white,
  );
}
