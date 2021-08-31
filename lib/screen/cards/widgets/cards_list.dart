import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban/screen/cards/bloc/cards_bloc.dart';

class CardsList extends StatelessWidget {
  final String token;
  final String row;
  CardsList({required this.token, required this.row});

  @override
  Widget build(BuildContext context) {
    late bool check = true;
    return BlocBuilder<CardsBloc, CardsState>(
      builder: (context, state) {
        if (check) {
          BlocProvider.of<CardsBloc>(context)
              .add(InitialEvent(token: token, row: row));
          check = !check;
        }
        if (state is CardsSucced) {
          return Container(
            child: ListView.builder(
              itemCount: state.cardsList.length,
              itemBuilder: (context, i) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: ${state.cardsList[i].id.toString()}'),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(state.cardsList[i].text.toString()),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
