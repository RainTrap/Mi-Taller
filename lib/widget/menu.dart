import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
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
              title: Text('Prueba 1'),
              leading: Icon(Icons.camera_alt),
              onTap: (){

              },
            ),
            ListTile(
              title: Text('Prueba 2'),
              leading: Icon(Icons.photo_library),
              onTap: (){

              },
            ),
          ],
        ),
      ),
    );
  }
}

