part of 'user_name_cubit.dart';

class UserNameState extends Equatable {
  final String name;
  const UserNameState({this.name = ''});

  UserNameState copyWith({String? name}) {
    return UserNameState(name: name ?? this.name);
  }

  @override
  List<Object> get props => [name];
}

final class UserNameInitial extends UserNameState {}
