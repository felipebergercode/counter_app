import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void increaseBy() {
    emit(
      state.copyWith(
        counter: state.counter + 1,
        transactionCounter: state.transactionCounter + 1,
      ),
    );
  }

  void decreaseBy() {
    emit(
      state.copyWith(
        counter: state.counter - 1,
        transactionCounter: state.transactionCounter + 1,
      ),
    );
  }

  void resetValue() {
    emit(
      state.copyWith(
        counter: 0,
        transactionCounter: state.transactionCounter + 1,
      ),
    );
  }
}
