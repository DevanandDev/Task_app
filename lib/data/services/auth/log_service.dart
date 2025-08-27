import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;

  Future<User?> loginFireService( String email,String password)async{
    try {
     final userData = await _auth.signInWithEmailAndPassword(email: email, password: password);
     return userData.user;
    }on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? "Login Failed");
    }
  }
}