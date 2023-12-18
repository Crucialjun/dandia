import 'package:dandia/core/failure.dart';
import 'package:dandia/services/firebase_database_service/i_firebase_database_service.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseService implements IFirebaseDatabaseService {
  final db = FirebaseDatabase.instance;

  @override
  Future<Either<Failure, void>> addNewUserToDB(
      {required String uid,
      required String email,
      required String name,
      required String phone,
      required bool blockStatus}) async {
    try {
      await db.ref().child('users').child(uid).set({
        'email': email,
        'name': name,
        'phone': phone,
        'id': uid,
        "blockStatus": blockStatus,
      });
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
