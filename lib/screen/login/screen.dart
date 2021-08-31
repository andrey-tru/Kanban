import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/screen/cards/screen.dart';
import 'package:kanban/screen/login/bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  late TextEditingController _username;
  late TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _username = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSucced) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => CardsScreen(token: state.token.token)),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Kanban'),
            ),
            body: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  state is LoginFailed
                      ? Text(
                          state.message.errors[0],
                          style: TextStyle(color: Colors.red),
                        )
                      : Text(""),
                  TextField(
                    controller: _username,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                    onChanged: (value) {
                      setState(() {
                        BlocProvider.of<LoginBloc>(context).add(
                          UsernameTextField(),
                        );
                      });
                    },
                  ),
                  state is UsernameSucced && _username.text.length < 4
                      ? Text(
                          state.username,
                          style: TextStyle(color: Colors.red),
                        )
                      : Text(""),
                  TextField(
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    onChanged: (value) {
                      setState(() {
                        BlocProvider.of<LoginBloc>(context).add(
                          PasswordTextField(),
                        );
                      });
                    },
                  ),
                  state is PasswordSucced && _password.text.length < 8
                      ? Text(
                          state.password,
                          style: TextStyle(color: Colors.red),
                        )
                      : Text(""),
                  ElevatedButton(
                    onPressed: (_username.text.length >= 4 &&
                            _password.text.length >= 8)
                        ? () {
                            BlocProvider.of<LoginBloc>(context).add(
                              SignInButton(
                                username: _username.text,
                                password: _password.text,
                              ),
                            );
                            _username = TextEditingController();
                            _password = TextEditingController();
                          }
                        : null,
                    child: Text('Log in'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
