import 'package:flutter/material.dart';
import 'auth.dart';

class Menu extends StatelessWidget {
  Menu({this.auth, this.onSignedOut});

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
    return Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Exequiel Wiedermann'),
              accountEmail: Text('cachetes@gmail.com'),
              currentAccountPicture:  CircleAvatar(
                backgroundColor: Colors.green,
                child: Text('E', style: TextStyle(fontSize: 40.0),),
              ),
            ),
            ListTile(
              title: Text('Mis Trabajos'),
              leading: Icon(Icons.work),
              onTap: (){

              },
            ),
            ListTile(
              title: Text('Calendario'),
              leading: Icon(Icons.calendar_today),
              onTap: (){
              },
            ),
            ListTile(
              title: Text('Configuracion'),
              leading: Icon(Icons.settings),
              onTap: (){
              },
            ),
            ListTile(
              title: Text('Cerrar sesión'),
              leading: Icon(Icons.exit_to_app),
              onTap: _signOut(),
            ),
          ],
        ),
      );
  }
}

