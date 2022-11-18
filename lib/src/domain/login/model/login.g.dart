// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Login _$$_LoginFromJson(Map<String, dynamic> json) => _$_Login(
      status: json['status'] as bool,
      actionStatus: json['action_status'] as bool?,
      message: json['message'] as String,
      userName: json['user_name'] as String,
      userId: json['user_id'] as int,
      registerStatus: json['register_status'] as String,
    );

Map<String, dynamic> _$$_LoginToJson(_$_Login instance) => <String, dynamic>{
      'status': instance.status,
      'action_status': instance.actionStatus,
      'message': instance.message,
      'user_name': instance.userName,
      'user_id': instance.userId,
      'register_status': instance.registerStatus,
    };
