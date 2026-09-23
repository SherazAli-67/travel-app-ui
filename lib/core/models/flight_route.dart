class FlightRoute {
  final String fromLabel;
  final String fromCity;
  final String fromTime;
  final String toLabel;
  final String toCity;
  final String toTime;
  final String departDate;
  final String arriveDate;
  final String travellerClass;
  final bool isOneWay;

  const FlightRoute({
    required this.fromLabel,
    required this.fromCity,
    required this.fromTime,
    required this.toLabel,
    required this.toCity,
    required this.toTime,
    required this.departDate,
    required this.arriveDate,
    required this.travellerClass,
    required this.isOneWay,
  });
}
