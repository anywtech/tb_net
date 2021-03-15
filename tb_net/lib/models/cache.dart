// To parse this JSON data, do
//
//     final cache = cacheFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Cache cacheFromJson(String str) => Cache.fromJson(json.decode(str));

String cacheToJson(Cache data) => json.encode(data.toJson());

class Cache {
  Cache({
    @required this.token,
    @required this.refresh,
    @required this.ext,
    @required this.createAt,
  });

  final String token;
  final String refresh;
  final int ext;
  final DateTime createAt;

  Cache copyWith({
    String token,
    String refresh,
    int ext,
    DateTime createAt,
  }) =>
      Cache(
        token: token ?? this.token,
        refresh: refresh ?? this.refresh,
        ext: ext ?? this.ext,
        createAt: createAt ?? this.createAt,
      );

  factory Cache.fromJson(Map<String, dynamic> json) => Cache(
        token: json["token"],
        refresh: json["refresh"],
        ext: json["ext"],
        createAt: DateTime.parse(json["createAt"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "refresh": refresh,
        "ext": ext,
        "createAt": createAt.toIso8601String(),
      };
}
