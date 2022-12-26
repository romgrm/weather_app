import 'package:weather_app/dataLayer/dto/user.dto.dart';

abstract class AuthenticationDataSource {
  Future<UserDto?> login(String email, String password);
}
