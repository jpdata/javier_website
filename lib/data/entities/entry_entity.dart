import 'package:javier_website/data/entities/comment_entity.dart';
import 'package:javier_website/data/entities/common.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';

part 'entry_entity.g.dart';

@firestoreSerializable
class EntryEntity {
  @Id()
  final String id;
  final String title;
  final String subtitle;
  final String content;
  final DateTime createdAt;
  final List<String> tags;
  //final List<CommentEntityDocumentReference> comments;

  EntryEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.content,
    required this.createdAt,
    this.tags = const [],
    //this.comments = const [],
  });
}

@Collection<EntryEntity>('entries')
final usersRef = EntryCollectionReference();
