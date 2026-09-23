import 'package:injectable/injectable.dart';
import 'package:project_11/features/Auth/Data/data_source/auth_remote_data_source.dart';
import 'package:project_11/features/Auth/Domain/entity/user_entity.dart';
import 'package:project_11/features/Auth/Domain/repo/auth_repo.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<UserEntity?> login({
    required String email,
    required String password,
  }) async {
    final userCredential = await authRemoteDataSource.login(
      email: email,
      password: password,
    );
    return userCredential.toUserEntity();
  }

  @override
  Future<UserEntity?> register({
    required String email,
    required String password,
  }) async {
    final userCredential = await authRemoteDataSource.register(
      email: email,
      password: password,
    );
    return userCredential.toUserEntity();
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await authRemoteDataSource.resetPassword(email: email);
  }

  @override
  Future<void> signOut() {
    return authRemoteDataSource.signOut();
  }
}
