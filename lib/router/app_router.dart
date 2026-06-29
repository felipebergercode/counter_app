import 'package:counter_app/Screens/bloc_screen.dart';
import 'package:counter_app/Screens/counter_transaction_screen.dart';
import 'package:counter_app/Screens/cubit_screen.dart';
import 'package:counter_app/Screens/home_screen.dart';
import 'package:counter_app/Screens/profile_screen.dart';
import 'package:counter_app/Screens/register_screen.dart';
import 'package:counter_app/Screens/settings_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),

    GoRoute(path: '/cubits', builder: (context, state) => const CubitScreen()),

    GoRoute(
      path: '/transactionCount',
      builder: (context, state) => CounterTransactionScreen(),
    ),

    GoRoute(path: '/bloc', builder: (context, state) => BlocScreen()),

    GoRoute(path: '/register', builder: (context, state) => RegisterScreen()),
    GoRoute(path: '/settings', builder: (context, state) => SettingsScreen()),
    GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
  ],
);
