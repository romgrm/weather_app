import '../../core/di/service_locator.dart';
import '../../domainLayer/user.entity.dart';
import '../datasources/authentication.data.dart';
import '../dto/user.dto.dart';

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
