import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'opt.g.dart';

@JsonSerializable()
class Opt {
  bool? status;
  @JsonKey(name: 'action_status')
  bool? actionStatus;
  String? message;
  @JsonKey(name: 'access_tokken')
  String? accessTokken;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'user_name')
  String? userName;
  @JsonKey(name: 'user_phone')
  String? userPhone;
  User? user;

  Opt({
    this.status,
    this.actionStatus,
    this.message,
    this.accessTokken,
    this.userId,
    this.userName,
    this.userPhone,
    this.user,
  });

  @override
  String toString() {
    return 'Opt(status: $status, actionStatus: $actionStatus, message: $message, accessTokken: $accessTokken, userId: $userId, userName: $userName, userPhone: $userPhone, user: $user)';
  }

  factory Opt.fromJson(Map<String, dynamic> json) => _$OptFromJson(json);

  Map<String, dynamic> toJson() => _$OptToJson(this);

  Opt copyWith({
    bool? status,
    bool? actionStatus,
    String? message,
    String? accessTokken,
    int? userId,
    String? userName,
    String? userPhone,
    User? user,
  }) {
    return Opt(
      status: status ?? this.status,
      actionStatus: actionStatus ?? this.actionStatus,
      message: message ?? this.message,
      accessTokken: accessTokken ?? this.accessTokken,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userPhone: userPhone ?? this.userPhone,
      user: user ?? this.user,
    );
  }
}
