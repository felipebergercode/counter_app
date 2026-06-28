import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncreased>((event, emit) {
      emit(
        state.copyWith(
          counter: state.counter + event.value,
          transactionCounter: state.transactionCounter + 1,
        ),
      );
    });

    on<CounterDecreased>((event, emit) {
      emit(
        state.copyWith(
          counter: state.counter - event.value,
          transactionCounter: state.transactionCounter + 1,
        ),
      );
    });

    on<CounterReset>((event, emit) {
      emit(
        state.copyWith(
          counter: 0,
          transactionCounter: state.transactionCounter + 1,
        ),
      );
    });
  }
}
