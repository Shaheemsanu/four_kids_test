import 'package:freezed_annotation/freezed_annotation.dart';
part 'login.freezed.dart';
part 'login.g.dart';

@freezed
class Login with _$Login {
  const factory Login(
          {required bool status,
          @JsonKey(name: 'action_status') required bool? actionStatus,
          required String message,
          @JsonKey(name: 'user_name') required String userName,
          @JsonKey(name: 'user_id') required int userId,
          @JsonKey(name: 'register_status') required String registerStatus}) =
      _Login;

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
}
