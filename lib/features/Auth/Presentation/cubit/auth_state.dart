import 'package:project_11/features/Auth/Domain/entity/user_entity.dart';

abstract class AuthState {
  String get message => "";
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  UserEntity? userEntity;

  AuthSuccess(this.userEntity);
}

class AuthError extends AuthState {
  String? errorMessage;

  AuthError(this.errorMessage);
}

class AuthResetSuccess extends AuthState {}
