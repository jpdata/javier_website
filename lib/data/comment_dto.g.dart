// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_dto.dart';

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
abstract class CommentDtoCollectionReference
    implements
        CommentDtoQuery,
        FirestoreCollectionReference<CommentDto, CommentDtoQuerySnapshot> {
  factory CommentDtoCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$CommentDtoCollectionReference;

  static CommentDto fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return CommentDto.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    CommentDto value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<CommentDto> get reference;

  @override
  CommentDtoDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<CommentDtoDocumentReference> add(CommentDto value);
}

class _$CommentDtoCollectionReference extends _$CommentDtoQuery
    implements CommentDtoCollectionReference {
  factory _$CommentDtoCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$CommentDtoCollectionReference._(
      firestore.collection('comments').withConverter(
            fromFirestore: CommentDtoCollectionReference.fromFirestore,
            toFirestore: CommentDtoCollectionReference.toFirestore,
          ),
    );
  }

  _$CommentDtoCollectionReference._(
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
    return other is _$CommentDtoCollectionReference &&
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

  /// A reference to the [CommentDtoCollectionReference] containing this document.
  CommentDtoCollectionReference get parent {
    return _$CommentDtoCollectionReference(reference.firestore);
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
    String content,
    FieldValue contentFieldValue,
    DateTime createdAt,
    FieldValue createdAtFieldValue,
    String authorName,
    FieldValue authorNameFieldValue,
    String authorEmail,
    FieldValue authorEmailFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String content,
    FieldValue contentFieldValue,
    DateTime createdAt,
    FieldValue createdAtFieldValue,
    String authorName,
    FieldValue authorNameFieldValue,
    String authorEmail,
    FieldValue authorEmailFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    String content,
    FieldValue contentFieldValue,
    DateTime createdAt,
    FieldValue createdAtFieldValue,
    String authorName,
    FieldValue authorNameFieldValue,
    String authorEmail,
    FieldValue authorEmailFieldValue,
  });
}

class _$CommentDtoDocumentReference
    extends FirestoreDocumentReference<CommentDto, CommentDtoDocumentSnapshot>
    implements CommentDtoDocumentReference {
  _$CommentDtoDocumentReference(this.reference);

  @override
  final DocumentReference<CommentDto> reference;

  /// A reference to the [CommentDtoCollectionReference] containing this document.
  CommentDtoCollectionReference get parent {
    return _$CommentDtoCollectionReference(reference.firestore);
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
      ...model.toJson(),
      if (contentFieldValue != null)
        _$$CommentDtoImplFieldMap['content']!: contentFieldValue,
      if (createdAtFieldValue != null)
        _$$CommentDtoImplFieldMap['createdAt']!: createdAtFieldValue,
      if (authorNameFieldValue != null)
        _$$CommentDtoImplFieldMap['authorName']!: authorNameFieldValue,
      if (authorEmailFieldValue != null)
        _$$CommentDtoImplFieldMap['authorEmail']!: authorEmailFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => throw UnimplementedError(),
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
      ...model.toJson(),
      if (contentFieldValue != null)
        _$$CommentDtoImplFieldMap['content']!: contentFieldValue,
      if (createdAtFieldValue != null)
        _$$CommentDtoImplFieldMap['createdAt']!: createdAtFieldValue,
      if (authorNameFieldValue != null)
        _$$CommentDtoImplFieldMap['authorName']!: authorNameFieldValue,
      if (authorEmailFieldValue != null)
        _$$CommentDtoImplFieldMap['authorEmail']!: authorEmailFieldValue,
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
      ...model.toJson(),
      if (contentFieldValue != null)
        _$$CommentDtoImplFieldMap['content']!: contentFieldValue,
      if (createdAtFieldValue != null)
        _$$CommentDtoImplFieldMap['createdAt']!: createdAtFieldValue,
      if (authorNameFieldValue != null)
        _$$CommentDtoImplFieldMap['authorName']!: authorNameFieldValue,
      if (authorEmailFieldValue != null)
        _$$CommentDtoImplFieldMap['authorEmail']!: authorEmailFieldValue,
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
      if (content != _sentinel)
        _$$CommentDtoImplFieldMap['content']!:
            _$$CommentDtoImplPerFieldToJson.content(content as String),
      if (contentFieldValue != null)
        _$$CommentDtoImplFieldMap['content']!: contentFieldValue,
      if (createdAt != _sentinel)
        _$$CommentDtoImplFieldMap['createdAt']!:
            _$$CommentDtoImplPerFieldToJson.createdAt(createdAt as DateTime),
      if (createdAtFieldValue != null)
        _$$CommentDtoImplFieldMap['createdAt']!: createdAtFieldValue,
      if (authorName != _sentinel)
        _$$CommentDtoImplFieldMap['authorName']!:
            _$$CommentDtoImplPerFieldToJson.authorName(authorName as String),
      if (authorNameFieldValue != null)
        _$$CommentDtoImplFieldMap['authorName']!: authorNameFieldValue,
      if (authorEmail != _sentinel)
        _$$CommentDtoImplFieldMap['authorEmail']!:
            _$$CommentDtoImplPerFieldToJson.authorEmail(authorEmail as String),
      if (authorEmailFieldValue != null)
        _$$CommentDtoImplFieldMap['authorEmail']!: authorEmailFieldValue,
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
      if (content != _sentinel)
        _$$CommentDtoImplFieldMap['content']!:
            _$$CommentDtoImplPerFieldToJson.content(content as String),
      if (contentFieldValue != null)
        _$$CommentDtoImplFieldMap['content']!: contentFieldValue,
      if (createdAt != _sentinel)
        _$$CommentDtoImplFieldMap['createdAt']!:
            _$$CommentDtoImplPerFieldToJson.createdAt(createdAt as DateTime),
      if (createdAtFieldValue != null)
        _$$CommentDtoImplFieldMap['createdAt']!: createdAtFieldValue,
      if (authorName != _sentinel)
        _$$CommentDtoImplFieldMap['authorName']!:
            _$$CommentDtoImplPerFieldToJson.authorName(authorName as String),
      if (authorNameFieldValue != null)
        _$$CommentDtoImplFieldMap['authorName']!: authorNameFieldValue,
      if (authorEmail != _sentinel)
        _$$CommentDtoImplFieldMap['authorEmail']!:
            _$$CommentDtoImplPerFieldToJson.authorEmail(authorEmail as String),
      if (authorEmailFieldValue != null)
        _$$CommentDtoImplFieldMap['authorEmail']!: authorEmailFieldValue,
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
      if (content != _sentinel)
        _$$CommentDtoImplFieldMap['content']!:
            _$$CommentDtoImplPerFieldToJson.content(content as String),
      if (contentFieldValue != null)
        _$$CommentDtoImplFieldMap['content']!: contentFieldValue,
      if (createdAt != _sentinel)
        _$$CommentDtoImplFieldMap['createdAt']!:
            _$$CommentDtoImplPerFieldToJson.createdAt(createdAt as DateTime),
      if (createdAtFieldValue != null)
        _$$CommentDtoImplFieldMap['createdAt']!: createdAtFieldValue,
      if (authorName != _sentinel)
        _$$CommentDtoImplFieldMap['authorName']!:
            _$$CommentDtoImplPerFieldToJson.authorName(authorName as String),
      if (authorNameFieldValue != null)
        _$$CommentDtoImplFieldMap['authorName']!: authorNameFieldValue,
      if (authorEmail != _sentinel)
        _$$CommentDtoImplFieldMap['authorEmail']!:
            _$$CommentDtoImplPerFieldToJson.authorEmail(authorEmail as String),
      if (authorEmailFieldValue != null)
        _$$CommentDtoImplFieldMap['authorEmail']!: authorEmailFieldValue,
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
  CommentDtoQuery whereFieldPath(
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
  CommentDtoQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    CommentDtoDocumentSnapshot? startAtDocument,
    CommentDtoDocumentSnapshot? endAtDocument,
    CommentDtoDocumentSnapshot? endBeforeDocument,
    CommentDtoDocumentSnapshot? startAfterDocument,
  });

  CommentDtoQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CommentDtoDocumentSnapshot? startAtDocument,
    CommentDtoDocumentSnapshot? endAtDocument,
    CommentDtoDocumentSnapshot? endBeforeDocument,
    CommentDtoDocumentSnapshot? startAfterDocument,
  });

  CommentDtoQuery orderByContent({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CommentDtoDocumentSnapshot? startAtDocument,
    CommentDtoDocumentSnapshot? endAtDocument,
    CommentDtoDocumentSnapshot? endBeforeDocument,
    CommentDtoDocumentSnapshot? startAfterDocument,
  });

  CommentDtoQuery orderByCreatedAt({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    CommentDtoDocumentSnapshot? startAtDocument,
    CommentDtoDocumentSnapshot? endAtDocument,
    CommentDtoDocumentSnapshot? endBeforeDocument,
    CommentDtoDocumentSnapshot? startAfterDocument,
  });

  CommentDtoQuery orderByAuthorName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CommentDtoDocumentSnapshot? startAtDocument,
    CommentDtoDocumentSnapshot? endAtDocument,
    CommentDtoDocumentSnapshot? endBeforeDocument,
    CommentDtoDocumentSnapshot? startAfterDocument,
  });

  CommentDtoQuery orderByAuthorEmail({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
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
  CommentDtoQuery whereFieldPath(
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
    return _$CommentDtoQuery(
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
        _$$CommentDtoImplFieldMap['content']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$CommentDtoImplPerFieldToJson.content(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$CommentDtoImplPerFieldToJson.content(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$$CommentDtoImplPerFieldToJson.content(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$CommentDtoImplPerFieldToJson
                .content(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$CommentDtoImplPerFieldToJson.content(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$CommentDtoImplPerFieldToJson
                .content(isGreaterThanOrEqualTo as String)
            : null,
        whereIn:
            whereIn?.map((e) => _$$CommentDtoImplPerFieldToJson.content(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$$CommentDtoImplPerFieldToJson.content(e)),
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
        _$$CommentDtoImplFieldMap['createdAt']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$CommentDtoImplPerFieldToJson.createdAt(isEqualTo as DateTime)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$CommentDtoImplPerFieldToJson
                .createdAt(isNotEqualTo as DateTime)
            : null,
        isLessThan: isLessThan != null
            ? _$$CommentDtoImplPerFieldToJson.createdAt(isLessThan as DateTime)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$CommentDtoImplPerFieldToJson
                .createdAt(isLessThanOrEqualTo as DateTime)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$CommentDtoImplPerFieldToJson
                .createdAt(isGreaterThan as DateTime)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$CommentDtoImplPerFieldToJson
                .createdAt(isGreaterThanOrEqualTo as DateTime)
            : null,
        whereIn:
            whereIn?.map((e) => _$$CommentDtoImplPerFieldToJson.createdAt(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$$CommentDtoImplPerFieldToJson.createdAt(e)),
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
        _$$CommentDtoImplFieldMap['authorName']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$CommentDtoImplPerFieldToJson.authorName(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$CommentDtoImplPerFieldToJson.authorName(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$$CommentDtoImplPerFieldToJson.authorName(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$CommentDtoImplPerFieldToJson
                .authorName(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$CommentDtoImplPerFieldToJson
                .authorName(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$CommentDtoImplPerFieldToJson
                .authorName(isGreaterThanOrEqualTo as String)
            : null,
        whereIn:
            whereIn?.map((e) => _$$CommentDtoImplPerFieldToJson.authorName(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$$CommentDtoImplPerFieldToJson.authorName(e)),
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
        _$$CommentDtoImplFieldMap['authorEmail']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$$CommentDtoImplPerFieldToJson.authorEmail(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$$CommentDtoImplPerFieldToJson
                .authorEmail(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$$CommentDtoImplPerFieldToJson.authorEmail(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$$CommentDtoImplPerFieldToJson
                .authorEmail(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$$CommentDtoImplPerFieldToJson
                .authorEmail(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$$CommentDtoImplPerFieldToJson
                .authorEmail(isGreaterThanOrEqualTo as String)
            : null,
        whereIn:
            whereIn?.map((e) => _$$CommentDtoImplPerFieldToJson.authorEmail(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$$CommentDtoImplPerFieldToJson.authorEmail(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CommentDtoQuery orderByFieldPath(
    Object fieldPath, {
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

    return _$CommentDtoQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
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
    final query = $referenceWithoutCursor
        .orderBy(_$$CommentDtoImplFieldMap['content']!, descending: descending);
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
    final query = $referenceWithoutCursor.orderBy(
        _$$CommentDtoImplFieldMap['createdAt']!,
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
    final query = $referenceWithoutCursor.orderBy(
        _$$CommentDtoImplFieldMap['authorName']!,
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
    final query = $referenceWithoutCursor.orderBy(
        _$$CommentDtoImplFieldMap['authorEmail']!,
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentDtoImpl _$$CommentDtoImplFromJson(Map<String, dynamic> json) =>
    _$CommentDtoImpl(
      content: json['content'] as String,
      createdAt: const FirestoreDateTimeConverter()
          .fromJson(json['createdAt'] as Timestamp),
      authorName: json['authorName'] as String,
      authorEmail: json['authorEmail'] as String,
    );

const _$$CommentDtoImplFieldMap = <String, String>{
  'content': 'content',
  'createdAt': 'createdAt',
  'authorName': 'authorName',
  'authorEmail': 'authorEmail',
};

// ignore: unused_element
abstract class _$$CommentDtoImplPerFieldToJson {
  // ignore: unused_element
  static Object? content(String instance) => instance;
  // ignore: unused_element
  static Object? createdAt(DateTime instance) =>
      const FirestoreDateTimeConverter().toJson(instance);
  // ignore: unused_element
  static Object? authorName(String instance) => instance;
  // ignore: unused_element
  static Object? authorEmail(String instance) => instance;
}

Map<String, dynamic> _$$CommentDtoImplToJson(_$CommentDtoImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'createdAt':
          const FirestoreDateTimeConverter().toJson(instance.createdAt),
      'authorName': instance.authorName,
      'authorEmail': instance.authorEmail,
    };
