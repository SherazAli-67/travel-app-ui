import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/constants/string_const.dart';
import 'package:travel_app/core/app_colors.dart';
import 'package:travel_app/core/app_data.dart';
import 'package:travel_app/core/app_icons.dart';
import 'package:travel_app/core/app_textstyles.dart';
import 'package:travel_app/presentation/widgets/app_icon_button.dart';
import 'package:travel_app/presentation/widgets/fade_slide_in.dart';
import 'package:travel_app/presentation/widgets/primary_button.dart';
import 'package:travel_app/presentation/widgets/section_header.dart';
import 'package:travel_app/routing/router.dart';

class FlightSearchScreen extends StatefulWidget {
  const FlightSearchScreen({super.key});

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen> {
  late bool _isOneWay;
  late String _fromLabel;
  late String _fromCity;
  late String _fromTime;
  late String _toLabel;
  late String _toCity;
  late String _toTime;

  @override
  void initState() {
    super.initState();
    final route = AppData.flightRoute;
    _isOneWay = route.isOneWay;
    _fromLabel = route.fromLabel;
    _fromCity = route.fromCity;
    _fromTime = route.fromTime;
    _toLabel = route.toLabel;
    _toCity = route.toCity;
    _toTime = route.toTime;
  }

  void _swapAirports() {
    setState(() {
      final label = _fromLabel;
      final city = _fromCity;
      final time = _fromTime;
      _fromLabel = _toLabel;
      _fromCity = _toCity;
      _fromTime = _toTime;
      _toLabel = label;
      _toCity = city;
      _toTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    final route = AppData.flightRoute;
    return Scaffold(
      backgroundColor: AppColors.baseDark,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            FadeSlideIn(
              delay: Duration.zero,
              child: _buildMapHeader(),
            ),
            Padding(
              padding: .fromLTRB(26, 20, 26, 32),
              child: Column(
                crossAxisAlignment: .start,
                spacing: 20,
                children: [
                  FadeSlideIn(
                    delay: const Duration(milliseconds: 80),
                    child: _buildDateCard(route.departDate, route.arriveDate),
                  ),
                  FadeSlideIn(
                    delay: const Duration(milliseconds: 160),
                    child: _buildTravellerCard(route.travellerClass),
                  ),
                  FadeSlideIn(
                    delay: const Duration(milliseconds: 240),
                    child: PrimaryButton(
                      label: StringConst.searchFlight,
                      borderRadius: 10,
                      onTap: () => context.push(NamedRoutes.boardingPass.routeName),
                    ),
                  ),
                  FadeSlideIn(
                    delay: const Duration(milliseconds: 320),
                    child: _buildOffersSection(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapHeader() {
    return SizedBox(
      height: 430,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppIcons.bgLinesImg,), fit: .cover,),
              color: AppColors.baseBlack,
            ),
            padding: .symmetric(vertical: 56, horizontal: 10),
            height: 400,
            width: double.infinity,
            child: Row(
              spacing: 32,
              children: [
                SizedBox(
                  width: 32,
                  child: Column(
                    spacing: 14,
                    children: [
                      AppIconButton(
                        iconPath: AppIcons.icAeroplane,
                        onTap: _swapAirports,
                      ),
                      Expanded(
                        child: VerticalDivider(
                          color: AppColors.white.withValues(alpha: 0.75),
                          thickness: 1.2,
                          width: 32,
                        ),
                      ),
                      AppIconButton(
                        iconPath: AppIcons.icSwap,
                        onTap: _swapAirports,
                      ),
                      Expanded(
                        child: VerticalDivider(
                          color: AppColors.white.withValues(alpha: 0.75),
                          thickness: 1.2,
                          width: 32,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: 32,
                    children: [
                      _buildTopBar(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: .start,
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            _buildAirportRow(
                              label: _fromLabel,
                              city: _fromCity,
                              time: _fromTime,
                            ),
                            const Spacer(),
                            _buildAirportRow(
                              label: _toLabel,
                              city: _toCity,
                              time: _toTime,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 5,
            left: 20,
            right: 20,
            child: FadeSlideIn(
              delay: const Duration(milliseconds: 60),
              child: _buildTripTypeToggle(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      children: [
        Text(StringConst.plannedFlight, style: AppTextStyles.bodyBold,),
        Expanded(
          child: Row(
            spacing: 34,
            mainAxisAlignment: .end,
            children: [
              AppIconButton(iconPath: AppIcons.icSearch,),
              AppIconButton(iconPath: AppIcons.icNotification,),
              AppIconButton(iconPath: AppIcons.icFilter,),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAirportRow({
    required String label,
    required String city,
    required String time,
  }) {
    final disableAnim = MediaQuery.disableAnimationsOf(context);
    final row = Row(
      key: ValueKey('$label-$city-$time'),
      crossAxisAlignment: .center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            spacing: 4,
            children: [
              Text(label, style: AppTextStyles.labelBold,),
              Text(city, style: AppTextStyles.cityName,),
            ],
          ),
        ),
        Row(
          spacing: 8,
          children: [
            Text(time, style: AppTextStyles.bodyBold,),
            AppIconButton(iconPath: AppIcons.icTime, size: 28,),
          ],
        ),
      ],
    );
    if (disableAnim) return row;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 280),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      transitionBuilder: (child, animation) {
        final offset = Tween(begin: const Offset(0, 0.2), end: Offset.zero).animate(animation);
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: offset, child: child,),
        );
      },
      child: row,
    );
  }

  Widget _buildTripTypeToggle() {
    return Row(
      spacing: 14,
      children: [
        Expanded(
          child: _buildTripTypePill(
            label: StringConst.oneWay,
            isSelected: _isOneWay,
            onTap: () => setState(() => _isOneWay = true),
          ),
        ),
        Expanded(
          child: _buildTripTypePill(
            label: StringConst.roundTrip,
            isSelected: !_isOneWay,
            onTap: () => setState(() => _isOneWay = false),
          ),
        ),
      ],
    );
  }

  Widget _buildTripTypePill({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        height: 54,
        alignment: .center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.brandLime : AppColors.baseLight,
          borderRadius: .circular(36),
          border: isSelected ? null : .all(color: AppColors.borderGreen, width: 1.2),
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          style: isSelected ? AppTextStyles.buttonBlack : AppTextStyles.bodyMedium,
          child: Text(label),
        ),
      ),
    );
  }

  Widget _buildDateCard(String departDate, String arriveDate) {
    return Container(
      height: 92,
      padding: .symmetric(horizontal: 24, vertical: 18),
      decoration: BoxDecoration(
        color: AppColors.baseBlack,
        borderRadius: .circular(19),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .center,
              spacing: 4,
              children: [
                Text(StringConst.depart, style: AppTextStyles.labelWhite,),
                Text(departDate, style: AppTextStyles.valueSemiBold,),
              ],
            ),
          ),
          AppIconButton(iconPath: AppIcons.icCalendar, size: 29,),
          Expanded(
            child: Column(
              crossAxisAlignment: .end,
              mainAxisAlignment: .center,
              spacing: 4,
              children: [
                Text(StringConst.arrive, style: AppTextStyles.labelWhite,),
                Text(arriveDate, style: AppTextStyles.valueSemiBold,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTravellerCard(String travellerClass) {
    return Container(
      width: double.infinity,
      height: 92,
      padding: .only(left: 62),
      alignment: .center,
      decoration: BoxDecoration(
        color: AppColors.baseBlack,
        borderRadius: .circular(19),
      ),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .center,
        spacing: 4,
        children: [
          Text(StringConst.travellerAndClass, style: AppTextStyles.labelWhite,),
          Text(travellerClass, style: AppTextStyles.valueSemiBold,),
        ],
      ),
    );
  }

  Widget _buildOffersSection() {
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        SectionHeader(title: StringConst.offers,),
        ClipRRect(
          borderRadius: .circular(20),
          child: Image.asset(
            AppData.offers.first.imagePath,
            width: double.infinity,
            height: 200,
            fit: .cover,
          ),
        ),
      ],
    );
  }
}
