import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:javier_website/data/comment_dto.dart';
import 'package:json_annotation/json_annotation.dart';

class CommentDtoReferenceConverter
    implements
        JsonConverter<CommentDtoDocumentReference, Map<String, dynamic>> {
  const CommentDtoReferenceConverter();

  @override
  CommentDtoDocumentReference fromJson(Map<String, dynamic> json) {
    // Cambia `FirebaseFirestore.instance` según sea necesario.
    var doc = FirebaseFirestore.instance.doc(json['path'] as String)
        as DocumentReference<CommentDto>;

    return CommentDtoDocumentReference(doc);
  }

  @override
  Map<String, dynamic> toJson(CommentDtoDocumentReference docRef) {
    return {'path': docRef.path};
  }
}
