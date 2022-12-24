import 'package:weather_app/dataLayer/datasources/authentication.data.dart';
import 'package:weather_app/dataLayer/dto/user.dto.dart';

import '../../core/rest/restManager.dart';

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  final RestManager _restManager;

  AuthenticationDataSourceImpl(this._restManager);
  @override
  Future<UserDto> loggin(String email, String password) async {
    await _restManager.post(path: "test");
    return Future.delayed(const Duration(seconds: 2), () => UserDto());
  }
}
