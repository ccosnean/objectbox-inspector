// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FreezedModel {

 String get name;
/// Create a copy of FreezedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreezedModelCopyWith<FreezedModel> get copyWith => _$FreezedModelCopyWithImpl<FreezedModel>(this as FreezedModel, _$identity);

  /// Serializes this FreezedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreezedModel&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'FreezedModel(name: $name)';
}


}

/// @nodoc
abstract mixin class $FreezedModelCopyWith<$Res>  {
  factory $FreezedModelCopyWith(FreezedModel value, $Res Function(FreezedModel) _then) = _$FreezedModelCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$FreezedModelCopyWithImpl<$Res>
    implements $FreezedModelCopyWith<$Res> {
  _$FreezedModelCopyWithImpl(this._self, this._then);

  final FreezedModel _self;
  final $Res Function(FreezedModel) _then;

/// Create a copy of FreezedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FreezedModel].
extension FreezedModelPatterns on FreezedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FreezedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FreezedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FreezedModel value)  $default,){
final _that = this;
switch (_that) {
case _FreezedModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FreezedModel value)?  $default,){
final _that = this;
switch (_that) {
case _FreezedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FreezedModel() when $default != null:
return $default(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case _FreezedModel():
return $default(_that.name);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case _FreezedModel() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FreezedModel implements FreezedModel {
  const _FreezedModel({required this.name});
  factory _FreezedModel.fromJson(Map<String, dynamic> json) => _$FreezedModelFromJson(json);

@override final  String name;

/// Create a copy of FreezedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FreezedModelCopyWith<_FreezedModel> get copyWith => __$FreezedModelCopyWithImpl<_FreezedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FreezedModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FreezedModel&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'FreezedModel(name: $name)';
}


}

/// @nodoc
abstract mixin class _$FreezedModelCopyWith<$Res> implements $FreezedModelCopyWith<$Res> {
  factory _$FreezedModelCopyWith(_FreezedModel value, $Res Function(_FreezedModel) _then) = __$FreezedModelCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$FreezedModelCopyWithImpl<$Res>
    implements _$FreezedModelCopyWith<$Res> {
  __$FreezedModelCopyWithImpl(this._self, this._then);

  final _FreezedModel _self;
  final $Res Function(_FreezedModel) _then;

/// Create a copy of FreezedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_FreezedModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
