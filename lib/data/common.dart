import 'package:javier_website/data/converters.dart';
import 'package:json_annotation/json_annotation.dart';

final firestoreSerializable = JsonSerializable(
  converters: [CommentDtoReferenceConverter()],
  // The following values could alternatively be set inside your `build.yaml`
  explicitToJson: true,
  createFieldMap: true,
  createPerFieldToJson: true,
);
