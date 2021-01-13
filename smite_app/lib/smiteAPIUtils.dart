import "dart:convert";
import "package:http/http.dart" as http;
import "package:smite_app/Album.dart";
import "package:smite_app/SmiteResponses.dart";
import "package:smite_app/AuthInfo.dart";

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

Future<SessionResponse> fetchSessionResponse(AuthInfo info) async {
  print("sent request");
  final response = await http.get(SessionResponse.buildLink(info));

  if (response.statusCode == 200) {
    print("response");
    return SessionResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("could not load the session response \n${response.body}");
  }
}

Future<GodsResponse> fetchGodsResponse(AuthInfo info, SessionResponse session) async {
  print("sent gods request");
  final response = await http.get(GodsResponse.buildLink(info, session.getSessionId()));
  print(response);
  if (response.statusCode == 200) {
    print("gods response");
    return GodsResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("could not load the gods response \n${response.body}");
  }
}
// Future<http.Response> fetchAlbum() {
//   return http.get('https://jsonplaceholder.typicode.com/albums/1');
// }
