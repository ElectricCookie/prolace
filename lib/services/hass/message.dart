import 'package:json_annotation/json_annotation.dart';

import 'models/event.dart';

part 'message.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Message {
  String? type;
  int? id;
  String? haVersion;
  Map<String, dynamic>? serviceData;
  Map<String, dynamic>? target;
  dynamic? result;
  HassEvent? event;
  String? accessToken;
  String? message;
  String? domain;
  String? service;
  bool? success;

  String? eventType;

  Message({
    this.type,
    this.id,
    this.haVersion,
    this.accessToken,
    this.message,
    this.result,
    this.success,
    this.serviceData,
    this.domain,
    this.service,
    this.target,
    this.eventType,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
