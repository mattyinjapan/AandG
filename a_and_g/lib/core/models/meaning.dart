import 'package:a_and_g/core/models/definition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meaning.g.dart';

@JsonSerializable()
class Meaning {
  final String partOfSpeech;
  final List<Definition> definitions;

  Meaning(this.partOfSpeech, this.definitions);

  factory Meaning.fromJson(Map<String, dynamic> json) =>
      _$MeaningFromJson(json);

  Map<String, dynamic> toJson() => _$MeaningToJson(this);
}
