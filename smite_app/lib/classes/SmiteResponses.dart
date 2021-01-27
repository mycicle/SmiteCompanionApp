import 'dart:developer';
import "package:smite_app/classes/Item.dart";
import 'package:smite_app/classes/God.dart';
import 'package:smite_app/classes/AuthInfo.dart';
import 'package:smite_app/utils/utils.dart';

class ItemsResponse {
  final items =  <String, Item>{};

  ItemsResponse(List<dynamic> inp) {
    inp.forEach((element) {
      items[element["DeviceName"].toString()] = Item(
                                                  name: element["DeviceName"].toString(),
                                                  desc: element["ItemDescription"]["Description"].toString(),
                                                  price: element["Price"].toString(),
                                                  iconLink: element["itemIcon_URL"].toString(),
                                                  tier: int.parse(element["ItemTier"].toString()),
                                                );
    });
  }

  factory ItemsResponse.fromJson(List<dynamic> json) {
    return ItemsResponse(
      json
    );
  }

  static String buildLink(AuthInfo info, String id) {
    final String base = "http://api.smitegame.com/smiteapi.svc/getitemsjson";
    final String tmstp = datetimeNow();
    final String signature = generateMd5(info.devID + "getitems" + info.authKey + tmstp);
    final String languageCode = "1";
    return base + '/' + info.devID + '/' + signature + '/' + id + '/' + tmstp + '/' + languageCode;
  }

  Item get(String name) {
    return this.items[name];
  }
}


class GodsResponse {
  final gods = <String, God>{};

  GodsResponse(List<dynamic> inp) {
    inp.forEach((element) {
      gods[element["Name"].toString()] = God( name: element["Name"].toString(),
                                              lore: element["Lore"].toString(),
                                              ab1: Ability(name: element["Ability1"].toString(), attribs: element.toString(), desc: element["Ability_1"]["Description"]["itemDescription"]["description"].toString()),
                                              ab2: Ability(name: element["Ability2"].toString(), attribs: element.toString(), desc: element["Ability_2"]["Description"]["itemDescription"]["description"].toString()),
                                              ab3: Ability(name: element["Ability3"].toString(), attribs: element.toString(), desc: element["Ability_3"]["Description"]["itemDescription"]["description"].toString()),
                                              ab4: Ability(name: element["Ability4"].toString(), attribs: element.toString(), desc: element["Ability_4"]["Description"]["itemDescription"]["description"].toString()),
                                              ab5: Ability(name: element["Ability5"].toString(), attribs: element.toString(), desc: element["Ability_5"]["Description"]["itemDescription"]["description"].toString()),
                                          );
    });
  }

  factory GodsResponse.fromJson(List<dynamic> json) {
    return GodsResponse(
      json
    );
  }

  static String buildLink(AuthInfo info, String id) {
    final String base = "http://api.smitegame.com/smiteapi.svc/getgodsjson";
    final String tmstp = datetimeNow();
    final String signature = generateMd5(info.devID + "getgods" + info.authKey + tmstp);
    final String languageCode = "1";
    return base + '/' + info.devID + '/' + signature + '/' + id + '/' + tmstp + '/' + languageCode;
  }
}


class SessionResponse {
  final String sessionID;
  final String timestamp;
  final String retMsg;

  SessionResponse({this.retMsg, this.sessionID, this.timestamp});

  factory SessionResponse.fromJson(Map<String, dynamic> json) {
    return SessionResponse(
      retMsg: json["ret_msg"],
      sessionID: json["session_id"],
      timestamp: json["timestamp"],
    );
  }

  static String buildLink(AuthInfo info) {
    final String base = "http://api.smitegame.com/smiteapi.svc/createsessionJson";
    final String tmstp = datetimeNow();
    final String signature = generateMd5(
        info.devID + "createsession" + info.authKey + tmstp
    );
    return base + '/' + info.devID + '/' + signature + '/' + tmstp;
  }

  Map<String, String> getInformation() {
    return {
      "Session ID" : this.sessionID,
      "timestamp" : this.timestamp,
      "ret_msg" : this.retMsg,
    };
  }
}