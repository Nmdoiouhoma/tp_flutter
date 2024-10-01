import 'dart:convert';
import 'package:exo3/models/breed.dart';
import 'package:http/http.dart' as http;

class StatusErrorException {
  final int statusCode;
  StatusErrorException(this.statusCode);
}

class CatAPI {
  static const apiServer = 'api.thecatapi.com';
  static const apiUri = 'v1';
  static const apiKey =
      'live_y0sQUTcthFwgCJs5bKWoJ3oBPzQrdqoIAcF0FvuOnEm6JRPcuBr6W93lkM0vLaXO';
  static const searchRoute = '$apiUri/search';
  static const breedUri = '$apiUri/breeds';
  static const apiKeyHeader = 'x-api-key';
  static const headers = {apiKeyHeader: apiKey};

  Future<List<Breed>> breeds() async {
    var result =
        await http.get(Uri.https(apiServer, breedUri), headers: headers);
    if (result.statusCode == 200) {
      final List<dynamic> datas = jsonDecode(result.body);
      return datas.map((e) => Breed.fromMap(e)).toList();
    }
    throw StatusErrorException(result.statusCode);
  }
}
