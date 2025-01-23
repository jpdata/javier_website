// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_entity.dart';

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
abstract class AuthorEntityCollectionReference
    implements
        AuthorEntityQuery,
        FirestoreCollectionReference<AuthorEntity, AuthorEntityQuerySnapshot> {
  factory AuthorEntityCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$AuthorEntityCollectionReference;

  static AuthorEntity fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$AuthorEntityFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    AuthorEntity value,
    SetOptions? options,
  ) {
    return {..._$AuthorEntityToJson(value)}..remove('id');
  }

  @override
  CollectionReference<AuthorEntity> get reference;

  @override
  AuthorEntityDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<AuthorEntityDocumentReference> add(AuthorEntity value);
}

class _$AuthorEntityCollectionReference extends _$AuthorEntityQuery
    implements AuthorEntityCollectionReference {
  factory _$AuthorEntityCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$AuthorEntityCollectionReference._(
      firestore.collection('authors').withConverter(
            fromFirestore: AuthorEntityCollectionReference.fromFirestore,
            toFirestore: AuthorEntityCollectionReference.toFirestore,
          ),
    );
  }

  _$AuthorEntityCollectionReference._(
    CollectionReference<AuthorEntity> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<AuthorEntity> get reference =>
      super.reference as CollectionReference<AuthorEntity>;

  @override
  AuthorEntityDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return AuthorEntityDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<AuthorEntityDocumentReference> add(AuthorEntity value) {
    return reference
        .add(value)
        .then((ref) => AuthorEntityDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$AuthorEntityCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class AuthorEntityDocumentReference extends FirestoreDocumentReference<
    AuthorEntity, AuthorEntityDocumentSnapshot> {
  factory AuthorEntityDocumentReference(
          DocumentReference<AuthorEntity> reference) =
      _$AuthorEntityDocumentReference;

  DocumentReference<AuthorEntity> get reference;

  /// A reference to the [AuthorEntityCollectionReference] containing this document.
  AuthorEntityCollectionReference get parent {
    return _$AuthorEntityCollectionReference(reference.firestore);
  }

  @override
  Stream<AuthorEntityDocumentSnapshot> snapshots();

  @override
  Future<AuthorEntityDocumentSnapshot> get([GetOptions? options]);

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
    AuthorEntity model, {
    SetOptions? options,
    FieldValue nameFieldValue,
    FieldValue emailFieldValue,
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
    AuthorEntity model, {
    SetOptions? options,
    FieldValue nameFieldValue,
    FieldValue emailFieldValue,
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
    AuthorEntity model, {
    SetOptions? options,
    FieldValue nameFieldValue,
    FieldValue emailFieldValue,
  });

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String name,
    FieldValue nameFieldValue,
    String email,
    FieldValue emailFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String name,
    FieldValue nameFieldValue,
    String email,
    FieldValue emailFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    String name,
    FieldValue nameFieldValue,
    String email,
    FieldValue emailFieldValue,
  });
}

class _$AuthorEntityDocumentReference extends FirestoreDocumentReference<
    AuthorEntity,
    AuthorEntityDocumentSnapshot> implements AuthorEntityDocumentReference {
  _$AuthorEntityDocumentReference(this.reference);

  @override
  final DocumentReference<AuthorEntity> reference;

  /// A reference to the [AuthorEntityCollectionReference] containing this document.
  AuthorEntityCollectionReference get parent {
    return _$AuthorEntityCollectionReference(reference.firestore);
  }

  @override
  Stream<AuthorEntityDocumentSnapshot> snapshots() {
    return reference.snapshots().map(AuthorEntityDocumentSnapshot._);
  }

  @override
  Future<AuthorEntityDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(AuthorEntityDocumentSnapshot._);
  }

  @override
  Future<AuthorEntityDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(AuthorEntityDocumentSnapshot._);
  }

  Future<void> set(
    AuthorEntity model, {
    SetOptions? options,
    FieldValue? nameFieldValue,
    FieldValue? emailFieldValue,
  }) async {
    final json = {
      ..._$AuthorEntityToJson(model),
      if (nameFieldValue != null)
        _$AuthorEntityFieldMap['name']!: nameFieldValue,
      if (emailFieldValue != null)
        _$AuthorEntityFieldMap['email']!: emailFieldValue,
    };

    final castedReference = reference.withConverter<Map<String, dynamic>>(
      fromFirestore: (snapshot, options) => throw UnimplementedError(),
      toFirestore: (value, options) => value,
    );
    return castedReference.set(json, options);
  }

  void transactionSet(
    Transaction transaction,
    AuthorEntity model, {
    SetOptions? options,
    FieldValue? nameFieldValue,
    FieldValue? emailFieldValue,
  }) {
    final json = {
      ..._$AuthorEntityToJson(model),
      if (nameFieldValue != null)
        _$AuthorEntityFieldMap['name']!: nameFieldValue,
      if (emailFieldValue != null)
        _$AuthorEntityFieldMap['email']!: emailFieldValue,
    };

    transaction.set(reference, json, options);
  }

  void batchSet(
    WriteBatch batch,
    AuthorEntity model, {
    SetOptions? options,
    FieldValue? nameFieldValue,
    FieldValue? emailFieldValue,
  }) {
    final json = {
      ..._$AuthorEntityToJson(model),
      if (nameFieldValue != null)
        _$AuthorEntityFieldMap['name']!: nameFieldValue,
      if (emailFieldValue != null)
        _$AuthorEntityFieldMap['email']!: emailFieldValue,
    };

    batch.set(reference, json, options);
  }

  Future<void> update({
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
  }) async {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    final json = {
      if (name != _sentinel)
        _$AuthorEntityFieldMap['name']!:
            _$AuthorEntityPerFieldToJson.name(name as String),
      if (nameFieldValue != null)
        _$AuthorEntityFieldMap['name']!: nameFieldValue,
      if (email != _sentinel)
        _$AuthorEntityFieldMap['email']!:
            _$AuthorEntityPerFieldToJson.email(email as String),
      if (emailFieldValue != null)
        _$AuthorEntityFieldMap['email']!: emailFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    final json = {
      if (name != _sentinel)
        _$AuthorEntityFieldMap['name']!:
            _$AuthorEntityPerFieldToJson.name(name as String),
      if (nameFieldValue != null)
        _$AuthorEntityFieldMap['name']!: nameFieldValue,
      if (email != _sentinel)
        _$AuthorEntityFieldMap['email']!:
            _$AuthorEntityPerFieldToJson.email(email as String),
      if (emailFieldValue != null)
        _$AuthorEntityFieldMap['email']!: emailFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    final json = {
      if (name != _sentinel)
        _$AuthorEntityFieldMap['name']!:
            _$AuthorEntityPerFieldToJson.name(name as String),
      if (nameFieldValue != null)
        _$AuthorEntityFieldMap['name']!: nameFieldValue,
      if (email != _sentinel)
        _$AuthorEntityFieldMap['email']!:
            _$AuthorEntityPerFieldToJson.email(email as String),
      if (emailFieldValue != null)
        _$AuthorEntityFieldMap['email']!: emailFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is AuthorEntityDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class AuthorEntityQuery
    implements QueryReference<AuthorEntity, AuthorEntityQuerySnapshot> {
  @override
  AuthorEntityQuery limit(int limit);

  @override
  AuthorEntityQuery limitToLast(int limit);

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
  AuthorEntityQuery whereFieldPath(
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

  AuthorEntityQuery whereDocumentId({
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

  AuthorEntityQuery whereName({
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

  AuthorEntityQuery whereEmail({
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
  AuthorEntityQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    AuthorEntityDocumentSnapshot? startAtDocument,
    AuthorEntityDocumentSnapshot? endAtDocument,
    AuthorEntityDocumentSnapshot? endBeforeDocument,
    AuthorEntityDocumentSnapshot? startAfterDocument,
  });

  AuthorEntityQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AuthorEntityDocumentSnapshot? startAtDocument,
    AuthorEntityDocumentSnapshot? endAtDocument,
    AuthorEntityDocumentSnapshot? endBeforeDocument,
    AuthorEntityDocumentSnapshot? startAfterDocument,
  });

  AuthorEntityQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AuthorEntityDocumentSnapshot? startAtDocument,
    AuthorEntityDocumentSnapshot? endAtDocument,
    AuthorEntityDocumentSnapshot? endBeforeDocument,
    AuthorEntityDocumentSnapshot? startAfterDocument,
  });

  AuthorEntityQuery orderByEmail({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AuthorEntityDocumentSnapshot? startAtDocument,
    AuthorEntityDocumentSnapshot? endAtDocument,
    AuthorEntityDocumentSnapshot? endBeforeDocument,
    AuthorEntityDocumentSnapshot? startAfterDocument,
  });
}

class _$AuthorEntityQuery
    extends QueryReference<AuthorEntity, AuthorEntityQuerySnapshot>
    implements AuthorEntityQuery {
  _$AuthorEntityQuery(
    this._collection, {
    required Query<AuthorEntity> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<AuthorEntityQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(AuthorEntityQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<AuthorEntityQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(AuthorEntityQuerySnapshot._fromQuerySnapshot);
  }

  @override
  AuthorEntityQuery limit(int limit) {
    return _$AuthorEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  AuthorEntityQuery limitToLast(int limit) {
    return _$AuthorEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  AuthorEntityQuery whereFieldPath(
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
    return _$AuthorEntityQuery(
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
  AuthorEntityQuery whereDocumentId({
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
    return _$AuthorEntityQuery(
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
  AuthorEntityQuery whereName({
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
    return _$AuthorEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$AuthorEntityFieldMap['name']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$AuthorEntityPerFieldToJson.name(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$AuthorEntityPerFieldToJson.name(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$AuthorEntityPerFieldToJson.name(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$AuthorEntityPerFieldToJson.name(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$AuthorEntityPerFieldToJson.name(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$AuthorEntityPerFieldToJson
                .name(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$AuthorEntityPerFieldToJson.name(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$AuthorEntityPerFieldToJson.name(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  AuthorEntityQuery whereEmail({
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
    return _$AuthorEntityQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$AuthorEntityFieldMap['email']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$AuthorEntityPerFieldToJson.email(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$AuthorEntityPerFieldToJson.email(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$AuthorEntityPerFieldToJson.email(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$AuthorEntityPerFieldToJson.email(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$AuthorEntityPerFieldToJson.email(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$AuthorEntityPerFieldToJson
                .email(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$AuthorEntityPerFieldToJson.email(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$AuthorEntityPerFieldToJson.email(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  AuthorEntityQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AuthorEntityDocumentSnapshot? startAtDocument,
    AuthorEntityDocumentSnapshot? endAtDocument,
    AuthorEntityDocumentSnapshot? endBeforeDocument,
    AuthorEntityDocumentSnapshot? startAfterDocument,
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

    return _$AuthorEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  AuthorEntityQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AuthorEntityDocumentSnapshot? startAtDocument,
    AuthorEntityDocumentSnapshot? endAtDocument,
    AuthorEntityDocumentSnapshot? endBeforeDocument,
    AuthorEntityDocumentSnapshot? startAfterDocument,
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

    return _$AuthorEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  AuthorEntityQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AuthorEntityDocumentSnapshot? startAtDocument,
    AuthorEntityDocumentSnapshot? endAtDocument,
    AuthorEntityDocumentSnapshot? endBeforeDocument,
    AuthorEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$AuthorEntityFieldMap['name']!, descending: descending);
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

    return _$AuthorEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  AuthorEntityQuery orderByEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AuthorEntityDocumentSnapshot? startAtDocument,
    AuthorEntityDocumentSnapshot? endAtDocument,
    AuthorEntityDocumentSnapshot? endBeforeDocument,
    AuthorEntityDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$AuthorEntityFieldMap['email']!, descending: descending);
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

    return _$AuthorEntityQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$AuthorEntityQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class AuthorEntityDocumentSnapshot
    extends FirestoreDocumentSnapshot<AuthorEntity> {
  AuthorEntityDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<AuthorEntity> snapshot;

  @override
  AuthorEntityDocumentReference get reference {
    return AuthorEntityDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final AuthorEntity? data;
}

class AuthorEntityQuerySnapshot extends FirestoreQuerySnapshot<AuthorEntity,
    AuthorEntityQueryDocumentSnapshot> {
  AuthorEntityQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory AuthorEntityQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<AuthorEntity> snapshot,
  ) {
    final docs =
        snapshot.docs.map(AuthorEntityQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        AuthorEntityDocumentSnapshot._,
      );
    }).toList();

    return AuthorEntityQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<AuthorEntityDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    AuthorEntityDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<AuthorEntityDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<AuthorEntity> snapshot;

  @override
  final List<AuthorEntityQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<AuthorEntityDocumentSnapshot>> docChanges;
}

class AuthorEntityQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<AuthorEntity>
    implements AuthorEntityDocumentSnapshot {
  AuthorEntityQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<AuthorEntity> snapshot;

  @override
  final AuthorEntity data;

  @override
  AuthorEntityDocumentReference get reference {
    return AuthorEntityDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorEntity _$AuthorEntityFromJson(Map<String, dynamic> json) => AuthorEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );

const _$AuthorEntityFieldMap = <String, String>{
  'id': 'id',
  'name': 'name',
  'email': 'email',
};

// ignore: unused_element
abstract class _$AuthorEntityPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? email(String instance) => instance;
}

Map<String, dynamic> _$AuthorEntityToJson(AuthorEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
