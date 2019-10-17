import 'package:flutter/material.dart';
import 'menu.dart';
import 'auth.dart';

class HomePage extends StatelessWidget {
  HomePage({this.auth, this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      drawer:Menu(auth: auth,),
      body: new Container(
        child: new Center(
          child: new Text(
            'Bienvenido',
            style: new TextStyle(
              fontSize: 32.0
            ),
          ),
        ),
      ),
    );
  }
}