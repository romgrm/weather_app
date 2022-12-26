import 'package:freezed_annotation/freezed_annotation.dart';

part 'main.dto.freezed.dart';
part 'main.dto.g.dart';

@freezed
class MainDto with _$MainDto {
  const factory MainDto({double? temp, double? feels_like, double? temp_min, double? temp_max}) = _MainDto;

  factory MainDto.fromJson(Map<String, Object?> json) => _$MainDtoFromJson(json);
}
