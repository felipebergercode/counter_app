import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  void emailChanged(String value) {
    final error = _validateEmail(value);
    emit(state.copyWith(email: value, emailError: error));
  }

  String? _validateEmail(String value) {
    if (value.isEmpty) return 'El email es obligatorio';
    if (!value.contains('@')) return 'Email inválido';
    return null;
  }

  Future<void> login({
    required String name,
    required String email,
    required String password,
  }) async {
    // final validation check
    if (state.emailError != null) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          message: 'Corrige los errores',
        ),
      );
      return;
    }

    emit(state.copyWith(status: RegisterStatus.loading, message: null));

    try {
      await Future.delayed(const Duration(seconds: 2));

      if (email == 'test@test.com' && password == '123456') {
        emit(state.copyWith(status: RegisterStatus.success, message: 'OK'));
      } else {
        emit(
          state.copyWith(
            status: RegisterStatus.failure,
            message: 'Credenciales incorrectas',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          message: 'Error inesperado: $e',
        ),
      );
    }
  }
}
