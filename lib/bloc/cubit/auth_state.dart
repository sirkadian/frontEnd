part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String errorMessage;
  AuthError({
    this.errorMessage,
  });
}

class AuthLogSucces extends AuthState {
  final LoginResponse dataLogin;
  AuthLogSucces({
    @required this.dataLogin,
  });
}

class AuthSignUpSucces extends AuthState {
  final RegisterResponse dataRegister;
  AuthSignUpSucces({
    @required this.dataRegister,
  });
}

class AuthActivationSucces extends AuthState {
  final ActivationResponse dataActivation;

  AuthActivationSucces({@required this.dataActivation});
}

class InitialsetupLogSucces extends AuthState {
  final InitialSetupResponse dataInitS;
  InitialsetupLogSucces({
    this.dataInitS,
  });
}
