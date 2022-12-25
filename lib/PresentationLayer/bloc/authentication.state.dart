part of 'authentication.cubit.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.loading() = Loading;
  const factory AuthenticationState.onSuccess({required UserEntity user}) = OnSuccess;
  const factory AuthenticationState.onError({required String errorMessage}) = OnError;
}
