import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/dataLayer/repositories/authentication.repository.dart';

import '../../core/rest/rest_exception.dart';
import '../../domainLayer/user.entity.dart';

part 'authentication.state.dart';
part 'authentication.cubit.freezed.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  AuthenticationCubit(this.authenticationRepository) : super(Loading());

  Future<void> login(String email, String password) async {
    try {
      emit(const Loading());

      final user = await authenticationRepository.login(email, password);

      if (user != null) {
        emit(OnSuccess(user: user));
      }
    } on RestException catch (e) {
      emit(OnError(errorMessage: e.message));
    }
  }
}
