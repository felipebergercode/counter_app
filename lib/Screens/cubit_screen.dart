import 'package:counter_app/cubits/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CubitScreen extends StatefulWidget {
  const CubitScreen({super.key});

  @override
  State<CubitScreen> createState() => _CubitScreenState();
}

class _CubitScreenState extends State<CubitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          buildWhen: (previous, current) => previous.counter != current.counter,
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'The value is ${state.counter}',
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterCubit>().increaseBy();
                  },
                  heroTag: 1,
                  child: const Icon(Icons.add),
                ),

                const SizedBox(height: 10),

                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterCubit>().decreaseBy();
                  },
                  heroTag: 2,
                  child: const Icon(Icons.remove),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    context.read<CounterCubit>().resetValue();
                    print('El value cambio');
                  },
                  child: const Text('Reset'),
                ),

                const SizedBox(height: 10),

                Text('Transaction Counts: ${state.transactionCounter}'),

                const SizedBox(height: 50),

                SizedBox(
                  width: 200,
                  child: FloatingActionButton(
                    onPressed: () {
                      context.push('/transactionCount');
                    },
                    child: const Text('Transaction Count Page'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
