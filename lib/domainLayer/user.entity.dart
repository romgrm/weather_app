import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.entity.freezed.dart';
part 'user.entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    String? id,
    String? firstName,
    String? lastName,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, Object?> json) => _$UserEntityFromJson(json);
}
