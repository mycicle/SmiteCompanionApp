import "dart:convert";
import "package:crypto/crypto.dart";
import "package:intl/intl.dart";

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

String datetimeNow() {
  return DateFormat("yyyyMMddHHmmss").format(DateTime.now().toUtc());
}