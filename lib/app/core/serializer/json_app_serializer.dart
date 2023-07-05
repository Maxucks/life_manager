abstract interface class JsonAppSerializer {
  Future<T> decode<T>(T Function(Map<String, dynamic>) fromJson, String json);
  Future<String> encode<T>(Map<String, dynamic> Function() toJson);
}
