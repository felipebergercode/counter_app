import 'package:counter_app/cubit/balance/balance_cubit.dart';
import 'package:counter_app/cubit/userName/user_name_cubit.dart';
import 'package:counter_app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserNameCubit()),
        BlocProvider(create: (context) => BalanceCubit()),
      ],
      child: MaterialApp.router(routerConfig: app_router),
    );
  }
}
