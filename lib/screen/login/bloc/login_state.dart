part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSucced extends LoginState {
  final LoginModel token;

  LoginSucced({required this.token});
}

class UsernameSucced extends LoginState {
  final String username;

  UsernameSucced({required this.username});
}

class PasswordSucced extends LoginState {
  final String password;

  PasswordSucced({required this.password});
}

class LoginFailed extends LoginState {
  final LoginErrorModel message;

  LoginFailed({required this.message});
}
