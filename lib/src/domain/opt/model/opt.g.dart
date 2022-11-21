// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Opt _$OptFromJson(Map<String, dynamic> json) => Opt(
      status: json['status'] as bool?,
      actionStatus: json['action_status'] as bool?,
      message: json['message'] as String?,
      accessTokken: json['access_tokken'] as String?,
      userId: json['user_id'] as int?,
      userName: json['user_name'] as String?,
      userPhone: json['user_phone'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OptToJson(Opt instance) => <String, dynamic>{
      'status': instance.status,
      'action_status': instance.actionStatus,
      'message': instance.message,
      'access_tokken': instance.accessTokken,
      'user_id': instance.userId,
      'user_name': instance.userName,
      'user_phone': instance.userPhone,
      'user': instance.user,
    };
