part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.getLoginData({required String phoneNumber}) =
      _GetLoginData;
}
