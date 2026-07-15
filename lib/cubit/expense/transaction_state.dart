part of 'transaction_cubit.dart';

class TransactionState extends Equatable {
  const TransactionState({this.transactions = const []});

  final List<TransactionModel> transactions;

  TransactionState copyWith({List<TransactionModel>? transactions}) {
    return TransactionState(transactions: transactions ?? this.transactions);
  }

  @override
  List<Object> get props => [transactions];
}
