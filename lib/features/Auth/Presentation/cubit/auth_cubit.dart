import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_11/features/Auth/Domain/usecase/forgot_password_usecase.dart';
import 'package:project_11/features/Auth/Domain/usecase/login_usecase.dart';
import 'package:project_11/features/Auth/Domain/usecase/logout_usecase.dart';
import 'package:project_11/features/Auth/Domain/usecase/register_usecase.dart';

import 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  LoginUseCase loginUseCase;
  RegisterUseCase registerUseCase;
  LogoutUseCase logoutUseCase;
  ForgotPasswordUseCase forgotPasswordUseCase;

  AuthCubit({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
    required this.forgotPasswordUseCase,
  }) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await loginUseCase.call(email: email, password: password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthError(_mapError(e)));
    }
  }

  Future<void> register(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await registerUseCase.call(email: email, password: password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthError(_mapError(e)));
    }
  }

  Future<void> resetPassword(String email) async {
    emit(AuthLoading());
    try {
      await forgotPasswordUseCase.call(email: email);
      emit(AuthResetSuccess());
    } catch (e) {
      emit(AuthError(_mapError(e)));
    }
  }

  Future<void> logout() async {
    await logoutUseCase.call();
    emit(AuthInitial());
  }

  String _mapError(dynamic error) {
    final text = error.toString();

    if (text.contains('user-not-found')) {
      return 'لا يوجد حساب مرتبط بهذا الإيميل';
    } else if (text.contains('wrong-password')) {
      return 'كلمة المرور غير صحيحة';
    } else if (text.contains('invalid-credential') ||
        text.contains('invalid-email')) {
      return 'الإيميل أو كلمة المرور غير صحيحة';
    } else if (text.contains('email-already-in-use')) {
      return 'هذا الإيميل مستخدم بالفعل';
    } else if (text.contains('weak-password')) {
      return 'كلمة المرور ضعيفة جداً';
    } else if (text.contains('network-request-failed')) {
      return 'تحقق من اتصالك بالإنترنت';
    }
    return 'حدث خطأ ما، حاول مرة أخرى';
  }
}
