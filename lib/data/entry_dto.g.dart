// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_dto.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

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
abstract class EntryDtoCollectionReference
    implements
        EntryDtoQuery,
        FirestoreCollectionReference<EntryDto, EntryDtoQuerySnapshot> {
  factory EntryDtoCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$EntryDtoCollectionReference;

  static EntryDto fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return EntryDto.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    EntryDto value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<EntryDto> get reference;

  @override
  EntryDtoDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<EntryDtoDocumentReference> add(EntryDto value);
}

class _$EntryDtoCollectionReference extends _$EntryDtoQuery
    implements EntryDtoCollectionReference {
  factory _$EntryDtoCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$EntryDtoCollectionReference._(
      firestore.collection('entries').withConverter(
            fromFirestore: EntryDtoCollectionReference.fromFirestore,
            toFirestore: EntryDtoCollectionReference.toFirestore,
          ),
    );
  }

  _$EntryDtoCollectionReference._(
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
    return other is _$EntryDtoCollectionReference &&
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

  /// A reference to the [EntryDtoCollectionReference] containing this document.
  EntryDtoCollectionReference get parent {
    return _$EntryDtoCollectionReference(reference.firestore);
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
    FieldValue tagsFieldValue,
    FieldValue commentsFieldValue,
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
    FieldValue tagsFieldValue,
    FieldValue commentsFieldValue,
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
    FieldValue tagsFieldValue,
    FieldValue commentsFieldValue,
  });

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String title,
    FieldValue titleFieldValue,
    String subtitle,
    FieldValue subtitleFieldValue,
    String content,
    FieldValue contentFieldValue,
    DateTime createdAt,
    FieldValue createdAtFieldValue,
    List<String> tags,
    FieldValue tagsFieldValue,
    List<InvalidType> comments,
    FieldValue commentsFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String title,
    FieldValue titleFieldValue,
    String subtitle,
    FieldValue subtitleFieldValue,
    String content,
    FieldValue contentFieldValue,
    DateTime createdAt,
    FieldValue createdAtFieldValue,
    List<String> tags,
    FieldValue tagsFieldValue,
    List<InvalidType> comments,
    FieldValue commentsFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    String title,
    FieldValue titleFieldValue,
    String subtitle,
    FieldValue subtitleFieldValue,
    String content,
    FieldValue contentFieldValue,
    DateTime createdAt,
    FieldValue createdAtFieldValue,
    List<String> tags,
    FieldValue tagsFieldValue,
    List<InvalidType> comments,
    FieldValue commentsFieldValue,
  });
}

class _$EntryDtoDocumentReference
    extends FirestoreDocumentReference<EntryDto, EntryDtoDocumentSnapshot>
    implements EntryDtoDocumentReference {
  _$EntryDtoDocumentReference(this.reference);

  @override
  final DocumentReference<EntryDto> reference;

  /// A reference to the [EntryDtoCollectionReference] containing this document.
  EntryDtoCollectionReference get parent {
    return _$EntryDtoCollectionReference(reference.firestore);
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
    FieldValue? tagsFieldValue,
    FieldValue? commentsFieldValue,
  }) async {
    final json = {
      ...model.toJson(),
      if (titleFieldValue != null)
        _$$EntryDtoImplFieldMap['title']!: titleFieldValue,
      if (subtitleFieldValue != null)
        _$$EntryDtoImplFieldMap['subtitle']!: subtitleFieldValue,
      if (contentFieldValue != null)
        _$$EntryDtoImplFieldMap['content']!: contentFieldValue,
      if (createdAtFieldValue != null)
        _$$EntryDtoImplFieldMap['createdAt']!: createdAtFieldValue,
      if (tagsFieldValue != null)
        _$$EntryDtoImplFieldMap['tags']!: tagsFieldValue,
      if (commentsFieldValue != null)
        _$$EntryDtoImplFieldMap['comments']!: commentsFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => throw UnimplementedError(),
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
    FieldValue? tagsFieldValue,
    FieldValue? commentsFieldValue,
  }) {
    final json = {
      ...model.toJson(),
      if (titleFieldValue != null)
        _$$EntryDtoImplFieldMap['title']!: titleFieldValue,
      if (subtitleFieldValue != null)
        _$$EntryDtoImplFieldMap['subtitle']!: subtitleFieldValue,
      if (contentFieldValue != null)
        _$$EntryDtoImplFieldMap['content']!: contentFieldValue,
      if (createdAtFieldValue != null)
        _$$EntryDtoImplFieldMap['createdAt']!: createdAtFieldValue,
      if (tagsFieldValue != null)
        _$$EntryDtoImplFieldMap['tags']!: tagsFieldValue,
      if (commentsFieldValue != null)
        _$$EntryDtoImplFieldMap['comments']!: commentsFieldValue,
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
    FieldValue? tagsFieldValue,
    FieldValue? commentsFieldValue,
  }) {
    final json = {
      ...model.toJson(),
      if (titleFieldValue != null)
        _$$EntryDtoImplFieldMap['title']!: titleFieldValue,
      if (subtitleFieldValue != null)
        _$$EntryDtoImplFieldMap['subtitle']!: subtitleFieldValue,
      if (contentFieldValue != null)
        _$$EntryDtoImplFieldMap['content']!: contentFieldValue,
      if (createdAtFieldValue != null)
        _$$EntryDtoImplFieldMap['createdAt']!: createdAtFieldValue,
      if (tagsFieldValue != null)
        _$$EntryDtoImplFieldMap['tags']!: tagsFieldValue,
      if (commentsFieldValue != null)
        _$$EntryDtoImplFieldMap['comments']!: commentsFieldValue,
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
    Object? tags = _sentinel,
    FieldValue? tagsFieldValue,
    Object? comments = _sentinel,
    FieldValue? commentsFieldValue,
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
      tags == _sentinel || tagsFieldValue == null,
      "Cannot specify both tags and tagsFieldValue",
    );
    assert(
      comments == _sentinel || commentsFieldValue == null,
      "Cannot specify both comments and commentsFieldValue",
    );
    final json = {
      if (title != _sentinel)
        _$$EntryDtoImplFieldMap['title']!:
            _$$EntryDtoImplPerFieldToJson.title(title as String),
      if (titleFieldValue != null)
        _$$EntryDtoImplFieldMap['title']!: titleFieldValue,
      if (subtitle != _sentinel)
        _$$EntryDtoImplFieldMap['subtitle']!:
            _$$EntryDtoImplPerFieldToJson.subtitle(subtitle as String),
      if (subtitleFieldValue != null)
        _$$EntryDtoImplFieldMap['subtitle']!: subtitleFieldValue,
      if (content != _sentinel)
        _$$EntryDtoImplFieldMap['content']!:
            _$$EntryDtoImplPerFieldToJson.content(content as String),
      if (contentFieldValue != null)
        _$$EntryDtoImplFieldMap['content']!: contentFieldValue,
      if (createdAt != _sentinel)
        _$$EntryDtoImplFieldMap['createdAt']!:
            _$$EntryDtoImplPerFieldToJson.createdAt(createdAt as DateTime),
      if (createdAtFieldValue != null)
        _$$EntryDtoImplFieldMap['createdAt']!: createdAtFieldValue,
      if (tags != _sentinel)
        _$$EntryDtoImplFieldMap['tags']!:
            _$$EntryDtoImplPerFieldToJson.tags(tags as List<String>),
      if (tagsFieldValue != null)
        _$$EntryDtoImplFieldMap['tags']!: tagsFieldValue,
      if (comments != _sentinel)
        _$$EntryDtoImplFieldMap['comments']!: _$$EntryDtoImplPerFieldToJson
            .comments(comments as List<InvalidType>),
      if (commentsFieldValue != null)
        _$$EntryDtoImplFieldMap['comments']!: commentsFieldValue,
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
    Object? tags = _sentinel,
    FieldValue? tagsFieldValue,
    Object? comments = _sentinel,
    FieldValue? commentsFieldValue,
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
      tags == _sentinel || tagsFieldValue == null,
      "Cannot specify both tags and tagsFieldValue",
    );
    assert(
      comments == _sentinel || commentsFieldValue == null,
      "Cannot specify both comments and commentsFieldValue",
    );
    final json = {
      if (title != _sentinel)
        _$$EntryDtoImplFieldMap['title']!:
            _$$EntryDtoImplPerFieldToJson.title(title as String),
      if (titleFieldValue != null)
        _$$EntryDtoImplFieldMap['title']!: titleFieldValue,
      if (subtitle != _sentinel)
        _$$EntryDtoImplFieldMap['subtitle']!:
            _$$EntryDtoImplPerFieldToJson.subtitle(subtitle as String),
      if (subtitleFieldValue != null)
        _$$EntryDtoImplFieldMap['subtitle']!: subtitleFieldValue,
      if (content != _sentinel)
        _$$EntryDtoImplFieldMap['content']!:
            _$$EntryDtoImplPerFieldToJson.content(content as String),
      if (contentFieldValue != null)
        _$$EntryDtoImplFieldMap['content']!: contentFieldValue,
      if (createdAt != _sentinel)
        _$$EntryDtoImplFieldMap['createdAt']!:
            _$$EntryDtoImplPerFieldToJson.createdAt(createdAt as DateTime),
      if (createdAtFieldValue != null)
        _$$EntryDtoImplFieldMap['createdAt']!: createdAtFieldValue,
      if (tags != _sentinel)
        _$$EntryDtoImplFieldMap['tags']!:
            _$$EntryDtoImplPerFieldToJson.tags(tags as List<String>),
      if (tagsFieldValue != null)
        _$$EntryDtoImplFieldMap['tags']!: tagsFieldValue,
      if (comments != _sentinel)
        _$$EntryDtoImplFieldMap['comments']!: _$$EntryDtoImplPerFieldToJson
            .comments(comments as List<InvalidType>),
      if (commentsFieldValue != null)
        _$$EntryDtoImplFieldMap['comments']!: commentsFieldValue,
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
    Object? tags = _sentinel,
    FieldValue? tagsFieldValue,
    Object? comments = _sentinel,
    FieldValue? commentsFieldValue,
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
      tags == _sentinel || tagsFieldValue == null,
      "Cannot specify both tags and tagsFieldValue",
    );
    assert(
      comments == _sentinel || commentsFieldValue == null,
      "Cannot specify both comments and commentsFieldValue",
    );
    final json = {
      if (title != _sentinel)
        _$$EntryDtoImplFieldMap['title']!:
            _$$EntryDtoImplPerFieldToJson.title(title as String),
      if (titleFieldValue != null)
        _$$EntryDtoImplFieldMap['title']!: titleFieldValue,
      if (subtitle != _sentinel)
        _$$EntryDtoImplFieldMap['subtitle']!:
            _$$EntryDtoImplPerFieldToJson.subtitle(subtitle as String),
      if (subtitleFieldValue != null)
        _$$EntryDtoImplFieldMap['subtitle']!: subtitleFieldValue,
      if (content != _sentinel)
        _$$EntryDtoImplFieldMap['content']!:
            _$$EntryDtoImplPerFieldToJson.content(content as String),
      if (contentFieldValue != null)
        _$$EntryDtoImplFieldMap['content']!: contentFieldValue,
      if (createdAt != _sentinel)
        _$$EntryDtoImplFieldMap['createdAt']!:
            _$$EntryDtoImplPerFieldToJson.createdAt(createdAt as DateTime),
      if (createdAtFieldValue != null)
        _$$EntryDtoImplFieldMap['createdAt']!: createdAtFieldValue,
      if (tags != _sentinel)
        _$$EntryDtoImplFieldMap['tags']!:
            _$$EntryDtoImplPerFieldToJson.tags(tags as List<String>),
      if (tagsFieldValue != null)
        _$$EntryDtoImplFieldMap['tags']!: tagsFieldValue,
      if (comments != _sentinel)
        _$$EntryDtoImplFieldMap['comments']!: _$$EntryDtoImplPerFieldToJson
            .comments(comments as List<InvalidType>),
      if (commentsFieldValue != null)
        _$$EntryDtoImplFieldMap['comments']!: commentsFieldValue,
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

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  EntryDtoQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

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

  EntryDtoQuery whereTags({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    String? arrayContains,
    List<String>? arrayContainsAny,
    bool? isNull,
  });

  EntryDtoQuery whereComments({
    List<InvalidType>? isEqualTo,
    List<InvalidType>? isNotEqualTo,
    List<InvalidType>? isLessThan,
    List<InvalidType>? isLessThanOrEqualTo,
    List<InvalidType>? isGreaterThan,
    List<InvalidType>? isGreaterThanOrEqualTo,
    InvalidType arrayContains,
    List<InvalidType>? arrayContainsAny,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  EntryDtoQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  });

  EntryDtoQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  });

  EntryDtoQuery orderByTitle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  });

  EntryDtoQuery orderBySubtitle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  });

  EntryDtoQuery orderByContent({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  });

  EntryDtoQuery orderByCreatedAt({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  });

  EntryDtoQuery orderByTags({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    EntryDtoDocumentSnapshot? startAtDocument,
    EntryDtoDocumentSnapshot? endAtDocument,
    EntryDtoDocumentSnapshot? endBeforeDocument,
    EntryDtoDocumentSnapshot? startAfterDocument,
  });

  EntryDtoQuery orderByComments({
    bool descending = false,
    List<InvalidType> startAt,
    List<InvalidType> startAfter,
    List<InvalidType> endAt,
    List<InvalidType> endBefore,
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
  EntryDtoQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$EntryDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
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
        _$$EntryDtoImplFieldMap['title']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$EntryDtoImplPerFieldToJson.title(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$EntryDtoImplPerFieldToJson.title(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$$EntryDtoImplPerFieldToJson.title(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$EntryDtoImplPerFieldToJson.title(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$EntryDtoImplPerFieldToJson.title(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$EntryDtoImplPerFieldToJson
                .title(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$$EntryDtoImplPerFieldToJson.title(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$EntryDtoImplPerFieldToJson.title(e)),
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
        _$$EntryDtoImplFieldMap['subtitle']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$EntryDtoImplPerFieldToJson.subtitle(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$EntryDtoImplPerFieldToJson.subtitle(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$$EntryDtoImplPerFieldToJson.subtitle(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$EntryDtoImplPerFieldToJson
                .subtitle(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$EntryDtoImplPerFieldToJson.subtitle(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$EntryDtoImplPerFieldToJson
                .subtitle(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$$EntryDtoImplPerFieldToJson.subtitle(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$EntryDtoImplPerFieldToJson.subtitle(e)),
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
        _$$EntryDtoImplFieldMap['content']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$EntryDtoImplPerFieldToJson.content(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$EntryDtoImplPerFieldToJson.content(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$$EntryDtoImplPerFieldToJson.content(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$EntryDtoImplPerFieldToJson
                .content(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$EntryDtoImplPerFieldToJson.content(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$EntryDtoImplPerFieldToJson
                .content(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$$EntryDtoImplPerFieldToJson.content(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$EntryDtoImplPerFieldToJson.content(e)),
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
        _$$EntryDtoImplFieldMap['createdAt']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$EntryDtoImplPerFieldToJson.createdAt(isEqualTo as DateTime)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$EntryDtoImplPerFieldToJson.createdAt(isNotEqualTo as DateTime)
            : null,
        isLessThan: isLessThan != null
            ? _$$EntryDtoImplPerFieldToJson.createdAt(isLessThan as DateTime)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$EntryDtoImplPerFieldToJson
                .createdAt(isLessThanOrEqualTo as DateTime)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$EntryDtoImplPerFieldToJson.createdAt(isGreaterThan as DateTime)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$EntryDtoImplPerFieldToJson
                .createdAt(isGreaterThanOrEqualTo as DateTime)
            : null,
        whereIn:
            whereIn?.map((e) => _$$EntryDtoImplPerFieldToJson.createdAt(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$EntryDtoImplPerFieldToJson.createdAt(e)),
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
        _$$EntryDtoImplFieldMap['tags']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$EntryDtoImplPerFieldToJson.tags(isEqualTo as List<String>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$EntryDtoImplPerFieldToJson.tags(isNotEqualTo as List<String>)
            : null,
        isLessThan: isLessThan != null
            ? _$$EntryDtoImplPerFieldToJson.tags(isLessThan as List<String>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$EntryDtoImplPerFieldToJson
                .tags(isLessThanOrEqualTo as List<String>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$EntryDtoImplPerFieldToJson.tags(isGreaterThan as List<String>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$EntryDtoImplPerFieldToJson
                .tags(isGreaterThanOrEqualTo as List<String>)
            : null,
        arrayContains: arrayContains != null
            ? (_$$EntryDtoImplPerFieldToJson.tags([arrayContains as String])
                    as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$$EntryDtoImplPerFieldToJson.tags(arrayContainsAny)
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
  EntryDtoQuery whereComments({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<InvalidType>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$EntryDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$EntryDtoImplFieldMap['comments']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$EntryDtoImplPerFieldToJson
                .comments(isEqualTo as List<InvalidType>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$EntryDtoImplPerFieldToJson
                .comments(isNotEqualTo as List<InvalidType>)
            : null,
        isLessThan: isLessThan != null
            ? _$$EntryDtoImplPerFieldToJson
                .comments(isLessThan as List<InvalidType>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$EntryDtoImplPerFieldToJson
                .comments(isLessThanOrEqualTo as List<InvalidType>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$EntryDtoImplPerFieldToJson
                .comments(isGreaterThan as List<InvalidType>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$EntryDtoImplPerFieldToJson
                .comments(isGreaterThanOrEqualTo as List<InvalidType>)
            : null,
        arrayContains: arrayContains != null
            ? (_$$EntryDtoImplPerFieldToJson
                    .comments([arrayContains as InvalidType]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$$EntryDtoImplPerFieldToJson.comments(arrayContainsAny)
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
  EntryDtoQuery orderByFieldPath(
    Object fieldPath, {
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
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
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
    final query = $referenceWithoutCursor
        .orderBy(_$$EntryDtoImplFieldMap['title']!, descending: descending);
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
    final query = $referenceWithoutCursor
        .orderBy(_$$EntryDtoImplFieldMap['subtitle']!, descending: descending);
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
    final query = $referenceWithoutCursor
        .orderBy(_$$EntryDtoImplFieldMap['content']!, descending: descending);
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
    final query = $referenceWithoutCursor
        .orderBy(_$$EntryDtoImplFieldMap['createdAt']!, descending: descending);
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
    final query = $referenceWithoutCursor
        .orderBy(_$$EntryDtoImplFieldMap['tags']!, descending: descending);
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
    final query = $referenceWithoutCursor
        .orderBy(_$$EntryDtoImplFieldMap['comments']!, descending: descending);
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntryDtoImpl _$$EntryDtoImplFromJson(Map<String, dynamic> json) =>
    _$EntryDtoImpl(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      content: json['content'] as String,
      createdAt: const FirestoreDateTimeConverter()
          .fromJson(json['createdAt'] as Timestamp),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => const CommentDtoReferenceConverter()
              .fromJson(e as Map<String, dynamic>))
          .toList(),
    );

const _$$EntryDtoImplFieldMap = <String, String>{
  'title': 'title',
  'subtitle': 'subtitle',
  'content': 'content',
  'createdAt': 'createdAt',
  'tags': 'tags',
  'comments': 'comments',
};

// ignore: unused_element
abstract class _$$EntryDtoImplPerFieldToJson {
  // ignore: unused_element
  static Object? title(String instance) => instance;
  // ignore: unused_element
  static Object? subtitle(String instance) => instance;
  // ignore: unused_element
  static Object? content(String instance) => instance;
  // ignore: unused_element
  static Object? createdAt(DateTime instance) =>
      const FirestoreDateTimeConverter().toJson(instance);
  // ignore: unused_element
  static Object? tags(List<String> instance) => instance;
  // ignore: unused_element
  static Object? comments(List<InvalidType> instance) =>
      instance.map(const CommentDtoReferenceConverter().toJson).toList();
}

Map<String, dynamic> _$$EntryDtoImplToJson(_$EntryDtoImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'content': instance.content,
      'createdAt':
          const FirestoreDateTimeConverter().toJson(instance.createdAt),
      'tags': instance.tags,
      'comments': instance.comments
          .map(const CommentDtoReferenceConverter().toJson)
          .toList(),
    };
