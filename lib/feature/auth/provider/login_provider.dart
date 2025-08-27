import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task/data/services/auth/log_service.dart';

class LoginProvider extends ChangeNotifier{
  LoginService service =  LoginService();

  bool isload = false;
  User? user;
  
  Future<void> logiProvider(String email,String password)async{
    isload =true;
    notifyListeners();
    try {
      user = await service.loginFireService(email, password);
    } catch (e) {
      throw Exception(e.toString());
    }
    finally{
      isload=false;
      notifyListeners();
    }
  }
  
}