// generator version: 1
//
// GENERATED CODE - DO NOT EDIT BY HAND
// This code have been generated using Firestore Modeler
// firestoremodeler.com
//
// Database
// ├─ entries/
// └─ comments/

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_modeler/firestore_modeler.dart';

class EntryDto {
  const EntryDto({
    required this.title,
    required this.subtitle,
    required this.content,
    required this.createdAt,
    required this.comments,
    this.tags,
    required this.bannerImageUrl,
  });

  factory EntryDto.fromJson(Map<String, dynamic> json) {
    return EntryDto(
        title: (json['title']) as String,
        subtitle: (json['subtitle']) as String,
        content: (json['content']) as String,
        createdAt: FirestoreDateTimeConverter().fromJson(json['createdAt']),
        comments: (json['comments'])
            .map<CommentDtoDocumentReference>(
                (e) => CommentDtoDocumentReference(
                      (e as DocumentReference).withConverter(
                        fromFirestore: (snapshot, option) =>
                            CommentDto.fromJson(
                                {'id': snapshot.id, ...?snapshot.data()}),
                        toFirestore: (value, options) => value.toJson(),
                      ),
                    ))
            .toList(),
        tags: (json['tags'])?.map<String>((e) => (e) as String).toList(),
        bannerImageUrl: (json['bannerImageUrl']) as String);
  }

  final String title;

  final String subtitle;

  final String content;

  final DateTime createdAt;

  final List<CommentDtoDocumentReference> comments;

  final List<String>? tags;

  final String bannerImageUrl;

  Map<String, dynamic> toJson() {
    return {
      'title': (title),
      'subtitle': (subtitle),
      'content': (content),
      'createdAt': (createdAt).toIso8601String(),
      'comments': (comments).map((e) => (e).reference).toList(),
      'tags': (tags)?.map((e) => (e)).toList(),
      'bannerImageUrl': (bannerImageUrl)
    };
  }
}

class CommentDto {
  const CommentDto({
    required this.content,
    required this.createdAt,
    required this.authorName,
    required this.authorEmail,
  });

  factory CommentDto.fromJson(Map<String, dynamic> json) {
    return CommentDto(
        content: (json['content']) as String,
        createdAt: FirestoreDateTimeConverter().fromJson(json['createdAt']),
        authorName: (json['authorName']) as String,
        authorEmail: (json['authorEmail']) as String);
  }

  final String content;

  final DateTime createdAt;

  final String authorName;

  final String authorEmail;

  Map<String, dynamic> toJson() {
    return {
      'content': (content),
      'createdAt': (createdAt).toIso8601String(),
      'authorName': (authorName),
      'authorEmail': (authorEmail)
    };
  }
}

///
///
///

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters, duplicate_ignore
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_internal_member

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class EntriesCollectionReference
    implements
        EntryDtoQuery,
        FirestoreCollectionReference<EntryDto, EntryDtoQuerySnapshot> {
  factory EntriesCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$EntriesCollectionReference;

  static EntryDto fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return EntryDto.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    EntryDto value,
    SetOptions? options,
  ) {
    return {...value.toJson()..remove('id')}..remove('id');
  }

  @override
  CollectionReference<EntryDto> get reference;

  @override
  EntryDtoDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<EntryDtoDocumentReference> add(EntryDto value);
}

class _$EntriesCollectionReference extends _$EntryDtoQuery
    implements EntriesCollectionReference {
  factory _$EntriesCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$EntriesCollectionReference._(
      firestore.collection('entries').withConverter(
            fromFirestore: EntriesCollectionReference.fromFirestore,
            toFirestore: EntriesCollectionReference.toFirestore,
          ),
    );
  }

  _$EntriesCollectionReference._(
    CollectionReference<EntryDto> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<EntryDto> get reference =>
      super.reference as CollectionReference<EntryDto>;

  @override
  EntryDtoDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return EntryDtoDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<EntryDtoDocumentReference> add(EntryDto value) {
    return reference.add(value).then((ref) => EntryDtoDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$EntriesCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class EntryDtoDocumentReference
    extends FirestoreDocumentReference<EntryDto, EntryDtoDocumentSnapshot> {
  factory EntryDtoDocumentReference(DocumentReference<EntryDto> reference) =
      _$EntryDtoDocumentReference;

  DocumentReference<EntryDto> get reference;

  /// A reference to the [EntriesCollectionReference] containing this document.
  EntriesCollectionReference get parent {
    return _$EntriesCollectionReference(reference.firestore);
  }

  @override
  Stream<EntryDtoDocumentSnapshot> snapshots();

  @override
  Future<EntryDtoDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Sets data on the document, overwriting any existing data. If the document
  /// does not yet exist, it will be created.
  ///
  /// If [SetOptions] are provided, the data can be merged into an existing
  /// document instead of overwriting.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  Future<void> set(
    EntryDto model, {
    SetOptions? options,
    FieldValue titleFieldValue,
    FieldValue subtitleFieldValue,
    FieldValue contentFieldValue,
    FieldValue createdAtFieldValue,
    FieldValue commentsFieldValue,
    FieldValue tagsFieldValue,
    FieldValue bannerImageUrlFieldValue,
  });

  /// Writes to the document using the transaction API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void transactionSet(
    Transaction transaction,
    EntryDto model, {
    SetOptions? options,
    FieldValue titleFieldValue,
    FieldValue subtitleFieldValue,
    FieldValue contentFieldValue,
    FieldValue createdAtFieldValue,
    FieldValue commentsFieldValue,
    FieldValue tagsFieldValue,
    FieldValue bannerImageUrlFieldValue,
  });

  /// Writes to the document using the batch API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void batchSet(
    WriteBatch batch,
    EntryDto model, {
    SetOptions? options,
    FieldValue titleFieldValue,
    FieldValue subtitleFieldValue,
    FieldValue contentFieldValue,
    FieldValue createdAtFieldValue,
    FieldValue commentsFieldValue,
    FieldValue tagsFieldValue,
    FieldValue bannerImageUrlFieldValue,
  });

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String? title,
    FieldValue titleFieldValue,
    String? subtitle,
    FieldValue subtitleFieldValue,
    String? content,
    FieldValue contentFieldValue,
    DateTime? createdAt,
    FieldValue createdAtFieldValue,
    List<CommentDtoDocumentReference>? comments,
    FieldValue commentsFieldValue,
    List<String>? tags,
    FieldValue tagsFieldValue,
    String? bannerImageUrl,
    FieldValue bannerImageUrlFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String? title,
    FieldValue titleFieldValue,
    String? subtitle,
    FieldValue subtitleFieldValue,
    String? content,
    FieldValue contentFieldValue,
    DateTime? createdAt,
    FieldValue createdAtFieldValue,
    List<CommentDtoDocumentReference>? comments,
    FieldValue commentsFieldValue,
    List<String>? tags,
    FieldValue tagsFieldValue,
    String? bannerImageUrl,
    FieldValue bannerImageUrlFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    String? title,
    FieldValue titleFieldValue,
    String? subtitle,
    FieldValue subtitleFieldValue,
    String? content,
    FieldValue contentFieldValue,
    DateTime? createdAt,
    FieldValue createdAtFieldValue,
    List<CommentDtoDocumentReference>? comments,
    FieldValue commentsFieldValue,
    List<String>? tags,
    FieldValue tagsFieldValue,
    String? bannerImageUrl,
    FieldValue bannerImageUrlFieldValue,
  });
}

class _$EntryDtoDocumentReference
    extends FirestoreDocumentReference<EntryDto, EntryDtoDocumentSnapshot>
    implements EntryDtoDocumentReference {
  _$EntryDtoDocumentReference(this.reference);

  @override
  final DocumentReference<EntryDto> reference;

  /// A reference to the [EntriesCollectionReference] containing this document.
  EntriesCollectionReference get parent {
    return _$EntriesCollectionReference(reference.firestore);
  }

  @override
  Stream<EntryDtoDocumentSnapshot> snapshots() {
    return reference.snapshots().map(EntryDtoDocumentSnapshot._);
  }

  @override
  Future<EntryDtoDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(EntryDtoDocumentSnapshot._);
  }

  @override
  Future<EntryDtoDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(EntryDtoDocumentSnapshot._);
  }

  Future<void> set(
    EntryDto model, {
    SetOptions? options,
    FieldValue? titleFieldValue,
    FieldValue? subtitleFieldValue,
    FieldValue? contentFieldValue,
    FieldValue? createdAtFieldValue,
    FieldValue? commentsFieldValue,
    FieldValue? tagsFieldValue,
    FieldValue? bannerImageUrlFieldValue,
  }) async {
    final json = {
      ...model.toJson()..remove('id'),
      if (titleFieldValue != null) 'title': titleFieldValue,
      if (subtitleFieldValue != null) 'subtitle': subtitleFieldValue,
      if (contentFieldValue != null) 'content': contentFieldValue,
      if (createdAtFieldValue != null) 'createdAt': createdAtFieldValue,
      if (commentsFieldValue != null) 'comments': commentsFieldValue,
      if (tagsFieldValue != null) 'tags': tagsFieldValue,
      if (bannerImageUrlFieldValue != null)
        'bannerImageUrl': bannerImageUrlFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => snapshot.data()!,
      toFirestore: (value, options) => value,
    );
    return castedReference.set(json, options);
  }

  void transactionSet(
    Transaction transaction,
    EntryDto model, {
    SetOptions? options,
    FieldValue? titleFieldValue,
    FieldValue? subtitleFieldValue,
    FieldValue? contentFieldValue,
    FieldValue? createdAtFieldValue,
    FieldValue? commentsFieldValue,
    FieldValue? tagsFieldValue,
    FieldValue? bannerImageUrlFieldValue,
  }) {
    final json = {
      ...model.toJson()..remove('id'),
      if (titleFieldValue != null) 'title': titleFieldValue,
      if (subtitleFieldValue != null) 'subtitle': subtitleFieldValue,
      if (contentFieldValue != null) 'content': contentFieldValue,
      if (createdAtFieldValue != null) 'createdAt': createdAtFieldValue,
      if (commentsFieldValue != null) 'comments': commentsFieldValue,
      if (tagsFieldValue != null) 'tags': tagsFieldValue,
      if (bannerImageUrlFieldValue != null)
        'bannerImageUrl': bannerImageUrlFieldValue,
    };

    transaction.set(reference, json, options);
  }

  void batchSet(
    WriteBatch batch,
    EntryDto model, {
    SetOptions? options,
    FieldValue? titleFieldValue,
    FieldValue? subtitleFieldValue,
    FieldValue? contentFieldValue,
    FieldValue? createdAtFieldValue,
    FieldValue? commentsFieldValue,
    FieldValue? tagsFieldValue,
    FieldValue? bannerImageUrlFieldValue,
  }) {
    final json = {
      ...model.toJson()..remove('id'),
      if (titleFieldValue != null) 'title': titleFieldValue,
      if (subtitleFieldValue != null) 'subtitle': subtitleFieldValue,
      if (contentFieldValue != null) 'content': contentFieldValue,
      if (createdAtFieldValue != null) 'createdAt': createdAtFieldValue,
      if (commentsFieldValue != null) 'comments': commentsFieldValue,
      if (tagsFieldValue != null) 'tags': tagsFieldValue,
      if (bannerImageUrlFieldValue != null)
        'bannerImageUrl': bannerImageUrlFieldValue,
    };

    batch.set(reference, json, options);
  }

  Future<void> update({
    Object? title = _sentinel,
    FieldValue? titleFieldValue,
    Object? subtitle = _sentinel,
    FieldValue? subtitleFieldValue,
    Object? content = _sentinel,
    FieldValue? contentFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? comments = _sentinel,
    FieldValue? commentsFieldValue,
    Object? tags = _sentinel,
    FieldValue? tagsFieldValue,
    Object? bannerImageUrl = _sentinel,
    FieldValue? bannerImageUrlFieldValue,
  }) async {
    assert(
      title == _sentinel || titleFieldValue == null,
      "Cannot specify both title and titleFieldValue",
    );
    assert(
      subtitle == _sentinel || subtitleFieldValue == null,
      "Cannot specify both subtitle and subtitleFieldValue",
    );
    assert(
      content == _sentinel || contentFieldValue == null,
      "Cannot specify both content and contentFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      comments == _sentinel || commentsFieldValue == null,
      "Cannot specify both comments and commentsFieldValue",
    );
    assert(
      tags == _sentinel || tagsFieldValue == null,
      "Cannot specify both tags and tagsFieldValue",
    );
    assert(
      bannerImageUrl == _sentinel || bannerImageUrlFieldValue == null,
      "Cannot specify both bannerImageUrl and bannerImageUrlFieldValue",
    );
    final json = {
      if (title != _sentinel) 'title': (title as String),
      if (titleFieldValue != null) 'title': titleFieldValue,
      if (subtitle != _sentinel) 'subtitle': (subtitle as String),
      if (subtitleFieldValue != null) 'subtitle': subtitleFieldValue,
      if (content != _sentinel) 'content': (content as String),
      if (contentFieldValue != null) 'content': contentFieldValue,
      if (createdAt != _sentinel)
        'createdAt': (createdAt as DateTime).toIso8601String(),
      if (createdAtFieldValue != null) 'createdAt': createdAtFieldValue,
      if (comments != _sentinel)
        'comments': (comments as List<CommentDtoDocumentReference>)
            .map((e) => (e).reference)
            .toList(),
      if (commentsFieldValue != null) 'comments': commentsFieldValue,
      if (tags != _sentinel)
        'tags': (tags as List<String>?)?.map((e) => (e)).toList(),
      if (tagsFieldValue != null) 'tags': tagsFieldValue,
      if (bannerImageUrl != _sentinel)
        'bannerImageUrl': (bannerImageUrl as String),
      if (bannerImageUrlFieldValue != null)
        'bannerImageUrl': bannerImageUrlFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? title = _sentinel,
    FieldValue? titleFieldValue,
    Object? subtitle = _sentinel,
    FieldValue? subtitleFieldValue,
    Object? content = _sentinel,
    FieldValue? contentFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? comments = _sentinel,
    FieldValue? commentsFieldValue,
    Object? tags = _sentinel,
    FieldValue? tagsFieldValue,
    Object? bannerImageUrl = _sentinel,
    FieldValue? bannerImageUrlFieldValue,
  }) {
    assert(
      title == _sentinel || titleFieldValue == null,
      "Cannot specify both title and titleFieldValue",
    );
    assert(
      subtitle == _sentinel || subtitleFieldValue == null,
      "Cannot specify both subtitle and subtitleFieldValue",
    );
    assert(
      content == _sentinel || contentFieldValue == null,
      "Cannot specify both content and contentFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      comments == _sentinel || commentsFieldValue == null,
      "Cannot specify both comments and commentsFieldValue",
    );
    assert(
      tags == _sentinel || tagsFieldValue == null,
      "Cannot specify both tags and tagsFieldValue",
    );
    assert(
      bannerImageUrl == _sentinel || bannerImageUrlFieldValue == null,
      "Cannot specify both bannerImageUrl and bannerImageUrlFieldValue",
    );
    final json = {
      if (title != _sentinel) 'title': (title as String),
      if (titleFieldValue != null) 'title': titleFieldValue,
      if (subtitle != _sentinel) 'subtitle': (subtitle as String),
      if (subtitleFieldValue != null) 'subtitle': subtitleFieldValue,
      if (content != _sentinel) 'content': (content as String),
      if (contentFieldValue != null) 'content': contentFieldValue,
      if (createdAt != _sentinel)
        'createdAt': (createdAt as DateTime).toIso8601String(),
      if (createdAtFieldValue != null) 'createdAt': createdAtFieldValue,
      if (comments != _sentinel)
        'comments': (comments as List<CommentDtoDocumentReference>)
            .map((e) => (e).reference)
            .toList(),
      if (commentsFieldValue != null) 'comments': commentsFieldValue,
      if (tags != _sentinel)
        'tags': (tags as List<String>?)?.map((e) => (e)).toList(),
      if (tagsFieldValue != null) 'tags': tagsFieldValue,
      if (bannerImageUrl != _sentinel)
        'bannerImageUrl': (bannerImageUrl as String),
      if (bannerImageUrlFieldValue != null)
        'bannerImageUrl': bannerImageUrlFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? title = _sentinel,
    FieldValue? titleFieldValue,
    Object? subtitle = _sentinel,
    FieldValue? subtitleFieldValue,
    Object? content = _sentinel,
    FieldValue? contentFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? comments = _sentinel,
    FieldValue? commentsFieldValue,
    Object? tags = _sentinel,
    FieldValue? tagsFieldValue,
    Object? bannerImageUrl = _sentinel,
    FieldValue? bannerImageUrlFieldValue,
  }) {
    assert(
      title == _sentinel || titleFieldValue == null,
      "Cannot specify both title and titleFieldValue",
    );
    assert(
      subtitle == _sentinel || subtitleFieldValue == null,
      "Cannot specify both subtitle and subtitleFieldValue",
    );
    assert(
      content == _sentinel || contentFieldValue == null,
      "Cannot specify both content and contentFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      comments == _sentinel || commentsFieldValue == null,
      "Cannot specify both comments and commentsFieldValue",
    );
    assert(
      tags == _sentinel || tagsFieldValue == null,
      "Cannot specify both tags and tagsFieldValue",
    );
    assert(
      bannerImageUrl == _sentinel || bannerImageUrlFieldValue == null,
      "Cannot specify both bannerImageUrl and bannerImageUrlFieldValue",
    );
    final json = {
      if (title != _sentinel) 'title': (title as String),
      if (titleFieldValue != null) 'title': titleFieldValue,
      if (subtitle != _sentinel) 'subtitle': (subtitle as String),
      if (subtitleFieldValue != null) 'subtitle': subtitleFieldValue,
      if (content != _sentinel) 'content': (content as String),
      if (contentFieldValue != null) 'content': contentFieldValue,
      if (createdAt != _sentinel)
        'createdAt': (createdAt as DateTime).toIso8601String(),
      if (createdAtFieldValue != null) 'createdAt': createdAtFieldValue,
      if (comments != _sentinel)
        'comments': (comments as List<CommentDtoDocumentReference>)
            .map((e) => (e).reference)
            .toList(),
      if (commentsFieldValue != null) 'comments': commentsFieldValue,
      if (tags != _sentinel)
        'tags': (tags as List<String>?)?.map((e) => (e)).toList(),
      if (tagsFieldValue != null) 'tags': tagsFieldValue,
      if (bannerImageUrl != _sentinel)
        'bannerImageUrl': (bannerImageUrl as String),
      if (bannerImageUrlFieldValue != null)
        'bannerImageUrl': bannerImageUrlFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is EntryDtoDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class EntryDtoQuery
    implements QueryReference<EntryDto, EntryDtoQuerySnapshot> {
  @override
  EntryDtoQuery limit(int limit);

  @override
  EntryDtoQuery limitToLast(int limit);

  EntryDtoQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  EntryDtoQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  EntryDtoQuery whereSubtitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  EntryDtoQuery whereContent({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  EntryDtoQuery whereCreatedAt({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  });

  EntryDtoQuery whereComments({
    List<CommentDtoDocumentReference>? isEqualTo,
    List<CommentDtoDocumentReference>? isNotEqualTo,
    List<CommentDtoDocumentReference>? isLessThan,
    List<CommentDtoDocumentReference>? isLessThanOrEqualTo,
    List<CommentDtoDocumentReference>? isGreaterThan,
    List<CommentDtoDocumentReference>? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<CommentDtoDocumentReference>? arrayContainsAny,
    bool? isNull,
  });

  EntryDtoQuery whereTags({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<String>? arrayContainsAny,
    bool? isNull,
  });

  EntryDtoQuery whereBannerImageUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  EntryDtoQuery orderByDocumentId({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  });

  EntryDtoQuery orderByTitle({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  });

  EntryDtoQuery orderBySubtitle({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  });

  EntryDtoQuery orderByContent({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  });

  EntryDtoQuery orderByCreatedAt({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  });

  EntryDtoQuery orderByComments({
    bool descending = false,
    List<CommentDtoDocumentReference>? startAt,
    List<CommentDtoDocumentReference>? startAfter,
    List<CommentDtoDocumentReference>? endAt,
    List<CommentDtoDocumentReference>? endBefore,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  });

  EntryDtoQuery orderByTags({
    bool descending = false,
    List<String>? startAt,
    List<String>? startAfter,
    List<String>? endAt,
    List<String>? endBefore,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  });

  EntryDtoQuery orderByBannerImageUrl({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  });
}

class _$EntryDtoQuery extends QueryReference<EntryDto, EntryDtoQuerySnapshot>
    implements EntryDtoQuery {
  _$EntryDtoQuery(
    this._collection, {
    required Query<EntryDto> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<EntryDtoQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(EntryDtoQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<EntryDtoQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(EntryDtoQuerySnapshot._fromQuerySnapshot);
  }

  @override
  EntryDtoQuery limit(int limit) {
    return _$EntryDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  EntryDtoQuery limitToLast(int limit) {
    return _$EntryDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  EntryDtoQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$EntryDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  EntryDtoQuery whereTitle({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$EntryDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        'title',
        isEqualTo: isEqualTo != _sentinel ? (isEqualTo as String) : null,
        isNotEqualTo:
            isNotEqualTo != _sentinel ? (isNotEqualTo as String) : null,
        isLessThan: isLessThan != null ? (isLessThan as String) : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? (isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null ? (isGreaterThan as String) : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? (isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => (e)),
        whereNotIn: whereNotIn?.map((e) => (e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  EntryDtoQuery whereSubtitle({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$EntryDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        'subtitle',
        isEqualTo: isEqualTo != _sentinel ? (isEqualTo as String) : null,
        isNotEqualTo:
            isNotEqualTo != _sentinel ? (isNotEqualTo as String) : null,
        isLessThan: isLessThan != null ? (isLessThan as String) : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? (isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null ? (isGreaterThan as String) : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? (isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => (e)),
        whereNotIn: whereNotIn?.map((e) => (e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  EntryDtoQuery whereContent({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$EntryDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        'content',
        isEqualTo: isEqualTo != _sentinel ? (isEqualTo as String) : null,
        isNotEqualTo:
            isNotEqualTo != _sentinel ? (isNotEqualTo as String) : null,
        isLessThan: isLessThan != null ? (isLessThan as String) : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? (isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null ? (isGreaterThan as String) : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? (isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => (e)),
        whereNotIn: whereNotIn?.map((e) => (e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  EntryDtoQuery whereCreatedAt({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  }) {
    return _$EntryDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        'createdAt',
        isEqualTo: isEqualTo != _sentinel
            ? (isEqualTo as DateTime).toIso8601String()
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? (isNotEqualTo as DateTime).toIso8601String()
            : null,
        isLessThan: isLessThan != null
            ? (isLessThan as DateTime).toIso8601String()
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? (isLessThanOrEqualTo as DateTime).toIso8601String()
            : null,
        isGreaterThan: isGreaterThan != null
            ? (isGreaterThan as DateTime).toIso8601String()
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? (isGreaterThanOrEqualTo as DateTime).toIso8601String()
            : null,
        whereIn: whereIn?.map((e) => (e).toIso8601String()),
        whereNotIn: whereNotIn?.map((e) => (e).toIso8601String()),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  EntryDtoQuery whereComments({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<CommentDtoDocumentReference>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$EntryDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        'comments',
        isEqualTo: isEqualTo != _sentinel
            ? (isEqualTo as List<CommentDtoDocumentReference>)
                .map((e) => (e).reference)
                .toList()
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? (isNotEqualTo as List<CommentDtoDocumentReference>)
                .map((e) => (e).reference)
                .toList()
            : null,
        isLessThan: isLessThan != null
            ? (isLessThan as List<CommentDtoDocumentReference>)
                .map((e) => (e).reference)
                .toList()
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? (isLessThanOrEqualTo as List<CommentDtoDocumentReference>)
                .map((e) => (e).reference)
                .toList()
            : null,
        isGreaterThan: isGreaterThan != null
            ? (isGreaterThan as List<CommentDtoDocumentReference>)
                .map((e) => (e).reference)
                .toList()
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? (isGreaterThanOrEqualTo as List<CommentDtoDocumentReference>)
                .map((e) => (e).reference)
                .toList()
            : null,
        arrayContains: arrayContains != null
            ? (arrayContains as List<CommentDtoDocumentReference>)
                .map((e) => (e).reference)
                .toList()
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? (arrayContainsAny).map((e) => (e).reference).toList()
                as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  EntryDtoQuery whereTags({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<String>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$EntryDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        'tags',
        isEqualTo: isEqualTo != _sentinel
            ? (isEqualTo as List<String>?)?.map((e) => (e)).toList()
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? (isNotEqualTo as List<String>?)?.map((e) => (e)).toList()
            : null,
        isLessThan: isLessThan != null
            ? (isLessThan as List<String>?)?.map((e) => (e)).toList()
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? (isLessThanOrEqualTo as List<String>?)?.map((e) => (e)).toList()
            : null,
        isGreaterThan: isGreaterThan != null
            ? (isGreaterThan as List<String>?)?.map((e) => (e)).toList()
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? (isGreaterThanOrEqualTo as List<String>?)
                ?.map((e) => (e))
                .toList()
            : null,
        arrayContains: arrayContains != null
            ? (arrayContains as List<String>?)?.map((e) => (e)).toList()
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? (arrayContainsAny)?.map((e) => (e)).toList() as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  EntryDtoQuery whereBannerImageUrl({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$EntryDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        'bannerImageUrl',
        isEqualTo: isEqualTo != _sentinel ? (isEqualTo as String) : null,
        isNotEqualTo:
            isNotEqualTo != _sentinel ? (isNotEqualTo as String) : null,
        isLessThan: isLessThan != null ? (isLessThan as String) : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? (isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null ? (isGreaterThan as String) : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? (isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => (e)),
        whereNotIn: whereNotIn?.map((e) => (e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  EntryDtoQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EntryDtoQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  EntryDtoQuery orderByTitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy('title', descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EntryDtoQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  EntryDtoQuery orderBySubtitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy('subtitle', descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EntryDtoQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  EntryDtoQuery orderByContent({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy('content', descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EntryDtoQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  EntryDtoQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy('createdAt', descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EntryDtoQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  EntryDtoQuery orderByComments({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy('comments', descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EntryDtoQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  EntryDtoQuery orderByTags({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy('tags', descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EntryDtoQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  EntryDtoQuery orderByBannerImageUrl({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy('bannerImageUrl',
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$EntryDtoQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$EntryDtoQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class EntryDtoDocumentSnapshot extends FirestoreDocumentSnapshot<EntryDto> {
  EntryDtoDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<EntryDto> snapshot;

  @override
  EntryDtoDocumentReference get reference {
    return EntryDtoDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final EntryDto? data;
}

class EntryDtoQuerySnapshot
    extends FirestoreQuerySnapshot<EntryDto, EntryDtoQueryDocumentSnapshot> {
  EntryDtoQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory EntryDtoQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<EntryDto> snapshot,
  ) {
    final docs = snapshot.docs.map(EntryDtoQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        EntryDtoDocumentSnapshot._,
      );
    }).toList();

    return EntryDtoQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<EntryDtoDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    EntryDtoDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<EntryDtoDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<EntryDto> snapshot;

  @override
  final List<EntryDtoQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<EntryDtoDocumentSnapshot>> docChanges;
}

class EntryDtoQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<EntryDto>
    implements EntryDtoDocumentSnapshot {
  EntryDtoQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<EntryDto> snapshot;

  @override
  final EntryDto data;

  @override
  EntryDtoDocumentReference get reference {
    return EntryDtoDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class CommentsCollectionReference
    implements
        CommentDtoQuery,
        FirestoreCollectionReference<CommentDto, CommentDtoQuerySnapshot> {
  factory CommentsCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$CommentsCollectionReference;

  static CommentDto fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return CommentDto.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    CommentDto value,
    SetOptions? options,
  ) {
    return {...value.toJson()..remove('id')}..remove('id');
  }

  @override
  CollectionReference<CommentDto> get reference;

  @override
  CommentDtoDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<CommentDtoDocumentReference> add(CommentDto value);
}

class _$CommentsCollectionReference extends _$CommentDtoQuery
    implements CommentsCollectionReference {
  factory _$CommentsCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$CommentsCollectionReference._(
      firestore.collection('comments').withConverter(
            fromFirestore: CommentsCollectionReference.fromFirestore,
            toFirestore: CommentsCollectionReference.toFirestore,
          ),
    );
  }

  _$CommentsCollectionReference._(
    CollectionReference<CommentDto> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<CommentDto> get reference =>
      super.reference as CollectionReference<CommentDto>;

  @override
  CommentDtoDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return CommentDtoDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<CommentDtoDocumentReference> add(CommentDto value) {
    return reference.add(value).then((ref) => CommentDtoDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$CommentsCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class CommentDtoDocumentReference
    extends FirestoreDocumentReference<CommentDto, CommentDtoDocumentSnapshot> {
  factory CommentDtoDocumentReference(DocumentReference<CommentDto> reference) =
      _$CommentDtoDocumentReference;

  DocumentReference<CommentDto> get reference;

  /// A reference to the [CommentsCollectionReference] containing this document.
  CommentsCollectionReference get parent {
    return _$CommentsCollectionReference(reference.firestore);
  }

  @override
  Stream<CommentDtoDocumentSnapshot> snapshots();

  @override
  Future<CommentDtoDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Sets data on the document, overwriting any existing data. If the document
  /// does not yet exist, it will be created.
  ///
  /// If [SetOptions] are provided, the data can be merged into an existing
  /// document instead of overwriting.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  Future<void> set(
    CommentDto model, {
    SetOptions? options,
    FieldValue contentFieldValue,
    FieldValue createdAtFieldValue,
    FieldValue authorNameFieldValue,
    FieldValue authorEmailFieldValue,
  });

  /// Writes to the document using the transaction API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void transactionSet(
    Transaction transaction,
    CommentDto model, {
    SetOptions? options,
    FieldValue contentFieldValue,
    FieldValue createdAtFieldValue,
    FieldValue authorNameFieldValue,
    FieldValue authorEmailFieldValue,
  });

  /// Writes to the document using the batch API.
  ///
  /// If the document does not exist yet, it will be created. If you pass
  /// [SetOptions], the provided data can be merged into the existing document.
  ///
  /// Any [FieldValue]s provided will replace the corresponding fields in the
  /// [model] during serialization.
  void batchSet(
    WriteBatch batch,
    CommentDto model, {
    SetOptions? options,
    FieldValue contentFieldValue,
    FieldValue createdAtFieldValue,
    FieldValue authorNameFieldValue,
    FieldValue authorEmailFieldValue,
  });

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String? content,
    FieldValue contentFieldValue,
    DateTime? createdAt,
    FieldValue createdAtFieldValue,
    String? authorName,
    FieldValue authorNameFieldValue,
    String? authorEmail,
    FieldValue authorEmailFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String? content,
    FieldValue contentFieldValue,
    DateTime? createdAt,
    FieldValue createdAtFieldValue,
    String? authorName,
    FieldValue authorNameFieldValue,
    String? authorEmail,
    FieldValue authorEmailFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    String? content,
    FieldValue contentFieldValue,
    DateTime? createdAt,
    FieldValue createdAtFieldValue,
    String? authorName,
    FieldValue authorNameFieldValue,
    String? authorEmail,
    FieldValue authorEmailFieldValue,
  });
}

class _$CommentDtoDocumentReference
    extends FirestoreDocumentReference<CommentDto, CommentDtoDocumentSnapshot>
    implements CommentDtoDocumentReference {
  _$CommentDtoDocumentReference(this.reference);

  @override
  final DocumentReference<CommentDto> reference;

  /// A reference to the [CommentsCollectionReference] containing this document.
  CommentsCollectionReference get parent {
    return _$CommentsCollectionReference(reference.firestore);
  }

  @override
  Stream<CommentDtoDocumentSnapshot> snapshots() {
    return reference.snapshots().map(CommentDtoDocumentSnapshot._);
  }

  @override
  Future<CommentDtoDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(CommentDtoDocumentSnapshot._);
  }

  @override
  Future<CommentDtoDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(CommentDtoDocumentSnapshot._);
  }

  Future<void> set(
    CommentDto model, {
    SetOptions? options,
    FieldValue? contentFieldValue,
    FieldValue? createdAtFieldValue,
    FieldValue? authorNameFieldValue,
    FieldValue? authorEmailFieldValue,
  }) async {
    final json = {
      ...model.toJson()..remove('id'),
      if (contentFieldValue != null) 'content': contentFieldValue,
      if (createdAtFieldValue != null) 'createdAt': createdAtFieldValue,
      if (authorNameFieldValue != null) 'authorName': authorNameFieldValue,
      if (authorEmailFieldValue != null) 'authorEmail': authorEmailFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => snapshot.data()!,
      toFirestore: (value, options) => value,
    );
    return castedReference.set(json, options);
  }

  void transactionSet(
    Transaction transaction,
    CommentDto model, {
    SetOptions? options,
    FieldValue? contentFieldValue,
    FieldValue? createdAtFieldValue,
    FieldValue? authorNameFieldValue,
    FieldValue? authorEmailFieldValue,
  }) {
    final json = {
      ...model.toJson()..remove('id'),
      if (contentFieldValue != null) 'content': contentFieldValue,
      if (createdAtFieldValue != null) 'createdAt': createdAtFieldValue,
      if (authorNameFieldValue != null) 'authorName': authorNameFieldValue,
      if (authorEmailFieldValue != null) 'authorEmail': authorEmailFieldValue,
    };

    transaction.set(reference, json, options);
  }

  void batchSet(
    WriteBatch batch,
    CommentDto model, {
    SetOptions? options,
    FieldValue? contentFieldValue,
    FieldValue? createdAtFieldValue,
    FieldValue? authorNameFieldValue,
    FieldValue? authorEmailFieldValue,
  }) {
    final json = {
      ...model.toJson()..remove('id'),
      if (contentFieldValue != null) 'content': contentFieldValue,
      if (createdAtFieldValue != null) 'createdAt': createdAtFieldValue,
      if (authorNameFieldValue != null) 'authorName': authorNameFieldValue,
      if (authorEmailFieldValue != null) 'authorEmail': authorEmailFieldValue,
    };

    batch.set(reference, json, options);
  }

  Future<void> update({
    Object? content = _sentinel,
    FieldValue? contentFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? authorName = _sentinel,
    FieldValue? authorNameFieldValue,
    Object? authorEmail = _sentinel,
    FieldValue? authorEmailFieldValue,
  }) async {
    assert(
      content == _sentinel || contentFieldValue == null,
      "Cannot specify both content and contentFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      authorName == _sentinel || authorNameFieldValue == null,
      "Cannot specify both authorName and authorNameFieldValue",
    );
    assert(
      authorEmail == _sentinel || authorEmailFieldValue == null,
      "Cannot specify both authorEmail and authorEmailFieldValue",
    );
    final json = {
      if (content != _sentinel) 'content': (content as String),
      if (contentFieldValue != null) 'content': contentFieldValue,
      if (createdAt != _sentinel)
        'createdAt': (createdAt as DateTime).toIso8601String(),
      if (createdAtFieldValue != null) 'createdAt': createdAtFieldValue,
      if (authorName != _sentinel) 'authorName': (authorName as String),
      if (authorNameFieldValue != null) 'authorName': authorNameFieldValue,
      if (authorEmail != _sentinel) 'authorEmail': (authorEmail as String),
      if (authorEmailFieldValue != null) 'authorEmail': authorEmailFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? content = _sentinel,
    FieldValue? contentFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? authorName = _sentinel,
    FieldValue? authorNameFieldValue,
    Object? authorEmail = _sentinel,
    FieldValue? authorEmailFieldValue,
  }) {
    assert(
      content == _sentinel || contentFieldValue == null,
      "Cannot specify both content and contentFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      authorName == _sentinel || authorNameFieldValue == null,
      "Cannot specify both authorName and authorNameFieldValue",
    );
    assert(
      authorEmail == _sentinel || authorEmailFieldValue == null,
      "Cannot specify both authorEmail and authorEmailFieldValue",
    );
    final json = {
      if (content != _sentinel) 'content': (content as String),
      if (contentFieldValue != null) 'content': contentFieldValue,
      if (createdAt != _sentinel)
        'createdAt': (createdAt as DateTime).toIso8601String(),
      if (createdAtFieldValue != null) 'createdAt': createdAtFieldValue,
      if (authorName != _sentinel) 'authorName': (authorName as String),
      if (authorNameFieldValue != null) 'authorName': authorNameFieldValue,
      if (authorEmail != _sentinel) 'authorEmail': (authorEmail as String),
      if (authorEmailFieldValue != null) 'authorEmail': authorEmailFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? content = _sentinel,
    FieldValue? contentFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? authorName = _sentinel,
    FieldValue? authorNameFieldValue,
    Object? authorEmail = _sentinel,
    FieldValue? authorEmailFieldValue,
  }) {
    assert(
      content == _sentinel || contentFieldValue == null,
      "Cannot specify both content and contentFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      authorName == _sentinel || authorNameFieldValue == null,
      "Cannot specify both authorName and authorNameFieldValue",
    );
    assert(
      authorEmail == _sentinel || authorEmailFieldValue == null,
      "Cannot specify both authorEmail and authorEmailFieldValue",
    );
    final json = {
      if (content != _sentinel) 'content': (content as String),
      if (contentFieldValue != null) 'content': contentFieldValue,
      if (createdAt != _sentinel)
        'createdAt': (createdAt as DateTime).toIso8601String(),
      if (createdAtFieldValue != null) 'createdAt': createdAtFieldValue,
      if (authorName != _sentinel) 'authorName': (authorName as String),
      if (authorNameFieldValue != null) 'authorName': authorNameFieldValue,
      if (authorEmail != _sentinel) 'authorEmail': (authorEmail as String),
      if (authorEmailFieldValue != null) 'authorEmail': authorEmailFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is CommentDtoDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class CommentDtoQuery
    implements QueryReference<CommentDto, CommentDtoQuerySnapshot> {
  @override
  CommentDtoQuery limit(int limit);

  @override
  CommentDtoQuery limitToLast(int limit);

  CommentDtoQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  CommentDtoQuery whereContent({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  CommentDtoQuery whereCreatedAt({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  });

  CommentDtoQuery whereAuthorName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  CommentDtoQuery whereAuthorEmail({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  CommentDtoQuery orderByDocumentId({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CommentDtoDocumentSnapshot? startAtDocument,
    CommentDtoDocumentSnapshot? endAtDocument,
    CommentDtoDocumentSnapshot? endBeforeDocument,
    CommentDtoDocumentSnapshot? startAfterDocument,
  });

  CommentDtoQuery orderByContent({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CommentDtoDocumentSnapshot? startAtDocument,
    CommentDtoDocumentSnapshot? endAtDocument,
    CommentDtoDocumentSnapshot? endBeforeDocument,
    CommentDtoDocumentSnapshot? startAfterDocument,
  });

  CommentDtoQuery orderByCreatedAt({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    CommentDtoDocumentSnapshot? startAtDocument,
    CommentDtoDocumentSnapshot? endAtDocument,
    CommentDtoDocumentSnapshot? endBeforeDocument,
    CommentDtoDocumentSnapshot? startAfterDocument,
  });

  CommentDtoQuery orderByAuthorName({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CommentDtoDocumentSnapshot? startAtDocument,
    CommentDtoDocumentSnapshot? endAtDocument,
    CommentDtoDocumentSnapshot? endBeforeDocument,
    CommentDtoDocumentSnapshot? startAfterDocument,
  });

  CommentDtoQuery orderByAuthorEmail({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    CommentDtoDocumentSnapshot? startAtDocument,
    CommentDtoDocumentSnapshot? endAtDocument,
    CommentDtoDocumentSnapshot? endBeforeDocument,
    CommentDtoDocumentSnapshot? startAfterDocument,
  });
}

class _$CommentDtoQuery
    extends QueryReference<CommentDto, CommentDtoQuerySnapshot>
    implements CommentDtoQuery {
  _$CommentDtoQuery(
    this._collection, {
    required Query<CommentDto> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<CommentDtoQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(CommentDtoQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<CommentDtoQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(CommentDtoQuerySnapshot._fromQuerySnapshot);
  }

  @override
  CommentDtoQuery limit(int limit) {
    return _$CommentDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CommentDtoQuery limitToLast(int limit) {
    return _$CommentDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CommentDtoQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$CommentDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CommentDtoQuery whereContent({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$CommentDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        'content',
        isEqualTo: isEqualTo != _sentinel ? (isEqualTo as String) : null,
        isNotEqualTo:
            isNotEqualTo != _sentinel ? (isNotEqualTo as String) : null,
        isLessThan: isLessThan != null ? (isLessThan as String) : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? (isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null ? (isGreaterThan as String) : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? (isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => (e)),
        whereNotIn: whereNotIn?.map((e) => (e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CommentDtoQuery whereCreatedAt({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  }) {
    return _$CommentDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        'createdAt',
        isEqualTo: isEqualTo != _sentinel
            ? (isEqualTo as DateTime).toIso8601String()
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? (isNotEqualTo as DateTime).toIso8601String()
            : null,
        isLessThan: isLessThan != null
            ? (isLessThan as DateTime).toIso8601String()
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? (isLessThanOrEqualTo as DateTime).toIso8601String()
            : null,
        isGreaterThan: isGreaterThan != null
            ? (isGreaterThan as DateTime).toIso8601String()
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? (isGreaterThanOrEqualTo as DateTime).toIso8601String()
            : null,
        whereIn: whereIn?.map((e) => (e).toIso8601String()),
        whereNotIn: whereNotIn?.map((e) => (e).toIso8601String()),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CommentDtoQuery whereAuthorName({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$CommentDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        'authorName',
        isEqualTo: isEqualTo != _sentinel ? (isEqualTo as String) : null,
        isNotEqualTo:
            isNotEqualTo != _sentinel ? (isNotEqualTo as String) : null,
        isLessThan: isLessThan != null ? (isLessThan as String) : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? (isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null ? (isGreaterThan as String) : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? (isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => (e)),
        whereNotIn: whereNotIn?.map((e) => (e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CommentDtoQuery whereAuthorEmail({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$CommentDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        'authorEmail',
        isEqualTo: isEqualTo != _sentinel ? (isEqualTo as String) : null,
        isNotEqualTo:
            isNotEqualTo != _sentinel ? (isNotEqualTo as String) : null,
        isLessThan: isLessThan != null ? (isLessThan as String) : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? (isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null ? (isGreaterThan as String) : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? (isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => (e)),
        whereNotIn: whereNotIn?.map((e) => (e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CommentDtoQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CommentDtoDocumentSnapshot? startAtDocument,
    CommentDtoDocumentSnapshot? endAtDocument,
    CommentDtoDocumentSnapshot? endBeforeDocument,
    CommentDtoDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CommentDtoQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  CommentDtoQuery orderByContent({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CommentDtoDocumentSnapshot? startAtDocument,
    CommentDtoDocumentSnapshot? endAtDocument,
    CommentDtoDocumentSnapshot? endBeforeDocument,
    CommentDtoDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy('content', descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CommentDtoQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  CommentDtoQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CommentDtoDocumentSnapshot? startAtDocument,
    CommentDtoDocumentSnapshot? endAtDocument,
    CommentDtoDocumentSnapshot? endBeforeDocument,
    CommentDtoDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy('createdAt', descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CommentDtoQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  CommentDtoQuery orderByAuthorName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CommentDtoDocumentSnapshot? startAtDocument,
    CommentDtoDocumentSnapshot? endAtDocument,
    CommentDtoDocumentSnapshot? endBeforeDocument,
    CommentDtoDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy('authorName', descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CommentDtoQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  CommentDtoQuery orderByAuthorEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CommentDtoDocumentSnapshot? startAtDocument,
    CommentDtoDocumentSnapshot? endAtDocument,
    CommentDtoDocumentSnapshot? endBeforeDocument,
    CommentDtoDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy('authorEmail', descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$CommentDtoQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$CommentDtoQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class CommentDtoDocumentSnapshot extends FirestoreDocumentSnapshot<CommentDto> {
  CommentDtoDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<CommentDto> snapshot;

  @override
  CommentDtoDocumentReference get reference {
    return CommentDtoDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final CommentDto? data;
}

class CommentDtoQuerySnapshot extends FirestoreQuerySnapshot<CommentDto,
    CommentDtoQueryDocumentSnapshot> {
  CommentDtoQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory CommentDtoQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<CommentDto> snapshot,
  ) {
    final docs = snapshot.docs.map(CommentDtoQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        CommentDtoDocumentSnapshot._,
      );
    }).toList();

    return CommentDtoQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<CommentDtoDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    CommentDtoDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<CommentDtoDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<CommentDto> snapshot;

  @override
  final List<CommentDtoQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<CommentDtoDocumentSnapshot>> docChanges;
}

class CommentDtoQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<CommentDto>
    implements CommentDtoDocumentSnapshot {
  CommentDtoQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<CommentDto> snapshot;

  @override
  final CommentDto data;

  @override
  CommentDtoDocumentReference get reference {
    return CommentDtoDocumentReference(snapshot.reference);
  }
}
