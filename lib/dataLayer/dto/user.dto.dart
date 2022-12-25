import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/domainLayer/user.entity.dart';

part 'user.dto.freezed.dart';
part 'user.dto.g.dart';

@freezed
class UserDto with _$UserDto {
  const UserDto._();

  const factory UserDto({
    String? id,
    String? firstName,
    String? lastName,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, Object?> json) => _$UserDtoFromJson(json);

  UserEntity toEntity() => UserEntity(id: id, firstName: firstName, lastName: lastName);
}
