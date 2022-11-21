import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';
part 'login.g.dart';

@freezed
class Login with _$Login {
  factory Login({
    bool? status,
    @JsonKey(name: 'action_status') bool? actionStatus,
    String? message,
    @JsonKey(name: 'user_name') String? userName,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'register_status') String? registerStatus,
  }) = _Login;

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
}
