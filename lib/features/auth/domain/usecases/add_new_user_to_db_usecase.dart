import 'package:dandia/core/failure.dart';
import 'package:dandia/core/locator.dart';
import 'package:dandia/core/models/app_user_model.dart';
import 'package:dandia/core/usecase.dart';
import 'package:dandia/features/auth/data/repository/i_auth_repository.dart';
import 'package:dandia/features/auth/domain/params/add_new_user_to_db_params.dart';
import 'package:dartz/dartz.dart';

class AddNewUserToDbUseCase
    with UseCases<Either<Failure, AppUserModel>, AddNewUserToDbParams> {
  final _repository = locator<IAUthRepository>();
  @override
  Future<Either<Failure, AppUserModel>> call(params) async {
    return await _repository.addNewUserToDB(
        uid: params.id,
        email: params.email,
        name: params.name,
        phone: params.phone,
        blockStatus: params.blockStatus);
  }
}
