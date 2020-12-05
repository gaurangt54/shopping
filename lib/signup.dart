import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/login.dart';
import 'package:shopping/models/http_exception.dart';
import 'package:shopping/providers/auth.dart';
import 'package:shopping/shop.dart';
import 'enter.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  final _passwordController = TextEditingController();


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
    if(!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    try {
      await Provider.of<Auth>(context , listen: false).signup(
        _authData['email'],
        _authData['password'],
      );

    } on HttpException catch(error) {
      var errorMessage = 'Authentication failed';
      if(error.toString().contains('EMAIL_EXISTS')) {
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
    catch(error) {
      print('Could not sign up');
      _showErrorDialog('Please try again later');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<Auth>(
      builder: (ctx , auth , _) =>  Builder(
          builder: (context) => Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/sign.png"),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Container(
                        margin: EdgeInsets.all(20.0),
                        padding: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Colors.white54
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(12.0),

                                child: TextFormField(
                                  keyboardType:  TextInputType.emailAddress,
                                  validator: (val) {
                                    if(val.isEmpty || !val.contains('@')) {
                                      return 'Invalid email!';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    _authData['email'] = val;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Email ID",
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(12.0),
                                child: TextFormField(
                                  obscureText: true,
                                  controller: _passwordController,
                                  validator: (val) {
                                    if(val.isEmpty || val.length <5) {
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
                              Container(
                                margin: EdgeInsets.all(12.0),
                                child: TextFormField(
                                  obscureText: true,
                                  validator: (val) {
                                    if(val != _passwordController.text) {
                                      return 'Passwords do not match';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Confirm Password",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0 ,
                              ),
                              RaisedButton(
                                padding: EdgeInsets.fromLTRB(45, 10, 45, 10),
                                color: Color(0xffBC9E79),
                                onPressed: () {
                                  _submit().then((_) => {
                                    auth.isAuth ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Shop()),
                                    ) : null,
                                  });
                                },
                                textColor: Colors.white,
                                child: const Text(
                                  'SignUp',
                                  style: TextStyle(fontSize: 25.0),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                              ),

                            ],
                          ),
                        )
                    ),
                    SizedBox(
                      height: 80.0,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login()),
                        );
                      },
                      child: Text(
                        "Already have an account? Login",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
        ),
    );

  }
}