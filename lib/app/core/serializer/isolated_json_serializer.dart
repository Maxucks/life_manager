import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:life_manager/app/core/serializer/json_app_serializer.dart';

class IsolatedJsonSerializer implements JsonAppSerializer {
  const IsolatedJsonSerializer();

  @override
  Future<T> decode<T>(T Function(Map<String, dynamic>) fromJson, String json) {
    final params = DecodeParams(json: json, fromJson: fromJson);
    return compute<DecodeParams, T>(_decode, params);
  }

  @override
  Future<String> encode<T>(Map<String, dynamic> Function() toJson) {
    final params = EncodeParams(toJson: toJson);
    return compute<EncodeParams, String>(_encode, params);
  }
}

class DecodeParams<T> {
  const DecodeParams({
    required this.json,
    required this.fromJson,
  });

  final String json;
  final T Function(Map<String, dynamic>) fromJson;
}

class EncodeParams<T> {
  const EncodeParams({
    required this.toJson,
  });

  final Map<String, dynamic> Function() toJson;
}

T _decode<T>(DecodeParams params) {
  final map = jsonDecode(params.json) as Map<String, dynamic>;
  return params.fromJson(map);
}

String _encode<T>(EncodeParams params) {
  final map = params.toJson();
  return jsonEncode(map);
}
