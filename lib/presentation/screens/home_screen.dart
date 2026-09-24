import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/constants/string_const.dart';
import 'package:travel_app/core/app_colors.dart';
import 'package:travel_app/core/app_data.dart';
import 'package:travel_app/core/app_icons.dart';
import 'package:travel_app/core/app_textstyles.dart';
import 'package:travel_app/core/models/destination.dart';
import 'package:travel_app/presentation/widgets/app_icon_button.dart';
import 'package:travel_app/presentation/widgets/primary_button.dart';
import 'package:travel_app/presentation/widgets/section_header.dart';
import 'package:travel_app/routing/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseBlack,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: .fromLTRB(26, 16, 26, 32),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 20,
            children: [
              Column(
                crossAxisAlignment: .start,
                spacing: 32,
                children: [
                  _buildTopBar(context),
                  _buildProfileHeader(),
                ],
              ),
              _buildHeroCard(context),
              _buildDestinationSection(),
              _buildHolidayPackagesSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Row(
      children: [
        Transform.rotate(
          angle: math.pi / 2,
          child: AppIconButton(
            iconPath: AppIcons.icBack,
            onTap: () {
              if (context.canPop()) context.pop();
            },
          ),
        ),
        const Spacer(),
        Row(
          spacing: 34,
          children: [
            AppIconButton(iconPath: AppIcons.icSearch,),
            AppIconButton(iconPath: AppIcons.icNotification,),
            AppIconButton(iconPath: AppIcons.icFilter,),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileHeader() {
    final profile = AppData.profile;
    return Row(
      spacing: 16,
      children: [
        ClipOval(
          child: Image.asset(
            profile.avatarPath,
            width: 66,
            height: 66,
            fit: .cover,
          ),
        ),
        Column(
          crossAxisAlignment: .start,
          spacing: 2,
          children: [
            Text(profile.name, style: AppTextStyles.profileName,),
            Text(profile.subtitle, style: AppTextStyles.profileSubtitle,),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroCard(BuildContext context) {
    return ClipRRect(
      borderRadius: .circular(20),
      child: SizedBox(
        height: 262,
        width: double.infinity,
        child: Stack(
          children: [
            const ColoredBox(color: AppColors.brandLime, child: SizedBox.expand()),
            Positioned(
              left: -50,
              bottom: -4,
              top: -4,
              width: 280,
              child: Image.asset(
                AppData.heroImagePath,
                fit: .cover,
                alignment: .bottomLeft,
              ),
            ),
            Positioned(
              right: 0,
              top: 50,
              width: 210,
              child: Column(
                crossAxisAlignment: .start,
                spacing: 14,
                children: [
                  Text(StringConst.heroHeadline, style: AppTextStyles.heroTitle,),
                  PrimaryButton(
                    label: StringConst.findTrip,
                    width: 181,
                    height: 53,
                    borderRadius: 36,
                    backgroundColor: AppColors.baseBlack,
                    textStyle: AppTextStyles.buttonLime,
                    onTap: () => context.push(NamedRoutes.flightSearch.routeName),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDestinationSection() {
    return Column(
      crossAxisAlignment: .start,
      spacing: 20,
      children: [
        SectionHeader(title: StringConst.destination,),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: .horizontal,
            itemCount: AppData.destinations.length,
            separatorBuilder: (_, _) => const SizedBox(width: 9,),
            itemBuilder: (_, index) => _buildDestinationCard(AppData.destinations[index]),
          ),
        ),
      ],
    );
  }

  Widget _buildDestinationCard(Destination destination) {
    return SizedBox(
      width: 126,
      child: Column(
        spacing: 10,
        children: [
          ClipRRect(
            borderRadius: .circular(16),
            child: Image.asset(
              destination.imagePath,
              width: 126,
              height: 170,
              fit: .cover,
            ),
          ),
          Text(destination.name, style: AppTextStyles.destinationLabel, textAlign: .center,),
        ],
      ),
    );
  }

  Widget _buildHolidayPackagesSection() {
    return Column(
      crossAxisAlignment: .start,
      spacing: 20,
      children: [
        SectionHeader(title: StringConst.holidayPackages,),
        ClipRRect(
          borderRadius: .circular(20),
          child: Image.asset(
            AppData.holidayPackages.first.imagePath,
            width: double.infinity,
            height: 168,
            fit: .cover,
          ),
        ),
      ],
    );
  }
}
