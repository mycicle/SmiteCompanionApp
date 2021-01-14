import 'package:smite_app/classes/God.dart';
import 'package:smite_app/classes/AuthInfo.dart';
import 'package:smite_app/utils/utils.dart';

class GodsResponse {
  List<God> gods;

  GodsResponse(List<dynamic> inp) {
    this.gods = [];
    inp.forEach((element) {
      print('\n\n' + element.toString() + '\n\n');
      gods.add(God(ab1: Ability(name: element["Ability1"].toString(), attribs: ["attributes"], desc: "description"),
                    ab2: Ability(name: element.toString(), attribs: ["attributes"], desc: "description"),
                    ab3: Ability(name: "name", attribs: ["attributes"], desc: "description"),
                    ab4: Ability(name: "name", attribs: ["attributes"], desc: "description"),
                    ab5: Ability(name: "name", attribs: ["attributes"], desc: "description")));
    });
  }

  factory GodsResponse.fromJson(List<dynamic> json) {
    print(json);
    return GodsResponse(
      json
    );
  }

  static String buildLink(AuthInfo info, String id) {
    print("BUILDING GODS LINK");
    final String base = "http://api.smitegame.com/smiteapi.svc/getgodsjson";
    final String tmstp = datetimeNow();
    final String signature = generateMd5(info.devID + "getgods" + info.authKey + tmstp);
    final String languageCode = "1";
    print(base + '/' + info.devID + '/' + signature + '/' + id + '/' + tmstp + '/' + languageCode);
    return base + '/' + info.devID + '/' + signature + '/' + id + '/' + tmstp + '/' + languageCode;
  }
}


class SessionResponse {
  final String sessionID;
  final String timestamp;
  final String retMsg;

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
    final String signature = generateMd5(
        info.devID + "createsession" + info.authKey + tmstp);
    return base + '/' + info.devID + '/' + signature + '/' + tmstp;
  }

  void cout() {
    print("Session ID: $sessionID");
    print("timestamp: $timestamp");
    print("ret_msg: $retMsg");
  }
}