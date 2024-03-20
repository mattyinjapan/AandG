# a_and_g

A&G Flutter Code Challenge by Mathew Odron

# environments
dev environment: flutter run --dart-define-from-file=.env/dev.json
prod environment: flutter run --dart-define-from-file=.env/prod.json

# adding and editing models
1. Create the model / class in core/models
2. import 'package:json_annotation/json_annotation.dart';
3. add: @JsonSerializable()
4. run: dart run build_runner build --delete-conflicting-outputs

