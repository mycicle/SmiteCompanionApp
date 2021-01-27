import "dart:convert";
import 'dart:developer';
import "package:http/http.dart" as http;
import 'package:smite_app/classes/SmiteResponses.dart';
import 'package:smite_app/classes/AuthInfo.dart';


Future<SessionResponse> getSession(AuthInfo info) async {
  final String link = SessionResponse.buildLink(info);
  log("Sent Session Request to $link");
  final response = await http.get(link);
  if (response.statusCode == 200) {
    log("Successful Session Response");
    SessionResponse res = SessionResponse.fromJson(jsonDecode(response.body));
    log("Session Info: ${res.getInformation()}");
    return res;
  } else {
    throw Exception("could not load the session response \n${response.body}");
  }
}

Future getGods(AuthInfo info, SessionResponse session) async {
  if (session == null) {
    return null;
  }

  final String link = GodsResponse.buildLink(info, session.sessionID);
  log("Sent Gods Request to $link");
  final response = await http.get(link);

  if (response.statusCode == 200) {
    log("Successful Gods Response");
    GodsResponse res = GodsResponse.fromJson(jsonDecode(response.body));
    return res.gods;
  } else {
    throw Exception("could not load the gods response \n${response.body}");
  }
}

Future getItems(AuthInfo info, SessionResponse session) async {

  if (session == null) {
    return null;
  }
  final String link = ItemsResponse.buildLink(info, session.sessionID);
  log("Sent Items Request to $link");
  final response = await http.get(link);

  if (response.statusCode == 200) {
    log("Successful Items Response");
    ItemsResponse res = ItemsResponse.fromJson(jsonDecode(response.body));
    return res.items;
  } else {
    throw Exception("could not load the items response \n${response.body}");
  }
}