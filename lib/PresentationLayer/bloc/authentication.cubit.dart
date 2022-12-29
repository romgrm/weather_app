import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/core/storage/storage.manager.dart';
import 'package:weather_app/dataLayer/repositories/authentication.repository.dart';

import '../../core/di/service_locator.dart';
import '../../core/rest/rest_exception.dart';
import '../../domainLayer/user.entity.dart';

part 'authentication.state.dart';
part 'authentication.cubit.freezed.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  final StorageManager storage = getIt<StorageManager>();
  AuthenticationCubit(this.authenticationRepository) : super(Loading()) {
    ifAlreadyLogged();
  }

  Future ifAlreadyLogged() async {
    final userFromCache = await storage.readCurrentUser();

    if (userFromCache != null) {
      emit(OnSuccess(user: userFromCache));
      return;
    }
  }

  Future<void> login(String email, String password) async {
    emit(const Loading());

    final user = await authenticationRepository.login(email, password);

    if (user != null) {
      storage.writeCurrentUser(user);
      emit(OnSuccess(user: user));
    } else {
      emit(OnError(errorMessage: RestException.restErrorUnauthorized));
    }
  }

  Future<void> logout() async {
    await storage.deleteCurrentUser();
  }
}
