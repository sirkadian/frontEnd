import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sirkadian_project/models/auth_models/initS_request.dart';
import 'package:sirkadian_project/models/auth_models/initS_response.dart';
import 'package:sirkadian_project/models/auth_models/login_request.dart';
import 'package:sirkadian_project/models/auth_models/login_response.dart';
import 'package:sirkadian_project/models/auth_models/register_request.dart';
import 'package:sirkadian_project/models/auth_models/register_response.dart';
import 'package:sirkadian_project/models/auth_models/userActivation_response.dart';
import 'package:sirkadian_project/repository/auth_repository/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthRepository _authRepository = AuthRepository();

  void activationUser(String idUser, String code) async {
    emit(AuthLoading());
    try {
      final _data = await _authRepository.userActivation(idUser, code);

      _data.fold((l) => emit(AuthError(errorMessage: l)),
          (r) => emit(AuthActivationSucces(dataActivation: r)));
    } catch (error) {
      emit(AuthError(errorMessage: error.toString()));
    }
  }

  void signUpUser({RegisterRequest registerRequest}) async {
    emit(AuthLoading());
    try {
      final _data = await _authRepository.signUpUserWithEmailUserPass(
          registerRequest: registerRequest);

      _data.fold((l) => emit(AuthError(errorMessage: l)),
          (r) => emit(AuthSignUpSucces(dataRegister: r)));
    } catch (error) {
      emit(AuthError(errorMessage: error.toString()));
    }
  }

  void signInUser({LoginRequest loginRequest}) async {
    emit(AuthLoading());
    try {
      final _data = await _authRepository.signInUserWithEmailAndPassword(
        loginRequest: loginRequest,
      );

      _data.fold((l) => emit(AuthError(errorMessage: l)),
          (r) => emit(AuthLogSucces(dataLogin: r)));
    } catch (error) {
      emit(AuthError(errorMessage: error.toString()));
    }
  }

  void getUserInitS(
      {InitialSetupRequest initialSetupRequest, String authToken}) async {
    emit(AuthLoading());
    try {
      final _data = await _authRepository.getUserInitialSetup(
          initialSetupRequest: initialSetupRequest, authToken: authToken);

      _data.fold((l) => emit(AuthError(errorMessage: l)),
          (r) => emit(InitialsetupLogSucces(dataInitS: r)));
    } catch (error) {
      emit(AuthError(errorMessage: error.toString()));
    }
  }
}
