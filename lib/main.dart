import 'package:counter_app/blocs/bloc/counter_bloc.dart';
import 'package:counter_app/cubits/cubit/counter_cubit.dart';
import 'package:counter_app/cubits/cubit/register_cubit.dart';
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
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => RegisterCubit()),
      ],
      child: MaterialApp.router(routerConfig: appRouter),
    );
  }
}
