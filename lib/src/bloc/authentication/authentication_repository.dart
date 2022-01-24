

import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository{

  login(String email,String password) async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }catch(ex){
      print(ex);
      return null;
    }
  }

  registration(String email,String password) async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }catch(ex){
      print(ex);
      return null;
    }
  }

}