import 'package:weather_app/dataLayer/dto/user.dto.dart';
import 'package:weather_app/domainLayer/user.entity.dart';

import '../../core/di/service_locator.dart';
import '../datasources/authentication.data.dart';

class AuthenticationRepository {
  final _provider = getIt<AuthenticationDataSource>();

  Future<UserEntity?> login(String email, String password) async {
    final UserDto? userDto = await _provider.login(email, password);

    if (userDto != null) {
      return userDto.toEntity();
    } else {
      return null;
    }
  }
}
