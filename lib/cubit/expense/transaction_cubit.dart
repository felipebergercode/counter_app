import 'package:bloc/bloc.dart';
import 'package:counter_app/models/transaction_model.dart';
import 'package:equatable/equatable.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(const TransactionState());

  void addTransaction(TransactionModel transaction) {
    final List<TransactionModel> updatedTransactions = [
      transaction,
      ...state.transactions,
    ];

    emit(state.copyWith(transactions: updatedTransactions));
  }

  List<TransactionModel> getTransactionsByCategory(String category) {
    return state.transactions
        .where((transaction) => transaction.category == category)
        .toList();
  }

  double getTotalByCategory(String category) {
    return state.transactions
        .where((transactions) => transactions.category == category)
        .fold<double>(0, (total, transactions) => total + transactions.amount);
  }
}
