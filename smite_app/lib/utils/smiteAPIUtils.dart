import "dart:convert";
import "package:http/http.dart" as http;
import 'package:smite_app/classes/SmiteResponses.dart';
import 'package:smite_app/classes/AuthInfo.dart';


Future<SessionResponse> getSession(AuthInfo info) async {
  print("sent request");
  final response = await http.get(SessionResponse.buildLink(info));

  if (response.statusCode == 200) {
    print("response");
    return SessionResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("could not load the session response \n${response.body}");
  }
}

Future getGods(AuthInfo info, SessionResponse session) async {
  print("sent gods request");
  if (session == null) {
    return null;
  }
  final response = await http.get(GodsResponse.buildLink(info, session.sessionID));

  if (response.statusCode == 200) {
    print("gods response");
    GodsResponse res = GodsResponse.fromJson(jsonDecode(response.body));
    return res.gods;
  } else {
    throw Exception("could not load the gods response \n${response.body}");
  }
}

Future getItems(AuthInfo info, SessionResponse session) async {
  print("sent items request");
  if (session == null) {
    return null;
  }
  final response = await http.get(ItemsResponse.buildLink(info, session.sessionID));

  if (response.statusCode == 200) {
    print("items response");
    ItemsResponse res = ItemsResponse.fromJson(jsonDecode(response.body));
    return res.items;
  } else {
    throw Exception("could not load the items response \n${response.body}");
  }
}