import 'package:injectable/injectable.dart';
import 'package:project_11/features/Auth/Domain/repo/auth_repo.dart';

@injectable
class ForgotPasswordUseCase {
  AuthRepo authRepo;

  ForgotPasswordUseCase({required this.authRepo});

  Future<void> call({required String email}) async {
    return authRepo.resetPassword(email: email);
  }
}
