import 'package:my_app/core/helper/use_case.dart';
import 'package:my_app/features/auth/data/models/user_model.dart';
import 'package:my_app/features/auth/domain/repositories/auth_repository_interface.dart';

class GetSaveUserUseCase implements UseCase<String?, dynamic> {
  final AuthRepositoryInterface authRepositoryInterface;

  GetSaveUserUseCase({required this.authRepositoryInterface});
  @override
  Future<String?> call({params}) async {
    return authRepositoryInterface.getVerifyAuthStatus();
  }
}
