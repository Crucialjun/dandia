import 'package:dandia/core/failure.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRemoteDataSource {
  Future registerWIthEmailAndPassword(
      {required String email, required String password});
      Future<Either<Failure, void>> addNewUserToDB(
      {required String uid,
      required String email,
      required String name,
      required String phone,
      required bool blockStatus});
}
