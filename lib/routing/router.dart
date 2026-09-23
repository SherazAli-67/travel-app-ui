import 'package:go_router/go_router.dart';
import 'package:travel_app/presentation/screens/home_screen.dart';

GoRouter router =  GoRouter(
  initialLocation: NamedRoutes.home.routeName,
  routes: [
    GoRoute(path:  NamedRoutes.home.routeName, builder: (_, state)=> HomeScreen())
  ],
);

enum NamedRoutes {
  home('/home');

  final String routeName;
  const NamedRoutes(this.routeName);
}