import 'package:go_router/go_router.dart';
import 'package:travel_app/presentation/screens/flight_search_screen.dart';
import 'package:travel_app/presentation/screens/home_screen.dart';

GoRouter router = GoRouter(
  initialLocation: NamedRoutes.home.routeName,
  routes: [
    GoRoute(path: NamedRoutes.home.routeName, builder: (_, state) => const HomeScreen(),),
    GoRoute(path: NamedRoutes.flightSearch.routeName, builder: (_, state) => const FlightSearchScreen(),),
  ],
);

enum NamedRoutes {
  home('/home'),
  flightSearch('/flight-search');

  final String routeName;
  const NamedRoutes(this.routeName);
}
