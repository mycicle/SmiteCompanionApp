import 'package:smite_app/AuthInfo.dart';
import "package:smite_app/utils.dart";

class GodsResponse {
  final String body;

  GodsResponse({this.body});

  factory GodsResponse.fromJson(Map<String, dynamic> json) {
    print(json);
    return GodsResponse(
      body: json['Artemis'],
    );
  }

  static String buildLink(AuthInfo info) {
    final String base = "http://api.smitegame.com/smiteapi.svc/getgodsjson";
    final String tmstp = datetimeNow();
    final String signature = generateMd5(info.devID + "getgods" + info.authKey + tmstp);
    return base + '/' + info.devID + '/' + signature + '/' + tmstp;
  }
}

class SessionResponse {
  final String retMsg;
  final String sessionID;
  final String timestamp;

  SessionResponse({this.retMsg, this.sessionID, this.timestamp});

  factory SessionResponse.fromJson(Map<String, dynamic> json) {
    print(json);
    return SessionResponse(
      retMsg: json["ret_msg"],
      sessionID: json["session_id"],
      timestamp: json["timestamp"],
    );
  }

  static String buildLink(AuthInfo info) {
    print("BUILDING LINK");
    final String base = "http://api.smitegame.com/smiteapi.svc/createsessionJson";
    final String tmstp = datetimeNow();
    final String signature = generateMd5(info.devID + "createsession" + info.authKey + tmstp);
    return base + '/' + info.devID + '/' + signature + '/' + tmstp;
  }
}