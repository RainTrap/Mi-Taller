import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<String> currentUser();
  Future<void> signOut();
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signInWithEmailAndPassword(String correo, String contrasenia) async {
    FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(email: correo, password: contrasenia)).user;
    return user.uid;
  }

  Future<String> createUserWithEmailAndPassword(String correo, String contrasenia) async {
    FirebaseUser user = (await _firebaseAuth.createUserWithEmailAndPassword(email: correo, password: contrasenia)).user;
    return user.uid;
  }

  Future<String> currentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.uid;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();

  }
}