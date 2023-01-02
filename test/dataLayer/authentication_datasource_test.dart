import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/rest/restManager.dart';
import 'package:weather_app/dataLayer/datasources/authentication_impl.data.dart';
import 'package:weather_app/dataLayer/dto/user.dto.dart';

class DioClientMock extends Mock implements RestManager {}

late DioClientMock _mockDioClient;
late AuthenticationDataSourceImpl _authenticationDataSourceImpl;

String email = '';
String password = '';

void setUp() {
  _mockDioClient = DioClientMock();
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUp();

  group("test user login", () {
    email = "test@test.fr";
    password = "test";

    test(
      "should return a User when logged is success",
      () async {
        // arrange
        final body = {"email": email, "password": password};

        when(
          () => _mockDioClient.post(path: "/auth", body: body),
        ).thenAnswer((_) async => Future.value({"id": "1", "firstName": "John", "lastName": "Doe"}));

        _authenticationDataSourceImpl = AuthenticationDataSourceImpl(_mockDioClient);

        // act
        final result = await _authenticationDataSourceImpl.login(email, password);

        // assert
        expect(result, isA<UserDto>());
      },
    );
  });
}
