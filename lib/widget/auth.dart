import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<String> currentUser();
}

class Auth implements BaseAuth {
  Future<String> signInWithEmailAndPassword(String correo, String contrasenia) async {
    FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: correo, password: contrasenia)).user;
    return user.uid;
  }

  Future<String> createUserWithEmailAndPassword(String correo, String contrasenia) async {
    FirebaseUser user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: correo, password: contrasenia)).user;
    return user.uid;
  }

  Future<String> currentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }
}