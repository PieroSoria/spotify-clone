import 'package:my_app/features/auth/data/models/user_model.dart';

abstract class AuthRepositoryInterface {
  Future<void> authLoginEmailWithPassword({
    required UserModel userModel,
  });
  Future<void> authRegisterEmailWithPassword({
    required UserModel userModel,
  });
  Future<String?> getVerifyAuthStatus();
  
}
