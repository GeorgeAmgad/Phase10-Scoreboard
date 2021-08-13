import 'package:json_annotation/json_annotation.dart';

part 'mode.g.dart';


final String modeTable = 'modes';
class ModeFields {
  static const String id = '_id';
  static const String name = 'name';
}

@JsonSerializable()
class Mode {
  @JsonKey(name: ModeFields.id)
  final int? id;
  @JsonKey(name: ModeFields.name)
  final String name;

  Mode({this.id, required this.name});

  factory Mode.fromJson(Map<String, dynamic> json) => _$ModeFromJson(json);

  Map<String, dynamic> toJson() => _$ModeToJson(this);
}
