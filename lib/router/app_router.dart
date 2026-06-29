import 'package:counter_app/Screens/login_screen.dart';
import 'package:go_router/go_router.dart';

final app_router = GoRouter(
  routes: [GoRoute(path: '/', builder: (context, state) => LoginScreen())],
);
