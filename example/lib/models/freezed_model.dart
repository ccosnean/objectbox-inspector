import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_model.freezed.dart';
part 'freezed_model.g.dart';

@freezed
class FreezedModel with _$FreezedModel {
  const factory FreezedModel({required String name}) = _FreezedModel;

  factory FreezedModel.fromJson(Map<String, dynamic> json) =>
      _$FreezedModelFromJson(json);
}
