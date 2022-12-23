// To parse this JSON data, do
//
//     final pocketBaseError = pocketBaseErrorFromJson(jsonString);

import 'dart:convert';

PocketBaseError pocketBaseErrorFromJson(String str) =>
    PocketBaseError.fromJson(json.decode(str));

String pocketBaseErrorToJson(PocketBaseError data) =>
    json.encode(data.toJson());

class PocketBaseError {
  PocketBaseError({
    this.url,
    this.isAbort,
    this.statusCode,
    this.response,
    this.originalError,
  });

  final String? url;
  final bool? isAbort;
  final int? statusCode;
  final Response? response;
  final String? originalError;

  PocketBaseError copyWith({
    String? url,
    bool? isAbort,
    int? statusCode,
    Response? response,
    String? originalError,
  }) =>
      PocketBaseError(
        url: url ?? this.url,
        isAbort: isAbort ?? this.isAbort,
        statusCode: statusCode ?? this.statusCode,
        response: response ?? this.response,
        originalError: originalError ?? this.originalError,
      );

  factory PocketBaseError.fromJson(Map<String, dynamic> json) =>
      PocketBaseError(
        url: json["url"],
        isAbort: json["isAbort"],
        statusCode: json["statusCode"],
        response: Response.fromJson(json["response"]),
        originalError: json["originalError"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "isAbort": isAbort,
        "statusCode": statusCode,
        "response": response?.toJson(),
        "originalError": originalError,
      };
}

class Response {
  Response({
    this.code,
    this.message,
    this.data,
  });

  final int? code;
  final String? message;
  final Data? data;

  Response copyWith({
    int? code,
    String? message,
    Data? data,
  }) =>
      Response(
        code: code ?? this.code,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.email,
    this.password,
  });

  final Error? email;
  final Error? password;

  Data copyWith({
    Error? email,
    Error? password,
  }) =>
      Data(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: Error.fromJson(json["email"]),
        password: Error.fromJson(json["password"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email?.toJson(),
        "password": password?.toJson(),
      };
}

class Error {
  Error({
    this.code,
    this.message,
  });

  final String? code;
  final String? message;

  Error copyWith({
    String? code,
    String? message,
  }) =>
      Error(
        code: code ?? this.code,
        message: message ?? this.message,
      );

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
