import 'package:elearning_dashboard/features/login/data/model/user_model.dart';
import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/firebase_auth_service.dart';

class LoginSource {
  final FirebaseAuthService authService;

  LoginSource({required this.authService});
  Future<UserModel> login() async {
    try {
      final data =
          await authService.signInWithEmailAndPassword(email: '', password: '');
      final user = UserModel(email: '', id: data.uid);
      return user;
    } on CustomException catch (e) {
      throw ServerException(
        ErrorModel(
          errorMessage: e.errorMessage,
        ),
      );
    }
  }
}
