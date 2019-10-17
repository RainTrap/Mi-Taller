import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
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
          ],
        ),
      ),
    );
  }
}

