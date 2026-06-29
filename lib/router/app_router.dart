import 'package:counter_app/Screens/home_screen.dart';
import 'package:counter_app/Screens/login_screen.dart';
import 'package:counter_app/Screens/name_screen.dart';

import 'package:go_router/go_router.dart';

final app_router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => LoginScreen()),
    GoRoute(path: '/name', builder: (context, state) => NameScreen()),
    GoRoute(path: '/homescreen', builder: (context, state) => HomeScreen()),
  ],
);
