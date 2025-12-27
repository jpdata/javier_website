// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PortfolioEntry implements DiagnosticableTreeMixin {

 String get id; String get name; String get description; String get url; String get icon; bool get iconIsAsset; String get imageUrl; DateTime? get createdAt;
/// Create a copy of PortfolioEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioEntryCopyWith<PortfolioEntry> get copyWith => _$PortfolioEntryCopyWithImpl<PortfolioEntry>(this as PortfolioEntry, _$identity);

  /// Serializes this PortfolioEntry to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PortfolioEntry'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('url', url))..add(DiagnosticsProperty('icon', icon))..add(DiagnosticsProperty('iconIsAsset', iconIsAsset))..add(DiagnosticsProperty('imageUrl', imageUrl))..add(DiagnosticsProperty('createdAt', createdAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.url, url) || other.url == url)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.iconIsAsset, iconIsAsset) || other.iconIsAsset == iconIsAsset)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,url,icon,iconIsAsset,imageUrl,createdAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PortfolioEntry(id: $id, name: $name, description: $description, url: $url, icon: $icon, iconIsAsset: $iconIsAsset, imageUrl: $imageUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PortfolioEntryCopyWith<$Res>  {
  factory $PortfolioEntryCopyWith(PortfolioEntry value, $Res Function(PortfolioEntry) _then) = _$PortfolioEntryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String url, String icon, bool iconIsAsset, String imageUrl, DateTime? createdAt
});




}
/// @nodoc
class _$PortfolioEntryCopyWithImpl<$Res>
    implements $PortfolioEntryCopyWith<$Res> {
  _$PortfolioEntryCopyWithImpl(this._self, this._then);

  final PortfolioEntry _self;
  final $Res Function(PortfolioEntry) _then;

/// Create a copy of PortfolioEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? url = null,Object? icon = null,Object? iconIsAsset = null,Object? imageUrl = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,iconIsAsset: null == iconIsAsset ? _self.iconIsAsset : iconIsAsset // ignore: cast_nullable_to_non_nullable
as bool,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PortfolioEntry].
extension PortfolioEntryPatterns on PortfolioEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PortfolioEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PortfolioEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PortfolioEntry value)  $default,){
final _that = this;
switch (_that) {
case _PortfolioEntry():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PortfolioEntry value)?  $default,){
final _that = this;
switch (_that) {
case _PortfolioEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String url,  String icon,  bool iconIsAsset,  String imageUrl,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PortfolioEntry() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.url,_that.icon,_that.iconIsAsset,_that.imageUrl,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String url,  String icon,  bool iconIsAsset,  String imageUrl,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _PortfolioEntry():
return $default(_that.id,_that.name,_that.description,_that.url,_that.icon,_that.iconIsAsset,_that.imageUrl,_that.createdAt);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String url,  String icon,  bool iconIsAsset,  String imageUrl,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PortfolioEntry() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.url,_that.icon,_that.iconIsAsset,_that.imageUrl,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PortfolioEntry with DiagnosticableTreeMixin implements PortfolioEntry {
  const _PortfolioEntry({required this.id, required this.name, required this.description, required this.url, this.icon = '', this.iconIsAsset = false, this.imageUrl = '', this.createdAt});
  factory _PortfolioEntry.fromJson(Map<String, dynamic> json) => _$PortfolioEntryFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  String url;
@override@JsonKey() final  String icon;
@override@JsonKey() final  bool iconIsAsset;
@override@JsonKey() final  String imageUrl;
@override final  DateTime? createdAt;

/// Create a copy of PortfolioEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PortfolioEntryCopyWith<_PortfolioEntry> get copyWith => __$PortfolioEntryCopyWithImpl<_PortfolioEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PortfolioEntryToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PortfolioEntry'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('url', url))..add(DiagnosticsProperty('icon', icon))..add(DiagnosticsProperty('iconIsAsset', iconIsAsset))..add(DiagnosticsProperty('imageUrl', imageUrl))..add(DiagnosticsProperty('createdAt', createdAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PortfolioEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.url, url) || other.url == url)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.iconIsAsset, iconIsAsset) || other.iconIsAsset == iconIsAsset)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,url,icon,iconIsAsset,imageUrl,createdAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PortfolioEntry(id: $id, name: $name, description: $description, url: $url, icon: $icon, iconIsAsset: $iconIsAsset, imageUrl: $imageUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PortfolioEntryCopyWith<$Res> implements $PortfolioEntryCopyWith<$Res> {
  factory _$PortfolioEntryCopyWith(_PortfolioEntry value, $Res Function(_PortfolioEntry) _then) = __$PortfolioEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String url, String icon, bool iconIsAsset, String imageUrl, DateTime? createdAt
});




}
/// @nodoc
class __$PortfolioEntryCopyWithImpl<$Res>
    implements _$PortfolioEntryCopyWith<$Res> {
  __$PortfolioEntryCopyWithImpl(this._self, this._then);

  final _PortfolioEntry _self;
  final $Res Function(_PortfolioEntry) _then;

/// Create a copy of PortfolioEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? url = null,Object? icon = null,Object? iconIsAsset = null,Object? imageUrl = null,Object? createdAt = freezed,}) {
  return _then(_PortfolioEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,iconIsAsset: null == iconIsAsset ? _self.iconIsAsset : iconIsAsset // ignore: cast_nullable_to_non_nullable
as bool,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
