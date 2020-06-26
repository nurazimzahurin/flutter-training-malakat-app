import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_training/services/database.dart';

class AuthService {

  final  FirebaseAuth _auth = FirebaseAuth.instance;

  //register with email/pass
  Future register(String name, String phone, String email, String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid).createInitProfile(name, phone, email, password);
      if(user != null){
        return 'success';
      }
    }catch(e){
      return e.message;
    }
  }

  //sign in
  Future signIn(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      if(user != null){
        return true;
      }
    }catch(e){
      return false;
    }
  }

  //get logged user
  Future<dynamic> currentUser() async {
    try{
      FirebaseUser user = await _auth.currentUser();
      return user.uid;
    }catch (e) {
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}