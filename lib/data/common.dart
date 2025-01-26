import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:javier_website/data/converters.dart';
import 'package:json_annotation/json_annotation.dart';

const firestoreSerializable = JsonSerializable(
  converters: [...firestoreJsonConverters, CommentDtoReferenceConverter()],
  // The following values could alternatively be set inside your `build.yaml`
  explicitToJson: true,
  createFieldMap: true,
  createPerFieldToJson: true,
);
