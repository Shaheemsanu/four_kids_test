import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:fourkids/src/domain/core/failures/main_failures.dart';
import 'package:fourkids/src/domain/login/model/login.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/login/login_repo.dart';
part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo _loginRepo;
  LoginBloc(this._loginRepo) : super(LoginState.initial()) {
    on<_GetLoginData>((event, emit) async {
      emit(state.copyWith(isLoading: true, successOption: none()));
      final Either<MainFailures, Login> loginOptions =
          await _loginRepo.getLoginData(phoneNo: event.phoneNumber);

      print('loginOptions = $loginOptions');

      emit(loginOptions.fold(
          (failure) => state.copyWith(
              isLoading: false, successOption: Some(left(failure))),
          (success) => state.copyWith(
              isLoading: false, successOption: Some(right(success)))));
    });
  }
}
