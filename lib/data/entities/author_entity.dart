import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:javier_website/data/entities/comment_entity.dart';
import 'package:javier_website/data/entities/common.dart';

part 'author_entity.g.dart';

@firestoreSerializable
class AuthorEntity {
  @Id()
  final String id;
  final String name;
  final String email;
  //final List<CommentEntityDocumentReference> comments;

  AuthorEntity({
    required this.id,
    required this.name,
    required this.email,
    //required this.comments
  });
}

@Collection<AuthorEntity>('authors')
final usersRef = AuthorEntityCollectionReference();
