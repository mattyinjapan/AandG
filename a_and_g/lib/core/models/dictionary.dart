import 'package:json_annotation/json_annotation.dart';

import 'meaning.dart';
import 'phonetic.dart';

part 'dictionary.g.dart';

@JsonSerializable()
class Dictionary {
  final String word;
  final String phonetic;
  final List<Phonetic> phonetics;
  final String? origin;
  final List<Meaning> meanings;

  Dictionary(this.word, this.phonetic, this.phonetics, this.origin, this.meanings);

  factory Dictionary.fromJson(Map<String, dynamic> json) =>
      _$DictionaryFromJson(json);

  Map<String, dynamic> toJson() => _$DictionaryToJson(this);
}
