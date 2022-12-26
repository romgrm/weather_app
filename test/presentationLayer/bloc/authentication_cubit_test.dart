import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/rest/rest_exception.dart';
import 'package:weather_app/dataLayer/dto/user.dto.dart';
import 'package:weather_app/dataLayer/repositories/authentication.repository.dart';
import 'package:weather_app/domainLayer/user.entity.dart';
import 'package:weather_app/presentationLayer/bloc/authentication.cubit.dart';

class AuthenticationRepositoryMock extends Mock implements AuthenticationRepository {}

void main() {
  late AuthenticationCubit authenticationCubit;
  late AuthenticationRepositoryMock authenticationRepositoryMock;

  String email = "test@test.fr";
  String password = "test";
  UserEntity user = UserEntity(id: "1", firstName: "Romain", lastName: "Gréaume");

  group("testing authentication cubit", () {
    setUp(() {
      authenticationRepositoryMock = AuthenticationRepositoryMock();
      authenticationCubit = AuthenticationCubit(authenticationRepositoryMock);
    });
    blocTest<AuthenticationCubit, AuthenticationState>("when login is trigger, first emit LoadingState then emit UserEntity when it's onSuccess",
        setUp: () async {
          when(
            () => authenticationRepositoryMock.login(email, password),
          ).thenAnswer((_) => Future.value(user));
        },
        build: (() => authenticationCubit),
        act: (bloc) => bloc.login(email, password),
        expect: () => [
              AuthenticationState.loading(),
              AuthenticationState.onSuccess(
                user: user,
              )
            ]);
    blocTest<AuthenticationCubit, AuthenticationState>("when login is trigger, first emit LoadingState then emit Exception when it's onError",
        setUp: () async {
          when(
            () => authenticationRepositoryMock.login(email, password),
          ).thenAnswer((_) => Future.value(null));
        },
        build: (() => authenticationCubit),
        act: (bloc) => bloc.login(email, password),
        expect: () => [AuthenticationState.loading(), AuthenticationState.onError(errorMessage: RestException.restErrorUnauthorized)]);
  });
}
