import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'username_state.dart';

class UsernameCubit extends Cubit<UsernameState> {
  UsernameCubit() : super(UsernameInitial());


  void usernameChanged(String value){
    emit(state.copyWith(username: value));
  }
}
