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
      'live_tasd9e9oEEdqEkcZERjhiakwOV8JvKrRv1GPFFXyqZY6IvIJqFyaiiRzlT4VcmPZ';
  static const searchRoute = '$apiUri/search';
  static const breedUri = '$apiUri/breeds';
  static const apiKeyHeader = 'x-api-key';
  static const headers = {apiKeyHeader: apiKey};

  Future<List<Breed>> breeds() async {
    var result =
        await http.get(Uri.https(apiServer, breedUri), headers: headers);
    print('Headers sent: ${headers}');// verifie l'entete de l'api
    print('Status code: ${result.statusCode}');
    print('Response body: ${result.body}');

    if (result.statusCode == 200) {
      final List<dynamic> data = jsonDecode(result.body);
      print(
          'Data fetched: ${data.length} items'); // Nombre d'éléments récupérés
      print(
          'First item: ${data.isNotEmpty ? data[0] : "No data"}'); // Premier élément pour vérification
      return data.map((e) => Breed.fromMap(e)).toList();
    }
    throw StatusErrorException(result.statusCode);
  }
}
