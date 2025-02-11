// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FreezedModel _$FreezedModelFromJson(Map<String, dynamic> json) {
  return _FreezedModel.fromJson(json);
}

/// @nodoc
mixin _$FreezedModel {
  String get name => throw _privateConstructorUsedError;

  /// Serializes this FreezedModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FreezedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FreezedModelCopyWith<FreezedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreezedModelCopyWith<$Res> {
  factory $FreezedModelCopyWith(
          FreezedModel value, $Res Function(FreezedModel) then) =
      _$FreezedModelCopyWithImpl<$Res, FreezedModel>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$FreezedModelCopyWithImpl<$Res, $Val extends FreezedModel>
    implements $FreezedModelCopyWith<$Res> {
  _$FreezedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FreezedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FreezedModelImplCopyWith<$Res>
    implements $FreezedModelCopyWith<$Res> {
  factory _$$FreezedModelImplCopyWith(
          _$FreezedModelImpl value, $Res Function(_$FreezedModelImpl) then) =
      __$$FreezedModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$FreezedModelImplCopyWithImpl<$Res>
    extends _$FreezedModelCopyWithImpl<$Res, _$FreezedModelImpl>
    implements _$$FreezedModelImplCopyWith<$Res> {
  __$$FreezedModelImplCopyWithImpl(
      _$FreezedModelImpl _value, $Res Function(_$FreezedModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FreezedModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$FreezedModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FreezedModelImpl implements _FreezedModel {
  const _$FreezedModelImpl({required this.name});

  factory _$FreezedModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FreezedModelImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'FreezedModel(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FreezedModelImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of FreezedModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FreezedModelImplCopyWith<_$FreezedModelImpl> get copyWith =>
      __$$FreezedModelImplCopyWithImpl<_$FreezedModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FreezedModelImplToJson(
      this,
    );
  }
}

abstract class _FreezedModel implements FreezedModel {
  const factory _FreezedModel({required final String name}) =
      _$FreezedModelImpl;

  factory _FreezedModel.fromJson(Map<String, dynamic> json) =
      _$FreezedModelImpl.fromJson;

  @override
  String get name;

  /// Create a copy of FreezedModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FreezedModelImplCopyWith<_$FreezedModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
