import 'package:dandia/core/failure.dart';
import 'package:dandia/core/locator.dart';
import 'package:dandia/features/auth/data/data_sources/remote_data_source/i_auth_remote_data_source.dart';
import 'package:dandia/features/auth/data/repository/i_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository implements IAUthRepository {
  final _dataSOurce = locator<IAuthRemoteDataSource>();
  @override
  Future<Either<Failure, User?>> registerWIthEmailAndPassword(
      {required String email, required String password}) async {
    return await _dataSOurce.registerWIthEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<Either<Failure, void>> addNewUserToDB(
      {required String uid,
      required String email,
      required String name,
      required String phone,
      required bool blockStatus}) async {
    return await _dataSOurce.addNewUserToDB(
        uid: uid, email: email, name: name, phone: phone, blockStatus: blockStatus);
  }
}
