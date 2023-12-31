import 'package:dandia/core/failure.dart';
import 'package:dandia/core/locator.dart';
import 'package:dandia/core/usecase.dart';
import 'package:dandia/features/auth/data/repository/i_auth_repository.dart';
import 'package:dartz/dartz.dart';

class LogOutUsecase with UseCases<Either<Failure, void>, NoParams> {
  final _repository = locator<IAUthRepository>();
  @override
  Future<Either<Failure, void>> call(params) async {
    return await _repository.logout();
  }
}
