import 'package:group_chat_app_firebase/view/auth/service/auth_user.dart';

abstract class IAuthService {
  AuthUser? get currentUser;

  Future<void> initialize();

  Future<AuthUser?> logIn({
    required String email,
    required String password,
  });
  Future<AuthUser?> createUser({
    required String email,
    required String password,
  });
  Future<void> logOut();
  Future<void> sendEmailVerification();
}
