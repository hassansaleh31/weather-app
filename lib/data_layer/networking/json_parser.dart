/// parses a dynamic value into a String
String? parseString(dynamic value) {
  if (value == null || value is String) return value;
  return null;
}

/// parses a dynamic value into a double
double? parseDouble(dynamic value) {
  if (value == null || value is double) return value;
  if (value is String) return double.tryParse(value);
  if (value is num) return value.toDouble();
  return null;
}

/// parses a dynamic value into an int
int? parseInt(dynamic value) {
  if (value == null || value is int) return value;
  if (value is String) return int.tryParse(value);
  if (value is num) return value.toInt();
  return null;
}

/// parses a dynamic value into an date
DateTime? parseDate(
  dynamic value, {
  bool isUTC = false,
}) {
  final intValue = parseInt(value);
  if (intValue == null) return null;
  return DateTime.fromMillisecondsSinceEpoch(
    intValue,
    isUtc: isUTC,
  );
}
