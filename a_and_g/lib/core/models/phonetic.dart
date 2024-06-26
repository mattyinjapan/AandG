import 'package:json_annotation/json_annotation.dart';

part 'phonetic.g.dart';

@JsonSerializable()
class Phonetic {
  final String text;
  final String? audio;

  Phonetic(this.text, {this.audio = ''});

  factory Phonetic.fromJson(Map<String, dynamic> json) =>
      _$PhoneticFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneticToJson(this);
}
