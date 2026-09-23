class BoardingPass {
  final String fromCode;
  final String toCode;
  final String duration;
  final String currency;
  final String price;
  final String departDate;
  final String arriveDate;
  final String gate;
  final String seat;
  final String flightNumber;
  final String travelClass;
  final String airlineLogoPath;
  final String barcodePath;

  const BoardingPass({
    required this.fromCode,
    required this.toCode,
    required this.duration,
    required this.currency,
    required this.price,
    required this.departDate,
    required this.arriveDate,
    required this.gate,
    required this.seat,
    required this.flightNumber,
    required this.travelClass,
    required this.airlineLogoPath,
    required this.barcodePath,
  });
}
