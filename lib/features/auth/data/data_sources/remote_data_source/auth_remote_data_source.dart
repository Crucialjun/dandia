import 'package:dandia/core/failure.dart';
import 'package:dandia/core/locator.dart';
import 'package:dandia/features/auth/data/data_sources/remote_data_source/i_auth_remote_data_source.dart';
import 'package:dandia/services/firebase_auth_service/i_firebase_auth_service.dart';
import 'package:dandia/services/firebase_database_service/i_firebase_database_service.dart';
import 'package:dartz/dartz.dart';

class AuthRemoteDataSource implements IAuthRemoteDataSource {
  final _firebaseAuthService = locator<IFirebaseAuthService>();
  final _firebaseDbService = locator<IFirebaseDatabaseService>();
  @override
  Future registerWIthEmailAndPassword(
      {required String email, required String password}) async {
    return await _firebaseAuthService.registerWIthEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<Either<Failure, void>> addNewUserToDB(
      {required String uid,
      required String email,
      required String name,
      required String phone,
      required bool blockStatus}) async {
    return await _firebaseDbService.addNewUserToDB(
        uid: uid, email: email, name: name, phone: phone, blockStatus: blockStatus);
  }
}
