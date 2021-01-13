import "package:flutter/material.dart";
import 'package:crypto/crypto.dart';
import "dart:convert";
import "package:http/http.dart" as http;
import "package:smite_app/Album.dart";

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

Future<Album> fetchAlbum() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/albums/1');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

// Future<http.Response> fetchAlbum() {
//   return http.get('https://jsonplaceholder.typicode.com/albums/1');
// }
