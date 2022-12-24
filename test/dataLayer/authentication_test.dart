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
    email = "test";
    password = "test";

    test("should post() method be called", () async {
      // arrange

      when(
        () => _mockDioClient.post(path: "test"),
      ).thenAnswer((_) async => Future.value("called"));

      _authenticationDataSourceImpl = AuthenticationDataSourceImpl(_mockDioClient);

      // act
      await _authenticationDataSourceImpl.loggin(email, password);

      // assert

      verify(() => _mockDioClient.post(path: "test")).called(1);
    });

    test(
      "should return a User when it's logged",
      () async {
        // arrange

        when(
          () => _mockDioClient.post(path: "test"),
        ).thenAnswer((_) async => Future.value("called"));

        _authenticationDataSourceImpl = AuthenticationDataSourceImpl(_mockDioClient);

        // act
        final result = await _authenticationDataSourceImpl.loggin(email, password);

        // assert
        expect(result, isA<UserDto>());
      },
    );
  });
}
