// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scoreboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Scoreboard _$ScoreboardFromJson(Map<String, dynamic> json) => Scoreboard(
      id: json['id'] as int?,
      name: json['name'] as String,
      mode: Mode.fromJson(json['mode'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScoreboardToJson(Scoreboard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mode': instance.mode.toJson(),
    };
