import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'registro.dart';
import 'auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.auth, this.onSignedIn});

  final BaseAuth auth;

  final VoidCallback onSignedIn;

  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String _correo;
  String _contrasenia;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        String userId =
            await widget.auth.signInWithEmailAndPassword(_correo, _contrasenia);
        print('Inició sesión: $userId');
        widget.onSignedIn();
      } on PlatformException catch(e){
        String error = e.code;
        // ignore: unused_local_variable
        Map<String, String> errors = {
          "ERROR_USER_NOT_FOUND":"El correo ingresado no pertenece a un usuerio",
          "ERROR_WRONG_PASSWORD":"La contraseña es incorrecta"
        };
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("¡Oh no!"),
              content: Text(errors[error]),
            )
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(30.0, 100.0, 0.0, 0.0),
                    child: Text(
                      'Mi',
                      style: TextStyle(
                        fontSize: 70.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(30.0, 165.0, 0.0, 0.0),
                    child: Text(
                      'Taller',
                      style: TextStyle(
                        fontSize: 70.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(210.0, 165.0, 0.0, 0.0),
                    child: Text(
                      '.',
                      style: TextStyle(
                        fontSize: 70.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Correo Electronico',
                          labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                        validator: (value) =>
                            value.isEmpty ? 'Completar campo' : null,
                        onSaved: (value) => _correo = value,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: (value) =>
                            value.isEmpty ? 'Completar campo' : null,
                        onSaved: (value) => _contrasenia = value,
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: InkWell(
                          child: Text(
                            '¿Olvidó su contraseña?',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        height: 55.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(40.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 5.0,
                          child: RaisedButton(
                            onPressed: validateAndSubmit,
                            child: Center(
                              child: Text(
                                'Ingresar',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '¿No tienes cuenta?',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            SignUpPage(auth: widget.auth)));
                  },
                  child: Text(
                    'Registrar',
                    style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30.0)
          ],
        ),
      ),
    );
  }
}
