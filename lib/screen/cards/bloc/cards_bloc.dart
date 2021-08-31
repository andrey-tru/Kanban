import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kanban/data/network/models/carts_model.dart';
import 'package:kanban/data/repository.dart';

part 'cards_event.dart';
part 'cards_state.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  final _repository = Repository();
  late List<CardsModel> cardsList;
  CardsBloc() : super(CardsInitial());

  @override
  Stream<CardsState> mapEventToState(
    CardsEvent event,
  ) async* {
    if (event is InitialEvent) {
      yield CardsLoading();
      try {
        cardsList = await _repository.getCards(event.token, event.row);
        yield CardsSucced(cardsList: cardsList);
      } catch (e) {
        yield CardsFailed(message: e.toString());
      }
    }
  }
}
