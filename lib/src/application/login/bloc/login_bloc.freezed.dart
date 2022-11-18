// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLoginData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getLoginData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLoginData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLoginData value) getLoginData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLoginData value)? getLoginData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLoginData value)? getLoginData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetLoginDataCopyWith<$Res> {
  factory _$$_GetLoginDataCopyWith(
          _$_GetLoginData value, $Res Function(_$_GetLoginData) then) =
      __$$_GetLoginDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetLoginDataCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$_GetLoginData>
    implements _$$_GetLoginDataCopyWith<$Res> {
  __$$_GetLoginDataCopyWithImpl(
      _$_GetLoginData _value, $Res Function(_$_GetLoginData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetLoginData implements _GetLoginData {
  const _$_GetLoginData();

  @override
  String toString() {
    return 'LoginEvent.getLoginData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetLoginData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getLoginData,
  }) {
    return getLoginData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getLoginData,
  }) {
    return getLoginData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getLoginData,
    required TResult orElse(),
  }) {
    if (getLoginData != null) {
      return getLoginData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetLoginData value) getLoginData,
  }) {
    return getLoginData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetLoginData value)? getLoginData,
  }) {
    return getLoginData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetLoginData value)? getLoginData,
    required TResult orElse(),
  }) {
    if (getLoginData != null) {
      return getLoginData(this);
    }
    return orElse();
  }
}

abstract class _GetLoginData implements LoginEvent {
  const factory _GetLoginData() = _$_GetLoginData;
}

/// @nodoc
mixin _$LoginState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<MainFailures, Login>> get successOption =>
      throw _privateConstructorUsedError;
  Login? get userLogin => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailures, Login>> successOption,
      Login? userLogin});

  $LoginCopyWith<$Res>? get userLogin;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? successOption = null,
    Object? userLogin = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      successOption: null == successOption
          ? _value.successOption
          : successOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailures, Login>>,
      userLogin: freezed == userLogin
          ? _value.userLogin
          : userLogin // ignore: cast_nullable_to_non_nullable
              as Login?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoginCopyWith<$Res>? get userLogin {
    if (_value.userLogin == null) {
      return null;
    }

    return $LoginCopyWith<$Res>(_value.userLogin!, (value) {
      return _then(_value.copyWith(userLogin: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$_LoginStateCopyWith(
          _$_LoginState value, $Res Function(_$_LoginState) then) =
      __$$_LoginStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<MainFailures, Login>> successOption,
      Login? userLogin});

  @override
  $LoginCopyWith<$Res>? get userLogin;
}

/// @nodoc
class __$$_LoginStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_LoginState>
    implements _$$_LoginStateCopyWith<$Res> {
  __$$_LoginStateCopyWithImpl(
      _$_LoginState _value, $Res Function(_$_LoginState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? successOption = null,
    Object? userLogin = freezed,
  }) {
    return _then(_$_LoginState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      successOption: null == successOption
          ? _value.successOption
          : successOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailures, Login>>,
      userLogin: freezed == userLogin
          ? _value.userLogin
          : userLogin // ignore: cast_nullable_to_non_nullable
              as Login?,
    ));
  }
}

/// @nodoc

class _$_LoginState implements _LoginState {
  const _$_LoginState(
      {required this.isLoading, required this.successOption, this.userLogin});

  @override
  final bool isLoading;
  @override
  final Option<Either<MainFailures, Login>> successOption;
  @override
  final Login? userLogin;

  @override
  String toString() {
    return 'LoginState(isLoading: $isLoading, successOption: $successOption, userLogin: $userLogin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.successOption, successOption) ||
                other.successOption == successOption) &&
            (identical(other.userLogin, userLogin) ||
                other.userLogin == userLogin));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, successOption, userLogin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      __$$_LoginStateCopyWithImpl<_$_LoginState>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {required final bool isLoading,
      required final Option<Either<MainFailures, Login>> successOption,
      final Login? userLogin}) = _$_LoginState;

  @override
  bool get isLoading;
  @override
  Option<Either<MainFailures, Login>> get successOption;
  @override
  Login? get userLogin;
  @override
  @JsonKey(ignore: true)
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
