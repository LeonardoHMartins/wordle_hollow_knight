import 'package:intl/intl.dart';

extension DateFormatTryParse on DateFormat {
  DateTime? tryParse(String inputString, [bool utc = false]) {
    try {
      return parse(inputString, utc);
    } on FormatException {
      return null;
    }
  }
}

extension DateConvert on DateTime {
  String? dateConvert() {
    if (toIso8601String().contains('z') || toIso8601String().contains('Z')) {
      return toIso8601String();
    }
    return '${toIso8601String()}z';
  }
}

String dateFromUsJsonDate(String text) {
  var data = DateFormat('yyyy-MM-dd').parse(text);
  return DateFormat('dd/MM/yyyy').format(data);
}
