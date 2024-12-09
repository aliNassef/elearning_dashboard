import '../../../domain/entity/user_entity.dart';
import '../../../domain/repo/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(LoginInitial());
  final LoginRepo _loginRepo;
  void login({required UserEntity user}) async {
    emit(LoginLoading());
    final result = await _loginRepo.login(
      user,
    );
    result.fold(
      (l) => emit(
        LoginFailure(
          errMessage: l.errMessage,
        ),
      ),
      (r) => emit(
        LoginSuccess(),
      ),
    );
  }
}
