import 'package:dandia/core/failure.dart';
import 'package:dandia/core/locator.dart';
import 'package:dandia/core/models/app_user_model.dart';
import 'package:dandia/core/usecase.dart';
import 'package:dandia/services/firebase_database_service/i_firebase_database_service.dart';
import 'package:dartz/dartz.dart';

class RetrieveUserUsecase
    with UseCases<Either<Failure, AppUserModel?>, String> {
  final _repository = locator<IFirebaseDatabaseService>();
  @override
  Future<Either<Failure, AppUserModel?>> call(params) async {
    return await _repository.retrieveUser(uid: params);
  }
}
