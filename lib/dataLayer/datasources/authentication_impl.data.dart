import 'package:weather_app/dataLayer/datasources/authentication.data.dart';
import 'package:weather_app/dataLayer/dto/user.dto.dart';

import '../../core/rest/restManager.dart';

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  final RestManager _restManager;

  AuthenticationDataSourceImpl(this._restManager);
  @override
  Future<UserDto?> login(String email, String password) async {
    final body = {"email": email, "password": password};
    final json = await _restManager.post(path: "/auth", body: body);

    if (json != null) {
      return Future.delayed(Duration(seconds: 2), () => UserDto.fromJson(json));
    }
    return null;
  }
}
