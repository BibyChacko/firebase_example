part of 'autnentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AutnenticationInitial extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticationLoading extends AuthenticationState{
  @override
  List<Object?> get props => [];

}


class AuthenticationSuccess extends AuthenticationState{
  UserCredential user;
  AuthenticationSuccess(this.user);

  @override
  List<Object?> get props => [user];

}

class AuthenticationFailure extends AuthenticationState{
  String errorMessage = "Something went wong";
  @override
  List<Object?> get props => [errorMessage];

}