import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dawa/src/dawa_service/dto/dawa_autocomplete.dart';
import 'package:http/http.dart' as http;

class DawaService {
  final Uri _baseUri = Uri.parse('https://api.dataforsyningen.dk/');

  Future<List<DawaAutocomplete>> autocomplete(String address,
      {int? caretPosition, int? maxResults}) async {
    String query = 'q=$address';
    if (caretPosition != null) {
      query += '&caretpos=$caretPosition';
    }
    query += '&per_side=' + (maxResults ?? 10).toString();
    query += '&type=adresse&startfra=adresse&fuzzy';

    final http.Response response;
    try {
      response = await http.get(
        _baseUri.resolve('autocomplete/?' + query),
        headers: {
          'accept': 'application/json',
        },
      );
    } on http.ClientException catch (e) {
      developer.log('ClientException: $e',
          name: 'DawaService', error: json.encode({'uri': e.uri.toString()}));
      return List.empty();
    }

    if (response.statusCode != 200) {
      throw Exception('Failed to get autocomplete suggestions');
    }

    final data = json.decode(response.body) as List<dynamic>;

    return data.map((v) => DawaAutocomplete.fromJson(v)).toList();
  }
}
