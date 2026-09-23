import 'package:injectable/injectable.dart';
import 'package:project_11/features/Auth/Domain/entity/user_entity.dart';
import 'package:project_11/features/Auth/Domain/repo/auth_repo.dart';

@injectable
class RegisterUseCase {
  AuthRepo authRepo;
  RegisterUseCase({required this.authRepo});

  Future<UserEntity?> call({required String email, required String password}) async {
    return authRepo.register(email: email, password: password);
  }
}