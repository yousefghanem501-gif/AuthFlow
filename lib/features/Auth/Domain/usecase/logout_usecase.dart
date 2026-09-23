import 'package:injectable/injectable.dart';
import 'package:project_11/features/Auth/Domain/repo/auth_repo.dart';

@injectable
class LogoutUseCase {
  AuthRepo authRepo;

  LogoutUseCase({required this.authRepo});

  Future<void> call() async {
    return authRepo.signOut();
  }
}