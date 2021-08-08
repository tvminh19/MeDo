import 'package:flutter/material.dart';
import 'package:medo/services/auth.dart';
import 'package:medo/shared/constants.dart';
import 'package:medo/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
        backgroundColor: Colors.greenAccent[100],
        appBar: AppBar(
          backgroundColor: Colors.blueAccent[100],
          elevation: 0.0,
          title: Text('Sign up to MeDo'),
          actions: <Widget>[
            TextButton.icon(
              style: TextButton.styleFrom(primary: Colors.black),
              icon: Icon(Icons.person),
              label: Text('Sign In'),
              onPressed: () {
                widget.toggleView();
              },
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                    validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration:
                        textInputDecoration.copyWith(hintText: 'Password'),
                    validator: (val) => val!.length < 8
                        ? 'Enter a password 8+ characters long'
                        : null,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.pink[500]),
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() => loading = true);
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() {
                            error = 'Please supply a valid email!';
                            loading = false;
                          });
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(error,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14.0,
                      )),
                ],
              )),
        ));
  }
}
