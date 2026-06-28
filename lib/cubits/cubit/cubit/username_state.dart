part of 'username_cubit.dart';

abstract class UsernameState extends Equatable {
  final String username;
  const UsernameState({this.username = ''});

  UsernameState copyWith({String? username});

  @override
  List<Object> get props => [username];
}

final class UsernameInitial extends UsernameState {
  const UsernameInitial({String username = ''}) : super(username: username);

  @override
  UsernameInitial copyWith({String? username}) =>
      UsernameInitial(username: username ?? this.username);
}
