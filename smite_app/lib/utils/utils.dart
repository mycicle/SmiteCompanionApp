import "dart:convert";
import "package:crypto/crypto.dart";
import "package:intl/intl.dart";
import "package:smite_app/globals.dart" as globals;

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

String datetimeNow() {
  return DateFormat("yyyyMMddHHmmss").format(DateTime.now().toUtc());
}

Future<bool> combineGodsAndBuilds() async {
  Future.delayed(const Duration(seconds: 5), (){});
  return true;
}