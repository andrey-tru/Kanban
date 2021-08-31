import 'dart:convert';

List<CardsModel> cardsModelFromJson(String str) => List<CardsModel>.from(json.decode(str).map((x) => CardsModel.fromJson(x)));

String cardsModelToJson(List<CardsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CardsModel {
  CardsModel(
      {required this.id,
      required this.row,
      required this.seqNum,
      required this.text});

  final int id;
  final String row;
  final int seqNum;
  final String text;

  factory CardsModel.fromJson(Map<String, dynamic> json) => CardsModel(
        id: json["id"],
        row: json["row"],
        seqNum: json["seq_num"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "row": row,
        "seq_num": seqNum,
        "text": text,
      };
}
