part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState(
      {required bool isLoading,
      required Option<Either<MainFailures, Login>> successOption,
      required Login userLogin}) = _LoginState;

  factory LoginState.initial() => const LoginState(
      isLoading: false,
      successOption: None(),
      userLogin: Login(
        actionStatus: false,
        message: '',
        registerStatus: '',
        status: false,
        userId: 0,
        userName: '',
      ));
}
