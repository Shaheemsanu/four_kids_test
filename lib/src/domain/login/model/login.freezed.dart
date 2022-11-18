// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Login _$LoginFromJson(Map<String, dynamic> json) {
  return _Login.fromJson(json);
}

/// @nodoc
mixin _$Login {
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'action_status')
  bool? get actionStatus => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_name')
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'register_status')
  String get registerStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginCopyWith<Login> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginCopyWith<$Res> {
  factory $LoginCopyWith(Login value, $Res Function(Login) then) =
      _$LoginCopyWithImpl<$Res, Login>;
  @useResult
  $Res call(
      {bool status,
      @JsonKey(name: 'action_status') bool? actionStatus,
      String message,
      @JsonKey(name: 'user_name') String userName,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'register_status') String registerStatus});
}

/// @nodoc
class _$LoginCopyWithImpl<$Res, $Val extends Login>
    implements $LoginCopyWith<$Res> {
  _$LoginCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? actionStatus = freezed,
    Object? message = null,
    Object? userName = null,
    Object? userId = null,
    Object? registerStatus = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      actionStatus: freezed == actionStatus
          ? _value.actionStatus
          : actionStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      registerStatus: null == registerStatus
          ? _value.registerStatus
          : registerStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginCopyWith<$Res> implements $LoginCopyWith<$Res> {
  factory _$$_LoginCopyWith(_$_Login value, $Res Function(_$_Login) then) =
      __$$_LoginCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool status,
      @JsonKey(name: 'action_status') bool? actionStatus,
      String message,
      @JsonKey(name: 'user_name') String userName,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'register_status') String registerStatus});
}

/// @nodoc
class __$$_LoginCopyWithImpl<$Res> extends _$LoginCopyWithImpl<$Res, _$_Login>
    implements _$$_LoginCopyWith<$Res> {
  __$$_LoginCopyWithImpl(_$_Login _value, $Res Function(_$_Login) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? actionStatus = freezed,
    Object? message = null,
    Object? userName = null,
    Object? userId = null,
    Object? registerStatus = null,
  }) {
    return _then(_$_Login(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      actionStatus: freezed == actionStatus
          ? _value.actionStatus
          : actionStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      registerStatus: null == registerStatus
          ? _value.registerStatus
          : registerStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Login implements _Login {
  const _$_Login(
      {required this.status,
      @JsonKey(name: 'action_status') required this.actionStatus,
      required this.message,
      @JsonKey(name: 'user_name') required this.userName,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'register_status') required this.registerStatus});

  factory _$_Login.fromJson(Map<String, dynamic> json) =>
      _$$_LoginFromJson(json);

  @override
  final bool status;
  @override
  @JsonKey(name: 'action_status')
  final bool? actionStatus;
  @override
  final String message;
  @override
  @JsonKey(name: 'user_name')
  final String userName;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'register_status')
  final String registerStatus;

  @override
  String toString() {
    return 'Login(status: $status, actionStatus: $actionStatus, message: $message, userName: $userName, userId: $userId, registerStatus: $registerStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Login &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.actionStatus, actionStatus) ||
                other.actionStatus == actionStatus) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.registerStatus, registerStatus) ||
                other.registerStatus == registerStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, actionStatus, message,
      userName, userId, registerStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginCopyWith<_$_Login> get copyWith =>
      __$$_LoginCopyWithImpl<_$_Login>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginToJson(
      this,
    );
  }
}

abstract class _Login implements Login {
  const factory _Login(
      {required final bool status,
      @JsonKey(name: 'action_status')
          required final bool? actionStatus,
      required final String message,
      @JsonKey(name: 'user_name')
          required final String userName,
      @JsonKey(name: 'user_id')
          required final int userId,
      @JsonKey(name: 'register_status')
          required final String registerStatus}) = _$_Login;

  factory _Login.fromJson(Map<String, dynamic> json) = _$_Login.fromJson;

  @override
  bool get status;
  @override
  @JsonKey(name: 'action_status')
  bool? get actionStatus;
  @override
  String get message;
  @override
  @JsonKey(name: 'user_name')
  String get userName;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'register_status')
  String get registerStatus;
  @override
  @JsonKey(ignore: true)
  _$$_LoginCopyWith<_$_Login> get copyWith =>
      throw _privateConstructorUsedError;
}
