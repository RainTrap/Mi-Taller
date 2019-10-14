import 'package:flutter/material.dart';
import 'package:taller_app/widget/auth.dart';
import 'widget/root_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false, home: new RootPage());
  }
}
