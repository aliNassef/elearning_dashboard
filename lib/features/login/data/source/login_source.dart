 import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/errors/error_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/firebase_auth_service.dart';

class LoginSource {
  final FirebaseAuthService authService;

  LoginSource({required this.authService});
  Future<User> login({required String email, required String password}) async {
    try {
      final data = await authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return data;
    } on CustomException catch (e) {
      throw ServerException(
        ErrorModel(
          errorMessage: e.errorMessage,
        ),
      );
    }
  }
}
