import "dart:convert";
import "package:crypto/crypto.dart";
import "package:intl/intl.dart";
import "package:smite_app/globals.dart" as globals;
import "package:smite_app/recommended_builds/recommended_builds.dart" as builds;
String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

String datetimeNow() {
  return DateFormat("yyyMMddHHmmss").format(DateTime.now().toUtc());
}

void combineGodsAndBuilds() {
  var recommended_builds = builds.RecommendedBuilds;
  recommended_builds.forEach((key, value) {
    globals.godsRes[key].builds = value;
  });
}