import 'package:flutter/material.dart';
import 'auth.dart';

class HomePage extends StatelessWidget {
  HomePage({this.auth, this.onSignedOut});

  final BaseAuth auth;

  final VoidCallback onSignedOut;

  void _signOut() async {
    try {
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Bienvenido'),
        actions: <Widget>[
          new FlatButton(
            child: new Text(
                'Cerrar Sesión',
                style: new TextStyle(fontSize: 17.0, color: Colors.white),
            ),
            onPressed: _signOut,
          ),
        ],
      ),
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