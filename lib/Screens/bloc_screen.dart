import 'package:counter_app/blocs/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocScreen extends StatefulWidget {
  const BlocScreen({super.key});

  @override
  State<BlocScreen> createState() => _BlocScreenState();
}

class _BlocScreenState extends State<BlocScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'The value is: ${state.counter} ',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 20),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterIncreased(50));
                  },
                  heroTag: 1,
                  child: Text('+'),
                ),
                SizedBox(height: 20),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterDecreased(1));
                  },
                  heroTag: 2,
                  child: Text('-'),
                ),
                SizedBox(height: 20),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterReset(0));
                  },
                  heroTag: 3,
                  child: Icon(Icons.restore),
                ),
                SizedBox(height: 20),

                Text('Transactions counts: ${state.transactionCounter}'),
              ],
            );
          },
        ),
      ),
    );
  }
}
