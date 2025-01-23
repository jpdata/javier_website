// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_entity.dart';

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
abstract class CommentEntityCollectionReference
    implements
        CommentEntityQuery,
        FirestoreCollectionReference<CommentEntity,
            CommentEntityQuerySnapshot> {
  factory CommentEntityCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$CommentEntityCollectionReference;

  static CommentEntity fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$CommentEntityFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    CommentEntity value,
    SetOptions? options,
  ) {
    return {..._$CommentEntityToJson(value)}..remove('id');
  }

  @override
  CollectionReference<CommentEntity> get reference;

  @override
  CommentEntityDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<CommentEntityDocumentReference> add(CommentEntity value);
}

class _$CommentEntityCollectionReference extends _$CommentEntityQuery
    implements CommentEntityCollectionReference {
  factory _$CommentEntityCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$CommentEntityCollectionReference._(
      firestore.collection('comments').withConverter(
            fromFirestore: CommentEntityCollectionReference.fromFirestore,
            toFirestore: CommentEntityCollectionReference.toFirestore,
          ),
    );
  }

  _$CommentEntityCollectionReference._(
    CollectionReference<CommentEntity> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<CommentEntity> get reference =>
      super.reference as CollectionReference<CommentEntity>;

  @override
  CommentEntityDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return CommentEntityDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<CommentEntityDocumentReference> add(CommentEntity value) {
    return reference
        .add(value)
        .then((ref) => CommentEntityDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$CommentEntityCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class CommentEntityDocumentReference
    extends FirestoreDocumentReference<CommentEntity,
        CommentEntityDocumentSnapshot> {
  factory CommentEntityDocumentReference(
          DocumentReference<CommentEntity> reference) =
      _$CommentEntityDocumentReference;

  DocumentReference<CommentEntity> get reference;

  /// A reference to the [CommentEntityCollectionReference] containing this document.
  CommentEntityCollectionReference get parent {
    return _$CommentEntityCollectionReference(reference.firestore);
  }

  @override
  Stream<CommentEntityDocumentSnapshot> snapshots();

  @override
  Future<CommentEntityDocumentSnapshot> get([GetOptions? options]);

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
    CommentEntity model, {
    SetOptions? options,
    FieldValue entryFieldValue,
    FieldValue contentFieldValue,
    FieldValue createdAtFieldValue,
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
    CommentEntity model, {
    SetOptions? options,
    FieldValue entryFieldValue,
    FieldValue contentFieldValue,
    FieldValue createdAtFieldValue,
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
    CommentEntity model, {
    SetOptions? options,
    FieldValue entryFieldValue,
    FieldValue contentFieldValue,
    FieldValue createdAtFieldValue,
  });

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    InvalidType entry,
    FieldValue entryFieldValue,
    String content,
    FieldValue contentFieldValue,
    DateTime createdAt,
    FieldValue createdAtFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    InvalidType entry,
    FieldValue entryFieldValue,
    String content,
    FieldValue contentFieldValue,
    DateTime createdAt,
    FieldValue createdAtFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    InvalidType entry,
    FieldValue entryFieldValue,
    String content,
    FieldValue contentFieldValue,
    DateTime createdAt,
    FieldValue createdAtFieldValue,
  });
}

class _$CommentEntityDocumentReference extends FirestoreDocumentReference<
    CommentEntity,
    CommentEntityDocumentSnapshot> implements CommentEntityDocumentReference {
  _$CommentEntityDocumentReference(this.reference);

  @override
  final DocumentReference<CommentEntity> reference;

  /// A reference to the [CommentEntityCollectionReference] containing this document.
  CommentEntityCollectionReference get parent {
    return _$CommentEntityCollectionReference(reference.firestore);
  }

  @override
  Stream<CommentEntityDocumentSnapshot> snapshots() {
    return reference.snapshots().map(CommentEntityDocumentSnapshot._);
  }

  @override
  Future<CommentEntityDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(CommentEntityDocumentSnapshot._);
  }

  @override
  Future<CommentEntityDocumentSnapshot> transactionGet(
      Transaction transaction) {
    return transaction.get(reference).then(CommentEntityDocumentSnapshot._);
  }

  Future<void> set(
    CommentEntity model, {
    SetOptions? options,
    FieldValue? entryFieldValue,
    FieldValue? contentFieldValue,
    FieldValue? createdAtFieldValue,
  }) async {
    final json = {
      ..._$CommentEntityToJson(model),
      if (entryFieldValue != null)
        _$CommentEntityFieldMap['entry']!: entryFieldValue,
      if (contentFieldValue != null)
        _$CommentEntityFieldMap['content']!: contentFieldValue,
      if (createdAtFieldValue != null)
        _$CommentEntityFieldMap['createdAt']!: createdAtFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => throw UnimplementedError(),
      toFirestore: (value, options) => value,
    );
    return castedReference.set(json, options);
  }

  void transactionSet(
    Transaction transaction,
    CommentEntity model, {
    SetOptions? options,
    FieldValue? entryFieldValue,
    FieldValue? contentFieldValue,
    FieldValue? createdAtFieldValue,
  }) {
    final json = {
      ..._$CommentEntityToJson(model),
      if (entryFieldValue != null)
        _$CommentEntityFieldMap['entry']!: entryFieldValue,
      if (contentFieldValue != null)
        _$CommentEntityFieldMap['content']!: contentFieldValue,
      if (createdAtFieldValue != null)
        _$CommentEntityFieldMap['createdAt']!: createdAtFieldValue,
    };

    transaction.set(reference, json, options);
  }

  void batchSet(
    WriteBatch batch,
    CommentEntity model, {
    SetOptions? options,
    FieldValue? entryFieldValue,
    FieldValue? contentFieldValue,
    FieldValue? createdAtFieldValue,
  }) {
    final json = {
      ..._$CommentEntityToJson(model),
      if (entryFieldValue != null)
        _$CommentEntityFieldMap['entry']!: entryFieldValue,
      if (contentFieldValue != null)
        _$CommentEntityFieldMap['content']!: contentFieldValue,
      if (createdAtFieldValue != null)
        _$CommentEntityFieldMap['createdAt']!: createdAtFieldValue,
    };

    batch.set(reference, json, options);
  }

  Future<void> update({
    Object? entry = _sentinel,
    FieldValue? entryFieldValue,
    Object? content = _sentinel,
    FieldValue? contentFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
  }) async {
    assert(
      entry == _sentinel || entryFieldValue == null,
      "Cannot specify both entry and entryFieldValue",
    );
    assert(
      content == _sentinel || contentFieldValue == null,
      "Cannot specify both content and contentFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    final json = {
      if (entry != _sentinel)
        _$CommentEntityFieldMap['entry']!:
            _$CommentEntityPerFieldToJson.entry(entry as InvalidType),
      if (entryFieldValue != null)
        _$CommentEntityFieldMap['entry']!: entryFieldValue,
      if (content != _sentinel)
        _$CommentEntityFieldMap['content']!:
            _$CommentEntityPerFieldToJson.content(content as String),
      if (contentFieldValue != null)
        _$CommentEntityFieldMap['content']!: contentFieldValue,
      if (createdAt != _sentinel)
        _$CommentEntityFieldMap['createdAt']!:
            _$CommentEntityPerFieldToJson.createdAt(createdAt as DateTime),
      if (createdAtFieldValue != null)
        _$CommentEntityFieldMap['createdAt']!: createdAtFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? entry = _sentinel,
    FieldValue? entryFieldValue,
    Object? content = _sentinel,
    FieldValue? contentFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
  }) {
    assert(
      entry == _sentinel || entryFieldValue == null,
      "Cannot specify both entry and entryFieldValue",
    );
    assert(
      content == _sentinel || contentFieldValue == null,
      "Cannot specify both content and contentFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    final json = {
      if (entry != _sentinel)
        _$CommentEntityFieldMap['entry']!:
            _$CommentEntityPerFieldToJson.entry(entry as InvalidType),
      if (entryFieldValue != null)
        _$CommentEntityFieldMap['entry']!: entryFieldValue,
      if (content != _sentinel)
        _$CommentEntityFieldMap['content']!:
            _$CommentEntityPerFieldToJson.content(content as String),
      if (contentFieldValue != null)
        _$CommentEntityFieldMap['content']!: contentFieldValue,
      if (createdAt != _sentinel)
        _$CommentEntityFieldMap['createdAt']!:
            _$CommentEntityPerFieldToJson.createdAt(createdAt as DateTime),
      if (createdAtFieldValue != null)
        _$CommentEntityFieldMap['createdAt']!: createdAtFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? entry = _sentinel,
    FieldValue? entryFieldValue,
    Object? content = _sentinel,
    FieldValue? contentFieldValue,
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
  }) {
    assert(
      entry == _sentinel || entryFieldValue == null,
      "Cannot specify both entry and entryFieldValue",
    );
    assert(
      content == _sentinel || contentFieldValue == null,
      "Cannot specify both content and contentFieldValue",
    );
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    final json = {
      if (entry != _sentinel)
        _$CommentEntityFieldMap['entry']!:
            _$CommentEntityPerFieldToJson.entry(entry as InvalidType),
      if (entryFieldValue != null)
        _$CommentEntityFieldMap['entry']!: entryFieldValue,
      if (content != _sentinel)
        _$CommentEntityFieldMap['content']!:
            _$CommentEntityPerFieldToJson.content(content as String),
      if (contentFieldValue != null)
        _$CommentEntityFieldMap['content']!: contentFieldValue,
      if (createdAt != _sentinel)
        _$CommentEntityFieldMap['createdAt']!:
            _$CommentEntityPerFieldToJson.createdAt(createdAt as DateTime),
      if (createdAtFieldValue != null)
        _$CommentEntityFieldMap['createdAt']!: createdAtFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is CommentEntityDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class CommentEntityQuery
    implements QueryReference<CommentEntity, CommentEntityQuerySnapshot> {
  @override
  CommentEntityQuery limit(int limit);

  @override
  CommentEntityQuery limitToLast(int limit);

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
  CommentEntityQuery whereFieldPath(
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

  CommentEntityQuery whereDocumentId({
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

  CommentEntityQuery whereEntry({
    InvalidType? isEqualTo,
    InvalidType? isNotEqualTo,
    InvalidType? isLessThan,
    InvalidType? isLessThanOrEqualTo,
    InvalidType? isGreaterThan,
    InvalidType? isGreaterThanOrEqualTo,
    List<InvalidType>? whereIn,
    List<InvalidType>? whereNotIn,
    bool? isNull,
  });

  CommentEntityQuery whereContent({
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

  CommentEntityQuery whereCreatedAt({
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
  CommentEntityQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    CommentEntityDocumentSnapshot? startAtDocument,
    CommentEntityDocumentSnapshot? endAtDocument,
    CommentEntityDocumentSnapshot? endBeforeDocument,
    CommentEntityDocumentSnapshot? startAfterDocument,
  });

  CommentEntityQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CommentEntityDocumentSnapshot? startAtDocument,
    CommentEntityDocumentSnapshot? endAtDocument,
    CommentEntityDocumentSnapshot? endBeforeDocument,
    CommentEntityDocumentSnapshot? startAfterDocument,
  });

  CommentEntityQuery orderByEntry({
    bool descending = false,
    InvalidType startAt,
    InvalidType startAfter,
    InvalidType endAt,
    InvalidType endBefore,
    CommentEntityDocumentSnapshot? startAtDocument,
    CommentEntityDocumentSnapshot? endAtDocument,
    CommentEntityDocumentSnapshot? endBeforeDocument,
    CommentEntityDocumentSnapshot? startAfterDocument,
  });

  CommentEntityQuery orderByContent({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    CommentEntityDocumentSnapshot? startAtDocument,
    CommentEntityDocumentSnapshot? endAtDocument,
    CommentEntityDocumentSnapshot? endBeforeDocument,
    CommentEntityDocumentSnapshot? startAfterDocument,
  });

  CommentEntityQuery orderByCreatedAt({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    CommentEntityDocumentSnapshot? startAtDocument,
    CommentEntityDocumentSnapshot? endAtDocument,
    CommentEntityDocumentSnapshot? endBeforeDocument,
    CommentEntityDocumentSnapshot? startAfterDocument,
  });
}

class _$CommentEntityQuery
    extends QueryReference<CommentEntity, CommentEntityQuerySnapshot>
    implements CommentEntityQuery {
  _$CommentEntityQuery(
    this._collection, {
    required Query<CommentEntity> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<CommentEntityQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(CommentEntityQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<CommentEntityQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(CommentEntityQuerySnapshot._fromQuerySnapshot);
  }

  @override
  CommentEntityQuery limit(int limit) {
    return _$CommentEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CommentEntityQuery limitToLast(int limit) {
    return _$CommentEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CommentEntityQuery whereFieldPath(
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
    return _$CommentEntityQuery(
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
  CommentEntityQuery whereDocumentId({
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
    return _$CommentEntityQuery(
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
  CommentEntityQuery whereEntry({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<InvalidType>? whereIn,
    List<InvalidType>? whereNotIn,
    bool? isNull,
  }) {
    return _$CommentEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CommentEntityFieldMap['entry']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$CommentEntityPerFieldToJson.entry(isEqualTo as InvalidType)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$CommentEntityPerFieldToJson.entry(isNotEqualTo as InvalidType)
            : null,
        isLessThan: isLessThan != null
            ? _$CommentEntityPerFieldToJson.entry(isLessThan as InvalidType)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$CommentEntityPerFieldToJson
                .entry(isLessThanOrEqualTo as InvalidType)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$CommentEntityPerFieldToJson.entry(isGreaterThan as InvalidType)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$CommentEntityPerFieldToJson
                .entry(isGreaterThanOrEqualTo as InvalidType)
            : null,
        whereIn: whereIn?.map((e) => _$CommentEntityPerFieldToJson.entry(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$CommentEntityPerFieldToJson.entry(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CommentEntityQuery whereContent({
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
    return _$CommentEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CommentEntityFieldMap['content']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$CommentEntityPerFieldToJson.content(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$CommentEntityPerFieldToJson.content(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$CommentEntityPerFieldToJson.content(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$CommentEntityPerFieldToJson
                .content(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$CommentEntityPerFieldToJson.content(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$CommentEntityPerFieldToJson
                .content(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$CommentEntityPerFieldToJson.content(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$CommentEntityPerFieldToJson.content(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CommentEntityQuery whereCreatedAt({
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
    return _$CommentEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$CommentEntityFieldMap['createdAt']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$CommentEntityPerFieldToJson.createdAt(isEqualTo as DateTime)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$CommentEntityPerFieldToJson.createdAt(isNotEqualTo as DateTime)
            : null,
        isLessThan: isLessThan != null
            ? _$CommentEntityPerFieldToJson.createdAt(isLessThan as DateTime)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$CommentEntityPerFieldToJson
                .createdAt(isLessThanOrEqualTo as DateTime)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$CommentEntityPerFieldToJson.createdAt(isGreaterThan as DateTime)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$CommentEntityPerFieldToJson
                .createdAt(isGreaterThanOrEqualTo as DateTime)
            : null,
        whereIn:
            whereIn?.map((e) => _$CommentEntityPerFieldToJson.createdAt(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$CommentEntityPerFieldToJson.createdAt(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  CommentEntityQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CommentEntityDocumentSnapshot? startAtDocument,
    CommentEntityDocumentSnapshot? endAtDocument,
    CommentEntityDocumentSnapshot? endBeforeDocument,
    CommentEntityDocumentSnapshot? startAfterDocument,
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

    return _$CommentEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  CommentEntityQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CommentEntityDocumentSnapshot? startAtDocument,
    CommentEntityDocumentSnapshot? endAtDocument,
    CommentEntityDocumentSnapshot? endBeforeDocument,
    CommentEntityDocumentSnapshot? startAfterDocument,
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

    return _$CommentEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  CommentEntityQuery orderByEntry({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CommentEntityDocumentSnapshot? startAtDocument,
    CommentEntityDocumentSnapshot? endAtDocument,
    CommentEntityDocumentSnapshot? endBeforeDocument,
    CommentEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$CommentEntityFieldMap['entry']!, descending: descending);
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

    return _$CommentEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  CommentEntityQuery orderByContent({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CommentEntityDocumentSnapshot? startAtDocument,
    CommentEntityDocumentSnapshot? endAtDocument,
    CommentEntityDocumentSnapshot? endBeforeDocument,
    CommentEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$CommentEntityFieldMap['content']!, descending: descending);
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

    return _$CommentEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  CommentEntityQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    CommentEntityDocumentSnapshot? startAtDocument,
    CommentEntityDocumentSnapshot? endAtDocument,
    CommentEntityDocumentSnapshot? endBeforeDocument,
    CommentEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$CommentEntityFieldMap['createdAt']!, descending: descending);
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

    return _$CommentEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$CommentEntityQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class CommentEntityDocumentSnapshot
    extends FirestoreDocumentSnapshot<CommentEntity> {
  CommentEntityDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<CommentEntity> snapshot;

  @override
  CommentEntityDocumentReference get reference {
    return CommentEntityDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final CommentEntity? data;
}

class CommentEntityQuerySnapshot extends FirestoreQuerySnapshot<CommentEntity,
    CommentEntityQueryDocumentSnapshot> {
  CommentEntityQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory CommentEntityQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<CommentEntity> snapshot,
  ) {
    final docs =
        snapshot.docs.map(CommentEntityQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        CommentEntityDocumentSnapshot._,
      );
    }).toList();

    return CommentEntityQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<CommentEntityDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    CommentEntityDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<CommentEntityDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<CommentEntity> snapshot;

  @override
  final List<CommentEntityQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<CommentEntityDocumentSnapshot>> docChanges;
}

class CommentEntityQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<CommentEntity>
    implements CommentEntityDocumentSnapshot {
  CommentEntityQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<CommentEntity> snapshot;

  @override
  final CommentEntity data;

  @override
  CommentEntityDocumentReference get reference {
    return CommentEntityDocumentReference(snapshot.reference);
  }
}
