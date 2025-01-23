// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_entity.dart';

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
abstract class EntryEntityCollectionReference
    implements
        EntryEntityQuery,
        FirestoreCollectionReference<EntryEntity, EntryEntityQuerySnapshot> {
  factory EntryEntityCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$EntryEntityCollectionReference;

  static EntryEntity fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$EntryEntityFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    EntryEntity value,
    SetOptions? options,
  ) {
    return {..._$EntryEntityToJson(value)}..remove('id');
  }

  @override
  CollectionReference<EntryEntity> get reference;

  @override
  EntryEntityDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<EntryEntityDocumentReference> add(EntryEntity value);
}

class _$EntryEntityCollectionReference extends _$EntryEntityQuery
    implements EntryEntityCollectionReference {
  factory _$EntryEntityCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$EntryEntityCollectionReference._(
      firestore.collection('entries').withConverter(
            fromFirestore: EntryEntityCollectionReference.fromFirestore,
            toFirestore: EntryEntityCollectionReference.toFirestore,
          ),
    );
  }

  _$EntryEntityCollectionReference._(
    CollectionReference<EntryEntity> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<EntryEntity> get reference =>
      super.reference as CollectionReference<EntryEntity>;

  @override
  EntryEntityDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return EntryEntityDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<EntryEntityDocumentReference> add(EntryEntity value) {
    return reference
        .add(value)
        .then((ref) => EntryEntityDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$EntryEntityCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class EntryEntityDocumentReference extends FirestoreDocumentReference<
    EntryEntity, EntryEntityDocumentSnapshot> {
  factory EntryEntityDocumentReference(
          DocumentReference<EntryEntity> reference) =
      _$EntryEntityDocumentReference;

  DocumentReference<EntryEntity> get reference;

  /// A reference to the [EntryEntityCollectionReference] containing this document.
  EntryEntityCollectionReference get parent {
    return _$EntryEntityCollectionReference(reference.firestore);
  }

  @override
  Stream<EntryEntityDocumentSnapshot> snapshots();

  @override
  Future<EntryEntityDocumentSnapshot> get([GetOptions? options]);

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
    EntryEntity model, {
    SetOptions? options,
    FieldValue titleFieldValue,
    FieldValue subtitleFieldValue,
    FieldValue contentFieldValue,
    FieldValue createdAtFieldValue,
    FieldValue tagsFieldValue,
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
    EntryEntity model, {
    SetOptions? options,
    FieldValue titleFieldValue,
    FieldValue subtitleFieldValue,
    FieldValue contentFieldValue,
    FieldValue createdAtFieldValue,
    FieldValue tagsFieldValue,
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
    EntryEntity model, {
    SetOptions? options,
    FieldValue titleFieldValue,
    FieldValue subtitleFieldValue,
    FieldValue contentFieldValue,
    FieldValue createdAtFieldValue,
    FieldValue tagsFieldValue,
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
  });
}

class _$EntryEntityDocumentReference
    extends FirestoreDocumentReference<EntryEntity, EntryEntityDocumentSnapshot>
    implements EntryEntityDocumentReference {
  _$EntryEntityDocumentReference(this.reference);

  @override
  final DocumentReference<EntryEntity> reference;

  /// A reference to the [EntryEntityCollectionReference] containing this document.
  EntryEntityCollectionReference get parent {
    return _$EntryEntityCollectionReference(reference.firestore);
  }

  @override
  Stream<EntryEntityDocumentSnapshot> snapshots() {
    return reference.snapshots().map(EntryEntityDocumentSnapshot._);
  }

  @override
  Future<EntryEntityDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(EntryEntityDocumentSnapshot._);
  }

  @override
  Future<EntryEntityDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(EntryEntityDocumentSnapshot._);
  }

  Future<void> set(
    EntryEntity model, {
    SetOptions? options,
    FieldValue? titleFieldValue,
    FieldValue? subtitleFieldValue,
    FieldValue? contentFieldValue,
    FieldValue? createdAtFieldValue,
    FieldValue? tagsFieldValue,
  }) async {
    final json = {
      ..._$EntryEntityToJson(model),
      if (titleFieldValue != null)
        _$EntryEntityFieldMap['title']!: titleFieldValue,
      if (subtitleFieldValue != null)
        _$EntryEntityFieldMap['subtitle']!: subtitleFieldValue,
      if (contentFieldValue != null)
        _$EntryEntityFieldMap['content']!: contentFieldValue,
      if (createdAtFieldValue != null)
        _$EntryEntityFieldMap['createdAt']!: createdAtFieldValue,
      if (tagsFieldValue != null)
        _$EntryEntityFieldMap['tags']!: tagsFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => throw UnimplementedError(),
      toFirestore: (value, options) => value,
    );
    return castedReference.set(json, options);
  }

  void transactionSet(
    Transaction transaction,
    EntryEntity model, {
    SetOptions? options,
    FieldValue? titleFieldValue,
    FieldValue? subtitleFieldValue,
    FieldValue? contentFieldValue,
    FieldValue? createdAtFieldValue,
    FieldValue? tagsFieldValue,
  }) {
    final json = {
      ..._$EntryEntityToJson(model),
      if (titleFieldValue != null)
        _$EntryEntityFieldMap['title']!: titleFieldValue,
      if (subtitleFieldValue != null)
        _$EntryEntityFieldMap['subtitle']!: subtitleFieldValue,
      if (contentFieldValue != null)
        _$EntryEntityFieldMap['content']!: contentFieldValue,
      if (createdAtFieldValue != null)
        _$EntryEntityFieldMap['createdAt']!: createdAtFieldValue,
      if (tagsFieldValue != null)
        _$EntryEntityFieldMap['tags']!: tagsFieldValue,
    };

    transaction.set(reference, json, options);
  }

  void batchSet(
    WriteBatch batch,
    EntryEntity model, {
    SetOptions? options,
    FieldValue? titleFieldValue,
    FieldValue? subtitleFieldValue,
    FieldValue? contentFieldValue,
    FieldValue? createdAtFieldValue,
    FieldValue? tagsFieldValue,
  }) {
    final json = {
      ..._$EntryEntityToJson(model),
      if (titleFieldValue != null)
        _$EntryEntityFieldMap['title']!: titleFieldValue,
      if (subtitleFieldValue != null)
        _$EntryEntityFieldMap['subtitle']!: subtitleFieldValue,
      if (contentFieldValue != null)
        _$EntryEntityFieldMap['content']!: contentFieldValue,
      if (createdAtFieldValue != null)
        _$EntryEntityFieldMap['createdAt']!: createdAtFieldValue,
      if (tagsFieldValue != null)
        _$EntryEntityFieldMap['tags']!: tagsFieldValue,
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
    final json = {
      if (title != _sentinel)
        _$EntryEntityFieldMap['title']!:
            _$EntryEntityPerFieldToJson.title(title as String),
      if (titleFieldValue != null)
        _$EntryEntityFieldMap['title']!: titleFieldValue,
      if (subtitle != _sentinel)
        _$EntryEntityFieldMap['subtitle']!:
            _$EntryEntityPerFieldToJson.subtitle(subtitle as String),
      if (subtitleFieldValue != null)
        _$EntryEntityFieldMap['subtitle']!: subtitleFieldValue,
      if (content != _sentinel)
        _$EntryEntityFieldMap['content']!:
            _$EntryEntityPerFieldToJson.content(content as String),
      if (contentFieldValue != null)
        _$EntryEntityFieldMap['content']!: contentFieldValue,
      if (createdAt != _sentinel)
        _$EntryEntityFieldMap['createdAt']!:
            _$EntryEntityPerFieldToJson.createdAt(createdAt as DateTime),
      if (createdAtFieldValue != null)
        _$EntryEntityFieldMap['createdAt']!: createdAtFieldValue,
      if (tags != _sentinel)
        _$EntryEntityFieldMap['tags']!:
            _$EntryEntityPerFieldToJson.tags(tags as List<String>),
      if (tagsFieldValue != null)
        _$EntryEntityFieldMap['tags']!: tagsFieldValue,
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
    final json = {
      if (title != _sentinel)
        _$EntryEntityFieldMap['title']!:
            _$EntryEntityPerFieldToJson.title(title as String),
      if (titleFieldValue != null)
        _$EntryEntityFieldMap['title']!: titleFieldValue,
      if (subtitle != _sentinel)
        _$EntryEntityFieldMap['subtitle']!:
            _$EntryEntityPerFieldToJson.subtitle(subtitle as String),
      if (subtitleFieldValue != null)
        _$EntryEntityFieldMap['subtitle']!: subtitleFieldValue,
      if (content != _sentinel)
        _$EntryEntityFieldMap['content']!:
            _$EntryEntityPerFieldToJson.content(content as String),
      if (contentFieldValue != null)
        _$EntryEntityFieldMap['content']!: contentFieldValue,
      if (createdAt != _sentinel)
        _$EntryEntityFieldMap['createdAt']!:
            _$EntryEntityPerFieldToJson.createdAt(createdAt as DateTime),
      if (createdAtFieldValue != null)
        _$EntryEntityFieldMap['createdAt']!: createdAtFieldValue,
      if (tags != _sentinel)
        _$EntryEntityFieldMap['tags']!:
            _$EntryEntityPerFieldToJson.tags(tags as List<String>),
      if (tagsFieldValue != null)
        _$EntryEntityFieldMap['tags']!: tagsFieldValue,
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
    final json = {
      if (title != _sentinel)
        _$EntryEntityFieldMap['title']!:
            _$EntryEntityPerFieldToJson.title(title as String),
      if (titleFieldValue != null)
        _$EntryEntityFieldMap['title']!: titleFieldValue,
      if (subtitle != _sentinel)
        _$EntryEntityFieldMap['subtitle']!:
            _$EntryEntityPerFieldToJson.subtitle(subtitle as String),
      if (subtitleFieldValue != null)
        _$EntryEntityFieldMap['subtitle']!: subtitleFieldValue,
      if (content != _sentinel)
        _$EntryEntityFieldMap['content']!:
            _$EntryEntityPerFieldToJson.content(content as String),
      if (contentFieldValue != null)
        _$EntryEntityFieldMap['content']!: contentFieldValue,
      if (createdAt != _sentinel)
        _$EntryEntityFieldMap['createdAt']!:
            _$EntryEntityPerFieldToJson.createdAt(createdAt as DateTime),
      if (createdAtFieldValue != null)
        _$EntryEntityFieldMap['createdAt']!: createdAtFieldValue,
      if (tags != _sentinel)
        _$EntryEntityFieldMap['tags']!:
            _$EntryEntityPerFieldToJson.tags(tags as List<String>),
      if (tagsFieldValue != null)
        _$EntryEntityFieldMap['tags']!: tagsFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is EntryEntityDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class EntryEntityQuery
    implements QueryReference<EntryEntity, EntryEntityQuerySnapshot> {
  @override
  EntryEntityQuery limit(int limit);

  @override
  EntryEntityQuery limitToLast(int limit);

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
  EntryEntityQuery whereFieldPath(
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

  EntryEntityQuery whereDocumentId({
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

  EntryEntityQuery whereTitle({
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

  EntryEntityQuery whereSubtitle({
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

  EntryEntityQuery whereContent({
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

  EntryEntityQuery whereCreatedAt({
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

  EntryEntityQuery whereTags({
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
  EntryEntityQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    EntryEntityDocumentSnapshot? startAtDocument,
    EntryEntityDocumentSnapshot? endAtDocument,
    EntryEntityDocumentSnapshot? endBeforeDocument,
    EntryEntityDocumentSnapshot? startAfterDocument,
  });

  EntryEntityQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    EntryEntityDocumentSnapshot? startAtDocument,
    EntryEntityDocumentSnapshot? endAtDocument,
    EntryEntityDocumentSnapshot? endBeforeDocument,
    EntryEntityDocumentSnapshot? startAfterDocument,
  });

  EntryEntityQuery orderByTitle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    EntryEntityDocumentSnapshot? startAtDocument,
    EntryEntityDocumentSnapshot? endAtDocument,
    EntryEntityDocumentSnapshot? endBeforeDocument,
    EntryEntityDocumentSnapshot? startAfterDocument,
  });

  EntryEntityQuery orderBySubtitle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    EntryEntityDocumentSnapshot? startAtDocument,
    EntryEntityDocumentSnapshot? endAtDocument,
    EntryEntityDocumentSnapshot? endBeforeDocument,
    EntryEntityDocumentSnapshot? startAfterDocument,
  });

  EntryEntityQuery orderByContent({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    EntryEntityDocumentSnapshot? startAtDocument,
    EntryEntityDocumentSnapshot? endAtDocument,
    EntryEntityDocumentSnapshot? endBeforeDocument,
    EntryEntityDocumentSnapshot? startAfterDocument,
  });

  EntryEntityQuery orderByCreatedAt({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    EntryEntityDocumentSnapshot? startAtDocument,
    EntryEntityDocumentSnapshot? endAtDocument,
    EntryEntityDocumentSnapshot? endBeforeDocument,
    EntryEntityDocumentSnapshot? startAfterDocument,
  });

  EntryEntityQuery orderByTags({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    EntryEntityDocumentSnapshot? startAtDocument,
    EntryEntityDocumentSnapshot? endAtDocument,
    EntryEntityDocumentSnapshot? endBeforeDocument,
    EntryEntityDocumentSnapshot? startAfterDocument,
  });
}

class _$EntryEntityQuery
    extends QueryReference<EntryEntity, EntryEntityQuerySnapshot>
    implements EntryEntityQuery {
  _$EntryEntityQuery(
    this._collection, {
    required Query<EntryEntity> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<EntryEntityQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(EntryEntityQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<EntryEntityQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(EntryEntityQuerySnapshot._fromQuerySnapshot);
  }

  @override
  EntryEntityQuery limit(int limit) {
    return _$EntryEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  EntryEntityQuery limitToLast(int limit) {
    return _$EntryEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  EntryEntityQuery whereFieldPath(
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
    return _$EntryEntityQuery(
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
  EntryEntityQuery whereDocumentId({
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
    return _$EntryEntityQuery(
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
  EntryEntityQuery whereTitle({
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
    return _$EntryEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$EntryEntityFieldMap['title']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$EntryEntityPerFieldToJson.title(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$EntryEntityPerFieldToJson.title(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$EntryEntityPerFieldToJson.title(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$EntryEntityPerFieldToJson.title(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$EntryEntityPerFieldToJson.title(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$EntryEntityPerFieldToJson
                .title(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$EntryEntityPerFieldToJson.title(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$EntryEntityPerFieldToJson.title(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  EntryEntityQuery whereSubtitle({
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
    return _$EntryEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$EntryEntityFieldMap['subtitle']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$EntryEntityPerFieldToJson.subtitle(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$EntryEntityPerFieldToJson.subtitle(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$EntryEntityPerFieldToJson.subtitle(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$EntryEntityPerFieldToJson
                .subtitle(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$EntryEntityPerFieldToJson.subtitle(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$EntryEntityPerFieldToJson
                .subtitle(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$EntryEntityPerFieldToJson.subtitle(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$EntryEntityPerFieldToJson.subtitle(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  EntryEntityQuery whereContent({
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
    return _$EntryEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$EntryEntityFieldMap['content']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$EntryEntityPerFieldToJson.content(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$EntryEntityPerFieldToJson.content(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$EntryEntityPerFieldToJson.content(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$EntryEntityPerFieldToJson.content(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$EntryEntityPerFieldToJson.content(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$EntryEntityPerFieldToJson
                .content(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$EntryEntityPerFieldToJson.content(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$EntryEntityPerFieldToJson.content(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  EntryEntityQuery whereCreatedAt({
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
    return _$EntryEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$EntryEntityFieldMap['createdAt']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$EntryEntityPerFieldToJson.createdAt(isEqualTo as DateTime)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$EntryEntityPerFieldToJson.createdAt(isNotEqualTo as DateTime)
            : null,
        isLessThan: isLessThan != null
            ? _$EntryEntityPerFieldToJson.createdAt(isLessThan as DateTime)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$EntryEntityPerFieldToJson
                .createdAt(isLessThanOrEqualTo as DateTime)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$EntryEntityPerFieldToJson.createdAt(isGreaterThan as DateTime)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$EntryEntityPerFieldToJson
                .createdAt(isGreaterThanOrEqualTo as DateTime)
            : null,
        whereIn: whereIn?.map((e) => _$EntryEntityPerFieldToJson.createdAt(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$EntryEntityPerFieldToJson.createdAt(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  EntryEntityQuery whereTags({
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
    return _$EntryEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$EntryEntityFieldMap['tags']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$EntryEntityPerFieldToJson.tags(isEqualTo as List<String>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$EntryEntityPerFieldToJson.tags(isNotEqualTo as List<String>)
            : null,
        isLessThan: isLessThan != null
            ? _$EntryEntityPerFieldToJson.tags(isLessThan as List<String>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$EntryEntityPerFieldToJson
                .tags(isLessThanOrEqualTo as List<String>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$EntryEntityPerFieldToJson.tags(isGreaterThan as List<String>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$EntryEntityPerFieldToJson
                .tags(isGreaterThanOrEqualTo as List<String>)
            : null,
        arrayContains: arrayContains != null
            ? (_$EntryEntityPerFieldToJson.tags([arrayContains as String])
                    as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$EntryEntityPerFieldToJson.tags(arrayContainsAny)
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
  EntryEntityQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EntryEntityDocumentSnapshot? startAtDocument,
    EntryEntityDocumentSnapshot? endAtDocument,
    EntryEntityDocumentSnapshot? endBeforeDocument,
    EntryEntityDocumentSnapshot? startAfterDocument,
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

    return _$EntryEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  EntryEntityQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EntryEntityDocumentSnapshot? startAtDocument,
    EntryEntityDocumentSnapshot? endAtDocument,
    EntryEntityDocumentSnapshot? endBeforeDocument,
    EntryEntityDocumentSnapshot? startAfterDocument,
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

    return _$EntryEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  EntryEntityQuery orderByTitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EntryEntityDocumentSnapshot? startAtDocument,
    EntryEntityDocumentSnapshot? endAtDocument,
    EntryEntityDocumentSnapshot? endBeforeDocument,
    EntryEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$EntryEntityFieldMap['title']!, descending: descending);
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

    return _$EntryEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  EntryEntityQuery orderBySubtitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EntryEntityDocumentSnapshot? startAtDocument,
    EntryEntityDocumentSnapshot? endAtDocument,
    EntryEntityDocumentSnapshot? endBeforeDocument,
    EntryEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$EntryEntityFieldMap['subtitle']!, descending: descending);
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

    return _$EntryEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  EntryEntityQuery orderByContent({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EntryEntityDocumentSnapshot? startAtDocument,
    EntryEntityDocumentSnapshot? endAtDocument,
    EntryEntityDocumentSnapshot? endBeforeDocument,
    EntryEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$EntryEntityFieldMap['content']!, descending: descending);
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

    return _$EntryEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  EntryEntityQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EntryEntityDocumentSnapshot? startAtDocument,
    EntryEntityDocumentSnapshot? endAtDocument,
    EntryEntityDocumentSnapshot? endBeforeDocument,
    EntryEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$EntryEntityFieldMap['createdAt']!, descending: descending);
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

    return _$EntryEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  EntryEntityQuery orderByTags({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    EntryEntityDocumentSnapshot? startAtDocument,
    EntryEntityDocumentSnapshot? endAtDocument,
    EntryEntityDocumentSnapshot? endBeforeDocument,
    EntryEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$EntryEntityFieldMap['tags']!, descending: descending);
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

    return _$EntryEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$EntryEntityQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class EntryEntityDocumentSnapshot
    extends FirestoreDocumentSnapshot<EntryEntity> {
  EntryEntityDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<EntryEntity> snapshot;

  @override
  EntryEntityDocumentReference get reference {
    return EntryEntityDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final EntryEntity? data;
}

class EntryEntityQuerySnapshot extends FirestoreQuerySnapshot<EntryEntity,
    EntryEntityQueryDocumentSnapshot> {
  EntryEntityQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory EntryEntityQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<EntryEntity> snapshot,
  ) {
    final docs = snapshot.docs.map(EntryEntityQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        EntryEntityDocumentSnapshot._,
      );
    }).toList();

    return EntryEntityQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<EntryEntityDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    EntryEntityDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<EntryEntityDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<EntryEntity> snapshot;

  @override
  final List<EntryEntityQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<EntryEntityDocumentSnapshot>> docChanges;
}

class EntryEntityQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<EntryEntity>
    implements EntryEntityDocumentSnapshot {
  EntryEntityQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<EntryEntity> snapshot;

  @override
  final EntryEntity data;

  @override
  EntryEntityDocumentReference get reference {
    return EntryEntityDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntryEntity _$EntryEntityFromJson(Map<String, dynamic> json) => EntryEntity(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      content: json['content'] as String,
      createdAt: const FirestoreDateTimeConverter()
          .fromJson(json['createdAt'] as Timestamp),
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

const _$EntryEntityFieldMap = <String, String>{
  'id': 'id',
  'title': 'title',
  'subtitle': 'subtitle',
  'content': 'content',
  'createdAt': 'createdAt',
  'tags': 'tags',
};

// ignore: unused_element
abstract class _$EntryEntityPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
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
}

Map<String, dynamic> _$EntryEntityToJson(EntryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'content': instance.content,
      'createdAt':
          const FirestoreDateTimeConverter().toJson(instance.createdAt),
      'tags': instance.tags,
    };
