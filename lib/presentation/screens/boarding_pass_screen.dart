import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/constants/string_const.dart';
import 'package:travel_app/core/app_colors.dart';
import 'package:travel_app/core/app_data.dart';
import 'package:travel_app/core/app_icons.dart';
import 'package:travel_app/core/app_textstyles.dart';
import 'package:travel_app/core/models/boarding_pass.dart';
import 'package:travel_app/presentation/widgets/app_icon_button.dart';

class BoardingPassScreen extends StatelessWidget {
  const BoardingPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pass = AppData.boardingPass;
    return Scaffold(
      backgroundColor: AppColors.baseBlack,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: .fromLTRB(26, 12, 26, 32),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 24,
            children: [
              _buildBackButton(context),
              Text(StringConst.boardingPass, style: AppTextStyles.screenTitle,),
              _buildRouteSummary(pass),
              _buildTicketCard(pass),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Transform.rotate(
      angle: math.pi / 2,
      child: AppIconButton(
        iconPath: AppIcons.icBack,
        size: 33,
        onTap: () {
          if (context.canPop()) context.pop();
        },
      ),
    );
  }

  Widget _buildRouteSummary(BoardingPass pass) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      crossAxisAlignment: .center,
      children: [
        Text(pass.fromCode, style: AppTextStyles.airportCode,),
        SizedBox(
          width: 100,
          height: 110,
          child: Stack(
            alignment: .center,
            children: [
              Container(
                width: 86,
                height: 86,
                decoration: BoxDecoration(
                  shape: .circle,
                  border: .all(color: AppColors.white.withValues(alpha: 0.35), width: 1.2),
                ),
              ),
              Column(
                mainAxisSize: .min,
                spacing: 4,
                children: [
                  Transform.rotate(
                    angle: math.pi / 4,
                    child: AppIconButton(iconPath: AppIcons.icAeroplane, size: 28,),
                  ),
                  Text(pass.duration, style: AppTextStyles.duration,),
                ],
              ),
            ],
          ),
        ),
        Text(pass.toCode, style: AppTextStyles.airportCode,),
      ],
    );
  }

  Widget _buildTicketCard(BoardingPass pass) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: .circular(33),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          _buildTicketMap(),
          Padding(
            padding: .fromLTRB(26, 4, 26, 0),
            child: Column(
              crossAxisAlignment: .start,
              spacing: 8,
              children: [
                Image.asset(pass.airlineLogoPath, height: 52, fit: .contain, alignment: .centerLeft,),
                Text(StringConst.ticketPrice, style: AppTextStyles.ticketLabel,),
                Row(
                  crossAxisAlignment: .end,
                  spacing: 2,
                  children: [
                    Padding(
                      padding: .only(bottom: 2),
                      child: Text(pass.currency, style: AppTextStyles.ticketValue.copyWith(fontSize: 21),),
                    ),
                    Text(pass.price, style: AppTextStyles.ticketPrice,),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: .symmetric(horizontal: 26),
            child: _buildDashedLine(),
          ),
          Padding(
            padding: .fromLTRB(26, 24, 26, 28),
            child: Column(
              spacing: 28,
              children: [
                Row(
                  children: [
                    Expanded(child: _buildTicketField(StringConst.depart, pass.departDate),),
                    Expanded(child: _buildTicketField(StringConst.gate, pass.gate),),
                    Expanded(child: _buildTicketField(StringConst.flightNumber, pass.flightNumber),),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: _buildTicketField(StringConst.arrive, pass.arriveDate),),
                    Expanded(child: _buildTicketField(StringConst.seat, pass.seat),),
                    Expanded(child: _buildTicketField(StringConst.travelClass, pass.travelClass),),
                  ],
                ),
              ],
            ),
          ),
          _buildPerforationSection(),
          Padding(
            padding: .fromLTRB(26, 18, 26, 28),
            child: Column(
              spacing: 16,
              children: [
                Text(StringConst.boardingPass, style: AppTextStyles.ticketValue,),
                Image.asset(pass.barcodePath, height: 80, width: double.infinity, fit: .contain,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTicketMap() {
    return SizedBox(
      height: 190,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(33),
          topRight: Radius.circular(33),
        ),
        child: Stack(
          children: [
            Positioned(
              left: -100,
              right: -60,
              top: -30,
              bottom: -50,
              child: Opacity(
                opacity: 0.32,
                child: SvgPicture.asset(
                  AppIcons.imgEarthMap,
                  fit: .cover,
                  colorFilter: .mode(const Color(0xFFB0B0B0), .srcIn),
                ),
              ),
            ),
            const Positioned.fill(child: CustomPaint(painter: _FlightPathPainter(),),),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketField(String label, String value) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 6,
      children: [
        Text(label, style: AppTextStyles.ticketLabel,),
        Text(value, style: AppTextStyles.ticketValue,),
      ],
    );
  }

  Widget _buildDashedLine({double dashWidth = 5, double dashSpace = 4}) {
    return CustomPaint(
      painter: _DashedLinePainter(color: const Color(0xFFD0D0D0), dashWidth: dashWidth, dashSpace: dashSpace,),
      child: const SizedBox(height: 1.2, width: double.infinity,),
    );
  }

  Widget _buildPerforationSection() {
    return SizedBox(
      height: 24,
      width: double.infinity,
      child: Stack(
        clipBehavior: .none,
        alignment: .center,
        children: [
          Padding(
            padding: .symmetric(horizontal: 24),
            child: _buildDashedLine(dashWidth: 6, dashSpace: 5),
          ),
          Positioned(left: -12, child: _buildNotch(),),
          Positioned(right: -12, child: _buildNotch(),),
        ],
      ),
    );
  }

  Widget _buildNotch() {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: AppColors.baseBlack,
        shape: .circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.brandLime.withValues(alpha: 0.9),
            blurRadius: 12,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            color: AppColors.brandLime,
            shape: .circle,
          ),
        ),
      ),
    );
  }
}

class _FlightPathPainter extends CustomPainter {
  const _FlightPathPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final pathPaint = Paint()
      ..color = AppColors.brandLime
      ..style = .stroke
      ..strokeWidth = 2
      ..strokeCap = .round;

    final start = Offset(size.width * 0.28, size.height * 0.62);
    final end = Offset(size.width * 0.72, size.height * 0.48);
    final control = Offset(size.width * 0.52, size.height * 0.18);

    final path = Path()
      ..moveTo(start.dx, start.dy)
      ..quadraticBezierTo(control.dx, control.dy, end.dx, end.dy);

    _drawDashedPath(canvas, path, pathPaint, 7, 5);

    final glowPaint = Paint()
      ..color = AppColors.brandLime.withValues(alpha: 0.45)
      ..maskFilter = const MaskFilter.blur(.normal, 6);

    canvas.drawCircle(start, 7, glowPaint);
    canvas.drawCircle(end, 7, glowPaint);

    final dotPaint = Paint()..color = AppColors.brandLime;
    canvas.drawCircle(start, 4.5, dotPaint);
    canvas.drawCircle(end, 4.5, dotPaint);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint, double dashWidth, double dashSpace) {
    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final next = math.min(distance + dashWidth, metric.length);
        canvas.drawPath(metric.extractPath(distance, next), paint);
        distance = next + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _DashedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;

  _DashedLinePainter({
    required this.color,
    this.dashWidth = 5,
    this.dashSpace = 4,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.2
      ..style = .stroke;

    var x = 0.0;
    while (x < size.width) {
      canvas.drawLine(Offset(x, 0), Offset(math.min(x + dashWidth, size.width), 0), paint);
      x += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
