import 'dart:convert';

/// Used by the net client to convert JSON objects
class NetJson {
  /// Creates a const NetJson
  const NetJson();

  /// Decodes the JSON from the source string
  ///
  /// Override this to handle different ways of decoding, like
  /// in Flutter, where you should decode outside the UI thread.
  Future<dynamic> decode(
    String source, {
    Object? Function(Object? key, Object? value)? reviver,
  }) async =>
      jsonDecode(source, reviver: reviver);

  /// Encodes the JSON to a string
  ///
  /// Override this to handle different ways of encoding, like
  /// in Flutter, where you should encode outside the UI thread.
  Future<String> encode(
    Object? object, {
    Object? Function(Object? nonEncodable)? toEncodable,
  }) async =>
      jsonEncode(object, toEncodable: toEncodable);
}
