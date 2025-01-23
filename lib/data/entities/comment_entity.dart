import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:javier_website/data/entities/author_entity.dart';
import 'package:javier_website/data/entities/common.dart';
import 'package:javier_website/data/entities/entry_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'comment_entity.g.dart';

@firestoreSerializable
class CommentEntity {
  @Id()
  final String id;
  final EntryEntityDocumentReference entry;
  //final AuthorEntityDocumentReference author;
  final String content;
  final DateTime createdAt;

  CommentEntity({
    required this.id,
    required this.entry,
    //required this.author,
    required this.content,
    required this.createdAt,
  });
}

@Collection<CommentEntity>('comments')
final usersRef = CommentEntityCollectionReference();
