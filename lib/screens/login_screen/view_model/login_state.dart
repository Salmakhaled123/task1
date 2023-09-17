part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginSuccess extends LoginState {
  final LoginModel model;

  LoginSuccess(this.model);
}
class LoginLoading extends LoginState {}
class LoginFailure extends LoginState {}
class CheckedSuccessfully extends LoginState{}
class LogoutSuccessfully extends LoginState{}
