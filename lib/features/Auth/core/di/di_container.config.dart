// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../Data/data_source/auth_remote_data_source.dart' as _i490;
import '../../Data/models/auth_model.dart' as _i33;
import '../../Data/repo/auth_repo_impl.dart' as _i636;
import '../../Domain/repo/auth_repo.dart' as _i613;
import '../../Domain/usecase/forgot_password_usecase.dart' as _i487;
import '../../Domain/usecase/login_usecase.dart' as _i442;
import '../../Domain/usecase/logout_usecase.dart' as _i314;
import '../../Domain/usecase/register_usecase.dart' as _i167;
import '../../Presentation/cubit/auth_cubit.dart' as _i604;
import 'app_module.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.lazySingleton<_i59.FirebaseAuth>(() => appModule.firebaseAuth);
    gh.factory<_i33.AuthModel>(
      () => _i33.AuthModel(
        email: gh<String>(),
        uid: gh<String>(),
        name: gh<String>(),
      ),
    );
    gh.lazySingleton<_i490.AuthRemoteDataSource>(
      () => _i490.AuthRemoteDataSource(firebaseAuth: gh<_i59.FirebaseAuth>()),
    );
    gh.lazySingleton<_i613.AuthRepo>(
      () => _i636.AuthRepoImpl(
        authRemoteDataSource: gh<_i490.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i487.ForgotPasswordUseCase>(
      () => _i487.ForgotPasswordUseCase(authRepo: gh<_i613.AuthRepo>()),
    );
    gh.factory<_i442.LoginUseCase>(
      () => _i442.LoginUseCase(authRepo: gh<_i613.AuthRepo>()),
    );
    gh.factory<_i314.LogoutUseCase>(
      () => _i314.LogoutUseCase(authRepo: gh<_i613.AuthRepo>()),
    );
    gh.factory<_i167.RegisterUseCase>(
      () => _i167.RegisterUseCase(authRepo: gh<_i613.AuthRepo>()),
    );
    gh.factory<_i604.AuthCubit>(
      () => _i604.AuthCubit(
        loginUseCase: gh<_i442.LoginUseCase>(),
        registerUseCase: gh<_i167.RegisterUseCase>(),
        logoutUseCase: gh<_i314.LogoutUseCase>(),
        forgotPasswordUseCase: gh<_i487.ForgotPasswordUseCase>(),
      ),
    );
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}
