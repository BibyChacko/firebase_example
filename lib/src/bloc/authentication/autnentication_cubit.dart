import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'authentication_repository.dart';

part 'autnentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AutnenticationInitial());

  final AuthenticationRepository repo = AuthenticationRepository();
  UserCredential? loggedInUser;

  login(String email,String password) async{
    emit(AuthenticationLoading());
    try{
      UserCredential user = await repo.login(email, password);
      if(user!=null){
        loggedInUser = user;
        emit(AuthenticationSuccess(user));
      }else{
        emit(AuthenticationFailure());
        await Future.delayed(Duration(seconds: 2));
        emit(AutnenticationInitial());
      }
    }catch(ex){
      emit(AuthenticationFailure());
      await Future.delayed(Duration(seconds: 2));
      emit(AutnenticationInitial());
    }

  }



  signup(String email,String password) async{
    emit(AuthenticationLoading());
    UserCredential user = await repo.registration(email, password);
    if(user!=null){
      loggedInUser = user;
      emit(AuthenticationSuccess(user));
    }else{
      emit(AuthenticationFailure());
      await Future.delayed(Duration(seconds: 2));
      emit(AutnenticationInitial());
    }
  }

}
