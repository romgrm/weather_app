import 'package:weather_app/dataLayer/dto/user.dto.dart';

abstract class AuthenticationDataSource {
  Future<UserDto> loggin(String email, String password);
}
