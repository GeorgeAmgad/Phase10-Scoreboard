import 'package:json_annotation/json_annotation.dart';
import 'mode.dart';

part 'scoreboard.g.dart';


final String boardTable = 'scoreboards';
class BoardFields {
  static final String id = '_id';
  static final String name = 'name';
  static final String mode = 'mode_id';
}

@JsonSerializable(explicitToJson: true)
class Scoreboard {
  final int? id;
  final String name;
  final Mode mode;

  Scoreboard({this.id, required this.name, required this.mode});

  factory Scoreboard.fromJson(Map<String, dynamic> json) => _$ScoreboardFromJson(json);
  Map<String, dynamic> toJson() => _$ScoreboardToJson(this);

}
