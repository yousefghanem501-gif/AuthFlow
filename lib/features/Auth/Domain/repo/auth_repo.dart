import 'package:project_11/features/Auth/Domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<UserEntity?> login({required String email, required String password});

  Future<UserEntity?> register({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<void> resetPassword({required String email});
}
