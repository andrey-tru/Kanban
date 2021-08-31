import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kanban/data/network/models/login_model.dart';
import 'package:kanban/data/repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final _repository = Repository();
  late LoginModel loginItem;
  late String username;
  late String password;
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is UsernameTextField) {
      username = "Minimum is 4 characters";
      yield UsernameSucced(username: username);
    }
    if (event is PasswordTextField) {
      password = "Minimum is 8 characters";
      yield PasswordSucced(password: password);
    }
    
    if (event is SignInButton) {
      yield LoginLoading();
      try {
        loginItem = await _repository.getLogin(event.username, event.password);
        yield LoginSucced(token: loginItem);
      } catch (e) {
        yield LoginFailed(message: loginErrorModelFromJson(e.toString()));
      }
    }
  }
}
