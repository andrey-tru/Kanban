part of 'cards_bloc.dart';

abstract class CardsState extends Equatable {
  const CardsState();

  @override
  List<Object> get props => [];
}

class CardsInitial extends CardsState {}

class CardsLoading extends CardsState {}

class CardsSucced extends CardsState {
  final List<CardsModel> cardsList;

  CardsSucced({required this.cardsList});
}

class CardsFailed extends CardsState {
  final String message;

  CardsFailed({required this.message});
}
