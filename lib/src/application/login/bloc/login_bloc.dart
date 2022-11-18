import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fourkids/src/domain/core/failures/main_failures.dart';
import 'package:fourkids/src/domain/login/model/login.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<_GetLoginData>((event, emit) {
      emit(state.copyWith(isLoading: true, successOption: none()));
    });
  }
}
