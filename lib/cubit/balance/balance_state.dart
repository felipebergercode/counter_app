part of 'balance_cubit.dart';

class BalanceState extends Equatable {
  final int balance;
  const BalanceState({this.balance = 0});

  BalanceState copyWith({int? balance}) {
    return BalanceState(balance: balance ?? this.balance);
  }

  @override
  List<Object> get props => [balance];
}

final class BalanceInitial extends BalanceState {}
