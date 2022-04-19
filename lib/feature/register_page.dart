import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Register Page"),
        ),
        body: Column(children: [
          // _usernameField(),
          // _passwordField(),
          // _loginButton(context),
          // _registerButton(context),
        ]),
      ),
    );
  }

}