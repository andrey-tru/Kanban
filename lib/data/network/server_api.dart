import 'package:dio/dio.dart';
import 'package:kanban/data/network/dio_settings.dart';
import 'package:kanban/data/network/models/carts_model.dart';
import 'package:kanban/data/network/models/login_model.dart';

class ServerApi {
  late Response<String> response;

  Future<LoginModel> getLogin(String username, String password) async {
    response = await DioSettings().dio.post(
      "/users/login/",
      data: {
        "username": username.trim(),
        "password": password.trim(),
      },
    );
    if (response.statusCode != 200) {
      throw response;
    } else {
      return loginModelFromJson(response.toString());
    }
  }

  Future<List<CardsModel>> getCards(String token, String row) async {
    response = await DioSettings(token: token).dio.get(
      "/cards/",
      queryParameters: {
        "row": row,
      },
    );
    print(response);
    return cardsModelFromJson(response.toString());
  }
}
