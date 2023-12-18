import 'package:dandia/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IAUthRepository {
  Future<Either<Failure, User?>> registerWIthEmailAndPassword(
      {required String email, required String password});
  Future<Either<Failure, void>> addNewUserToDB(
      {required String uid,
      required String email,
      required String name,
      required String phone,
     required bool blockStatus});
}
