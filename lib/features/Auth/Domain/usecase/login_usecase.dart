import 'package:injectable/injectable.dart';
import 'package:project_11/features/Auth/Domain/entity/user_entity.dart';
import 'package:project_11/features/Auth/Domain/repo/auth_repo.dart';

@injectable
class LoginUseCase {
  AuthRepo authRepo;

  LoginUseCase({required this.authRepo});

  Future<UserEntity?> call({
    required String email,
    required String password,
  }) async {
    return authRepo.login(email: email, password: password);
  }
}
