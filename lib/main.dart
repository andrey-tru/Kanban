import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/screen/cards/bloc/cards_bloc.dart';
import 'package:kanban/screen/login/bloc/login_bloc.dart';
import 'package:kanban/screen/login/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => LoginBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => CardsBloc(),
        ),
      ],
      child: MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}
