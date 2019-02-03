import 'package:diary_flutter/services/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  AuthPage({this.auth, this.onSignedIn});

  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => new _LoginSignUpPageState();
}

class _LoginSignUpPageState extends State<AuthPage> {
  final _formKey = new GlobalKey<FormState>();
  bool _isLoading;
  bool _isIos;
  String _errorMessage = "";

  // Check if form is valid before perform login or signup
  bool _validateAndSave() {
    /*final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;*/
    return true;
  }

  // Perform login or signup
  _validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (_validateAndSave()) {
      String userId = "";
      try {
        userId = await widget.auth.googleSignIn();
        print('Signed in: $userId');

        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null) {
          widget.onSignedIn();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          if (_isIos) {
            _errorMessage = e.details;
          } else
            _errorMessage = e.message;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        //backgroundColor: Colors.blueGrey,
        body: new Center(
            child: new Container(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
          new Material(
            elevation: 5.0,
            borderRadius: new BorderRadius.circular(30.0),
            child: new MaterialButton(
              //padding: new EdgeInsets.all(16.0),
              minWidth: 150.0,
              onPressed: _validateAndSubmit,
              child: new Text('Sign in with Google'),
              //color: Colors.lightBlueAccent,
            ),
          ),
        ]))));
  }
}
