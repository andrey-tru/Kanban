part of 'cards_bloc.dart';

abstract class CardsEvent extends Equatable {
  const CardsEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends CardsEvent {
  final String token, row;

  InitialEvent({required this.token, required this.row});
}
