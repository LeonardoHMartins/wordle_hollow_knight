import 'dart:convert';

extension NullVerification on Object? {
  bool get isNull => this == null;

  bool get isNotNull => this != null;
}

extension ToJson on Map<String, dynamic>{
  String toJson() => jsonEncode(this);
}

extension ToMap on String {
  Map<String, dynamic> toMap() => jsonDecode(this);
}