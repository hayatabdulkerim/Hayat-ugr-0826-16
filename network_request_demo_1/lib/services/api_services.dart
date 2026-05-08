import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:network_request_demo_1/models/album.dart';

// get single album

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/albums';

  static Future<Album> getAlbum(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
