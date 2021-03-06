import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/shop.dart';
import 'package:shopping/signup.dart';
import 'enter.dart';
import 'package:shopping/models/http_exception.dart';
import 'signup.dart';
import 'package:provider/provider.dart';
import 'package:shopping/providers/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  void _showErrorDialog(String message) {
    showDialog(context: context , builder: (ctx) => AlertDialog(title: Text('An error occurred'),
      content: Text(message),
      actions: [
        FlatButton(
          child: Text('Okay'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),);
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    try {
      await Provider.of<Auth>(context, listen: false).signin(
        _authData['email'],
        _authData['password'],
      );
    }

    on HttpException catch(error) {
      var errorMessage = 'Authentication failed';
      if(error.toString().contains('USER_NOT_FOUND')) {
        errorMessage = "Email already in use.";
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'User with this email does not exist';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Password is incorrect';
      }
      _showErrorDialog(errorMessage);
    }

    catch (error) {
      print('Could not signin');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<Auth>(
      builder: (ctx, auth, _) => Builder(
        builder: (context) => Scaffold(
            body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/sign.png"), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white54),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(12.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (val.isEmpty || !val.contains('@')) {
                                return 'Invalid email!';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              _authData['email'] = val;
                            },
                            decoration: InputDecoration(
                              labelText: "Username",
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(12.0),
                          child: TextFormField(
                            obscureText: true,
                            validator: (val) {
                              if (val.isEmpty || val.length < 5) {
                                return 'Password is too short';
                              }
                              return null;
                            },
                            onSaved: (val) {
                              _authData['password'] = val;
                            },
                            decoration: InputDecoration(
                              labelText: "Password",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(45, 10, 45, 10),
                          color: Color(0xffBC9E79),
                          onPressed: () {
                            _submit().then((_) => {
                                  auth.isAuth
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Shop()),
                                        )
                                      : null,
                                });
                          },
                          textColor: Colors.white,
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 25.0),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 100.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: Text(
                  "Dont have an account? Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
