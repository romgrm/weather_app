import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/rest/restManager.dart';
import 'package:weather_app/dataLayer/datasources/authentication_impl.data.dart';
import 'package:weather_app/dataLayer/dto/user.dto.dart';

// class AuthenticationRepositoryMock extends Mock implements AuthenticationRepository()
class DioClientMock extends Mock implements RestManager {}

// late AuthenticationRepositoryMock _authenticationRepositoryMock;
late DioClientMock _mockDioClient;
late AuthenticationDataSourceImpl _authenticationDataSourceImpl;

String email = '';
String password = '';

void setUp() {
//  _authenticationRepositoryMock = AuthenticationRepositoryMock();
  _mockDioClient = DioClientMock();
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUp();

  group("test user loggin", () {
    email = "test@test.fr";
    password = "test";

    test(
      "should return a User when logged is success",
      () async {
        // arrange
        final body = {"email": email, "password": password};

        when(
          () => _mockDioClient.post(path: "/auth", body: body),
        ).thenAnswer((_) async => Future.value({"id": "1", "firstName": "Romain", "lastName": "Gréaume"}));

        _authenticationDataSourceImpl = AuthenticationDataSourceImpl(_mockDioClient);

        // act
        final result = await _authenticationDataSourceImpl.login(email, password);

        // assert
        expect(result, isA<UserDto>());
      },
    );
  });
}
