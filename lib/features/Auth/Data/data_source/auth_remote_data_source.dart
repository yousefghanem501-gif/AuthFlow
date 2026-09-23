import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:project_11/features/Auth/Data/models/auth_model.dart';

@lazySingleton
class AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSource({required this.firebaseAuth});

  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return AuthModel.fromFirebaseUser(userCredential.user!);
  }

  Future<AuthModel> register({
    required String email,
    required String password,
  }) async {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return AuthModel.fromFirebaseUser(userCredential.user!);
  }

  Future<AuthModel> signOut() async {
    await firebaseAuth.signOut();
    return AuthModel();
  }

  Future<AuthModel> resetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
    return AuthModel();
  }
}
