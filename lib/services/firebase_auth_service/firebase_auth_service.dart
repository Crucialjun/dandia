import 'package:dandia/core/failure.dart';
import 'package:dandia/services/firebase_auth_service/i_firebase_auth_service.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService implements IFirebaseAuthService {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, User?>> registerWIthEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(const Failure('The password provided is too weak'));
      } else if (e.code == 'email-already-in-use') {
        return left(const Failure('The account already exists for that email'));
      }
      return left(Failure(e.message ?? 'Something went wrong'));
    }
  }
}
