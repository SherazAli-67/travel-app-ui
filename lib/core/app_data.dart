import 'package:travel_app/core/app_icons.dart';
import 'package:travel_app/core/models/boarding_pass.dart';
import 'package:travel_app/core/models/destination.dart';
import 'package:travel_app/core/models/flight_route.dart';
import 'package:travel_app/core/models/offer.dart';
import 'package:travel_app/core/models/traveller_profile.dart';

class AppData {
  static const profile = TravellerProfile(
    name: 'Shashi Kumar',
    subtitle: 'Premium Traveller',
    avatarPath: AppIcons.imgProfile,
  );

  static const destinations = [
    Destination(name: 'Singapore', imagePath: AppIcons.imgSingapore),
    Destination(name: 'Hong Kong', imagePath: AppIcons.imgHongKong),
    Destination(name: 'Bali', imagePath: AppIcons.imgBali),
  ];

  static const holidayPackages = [
    Offer(imagePath: AppIcons.imgHolidayPackage),
  ];

  static const offers = [
    Offer(imagePath: AppIcons.imgOfferBeach),
  ];

  static const flightRoute = FlightRoute(
    fromLabel: 'From CGK',
    fromCity: 'Bengaluru',
    fromTime: '23:21 (BLR)',
    toLabel: 'To BKK',
    toCity: 'Bangkok',
    toTime: '04:45 (BKK)',
    departDate: 'Sun, Jul 23',
    arriveDate: 'Mon, Jul 24',
    travellerClass: '1, Economy/Premium Economy',
    isOneWay: true,
  );

  static const boardingPass = BoardingPass(
    fromCode: 'BLR',
    toCode: 'BKK',
    duration: '3h 20m',
    currency: '\$',
    price: '170',
    departDate: 'Sun, Jul 23',
    arriveDate: 'Mon, Jul 24',
    gate: 'B7',
    seat: '21A',
    flightNumber: 'TG-326',
    travelClass: 'Business',
    airlineLogoPath: AppIcons.imgAirlineLogo,
    barcodePath: AppIcons.imgBarcode,
  );

  static const heroImagePath = AppIcons.imgHeroTravel;
}
