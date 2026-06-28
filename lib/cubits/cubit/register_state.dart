part of 'register_cubit.dart';

enum RegisterStatus { initial, loading, success, failure }

class RegisterState extends Equatable {
  final RegisterStatus status;
  final String email;
  final String? emailError;
  final String? message;

  const RegisterState({
    this.status = RegisterStatus.initial,
    this.email = '',
    this.emailError,
    this.message,
  });

  RegisterState copyWith({
    RegisterStatus? status,
    String? email,
    String? emailError,
    String? message,
  }) {
    return RegisterState(
      status: status ?? this.status,
      email: email ?? this.email,
      emailError: emailError ?? this.emailError,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, email, emailError, message];
}
