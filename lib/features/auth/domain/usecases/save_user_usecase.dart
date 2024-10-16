import 'package:my_app/core/helper/use_case.dart';
import 'package:my_app/features/auth/data/models/user_model.dart';
import 'package:my_app/features/auth/domain/entities/user_entity.dart';

class SaveUserUsecase implements UseCase<void, UserModel> {
  @override
  Future<void> call({UserModel? params}) {
    // TODO: implement call
    throw UnimplementedError();
  }

}
