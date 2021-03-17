import 'package:meta/meta.dart';
import 'dart:convert';

Authresp authrespFromJson(String str) => Authresp.fromJson(json.decode(str));

String authrespToJson(Authresp data) => json.encode(data.toJson());

class Authresp {
  Authresp({
    @required this.token,
    @required this.refresh,
    @required this.ext,
  });

  final String token;
  final String refresh;
  final int ext;

  Authresp copyWith({
    String token,
    String refresh,
    int ext,
  }) =>
      Authresp(
        token: token ?? this.token,
        refresh: refresh ?? this.refresh,
        ext: ext ?? this.ext,
      );

  factory Authresp.fromJson(Map<String, dynamic> json) => Authresp(
        token: json["token"],
        refresh: json["refresh"],
        ext: json["ext"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "refresh": refresh,
        "ext": ext,
      };
}
