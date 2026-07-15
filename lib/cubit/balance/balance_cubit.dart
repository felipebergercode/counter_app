import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'balance_state.dart';

class BalanceCubit extends Cubit<BalanceState> {
  BalanceCubit() : super(BalanceInitial());

  void newBalance(int value) {
    emit(state.copyWith(balance: value));
  }
}
