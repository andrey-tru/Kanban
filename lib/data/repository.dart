import 'package:kanban/data/network/models/carts_model.dart';
import 'package:kanban/data/network/models/login_model.dart';
import 'package:kanban/data/network/server_api.dart';

class Repository {
  final _serverApi = ServerApi();

  Future<LoginModel> getLogin(String username, String password) async {
    final response = await _serverApi.getLogin(username, password);
    return response;
  }

  Future<List<CardsModel>> getCards(String token, String row) async {
    final response = await _serverApi.getCards(token, row);
    return response;
  }
}
