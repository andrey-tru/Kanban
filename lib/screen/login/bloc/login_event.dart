part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class UsernameTextField extends LoginEvent {}

class PasswordTextField extends LoginEvent {}

class SignInButton extends LoginEvent {
  final String username, password;

  SignInButton({required this.username, required this.password});
}
