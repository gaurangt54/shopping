import 'dart:ui';
import 'package:shopping/edit.dart';
import 'package:shopping/login.dart';
import 'package:shopping/product.dart';
import 'enter.dart';
import 'signup.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(30.0, 45.0, 0, 0),
                child: Text(
                  "THE STREET CLOSET",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/main.jpg"), fit: BoxFit.cover),
                ),
              )),
          Container(
              child: Container(
                color: Colors.grey,
                height: 250.0,
                width: double.infinity,
                padding: EdgeInsets.all(20.0),
                child: Column(children: [
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'WELCOME',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30.0,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Welcome to the best online fashion store Discover Latest trends and our designer collection. TheStreetCloset provides you with the best of the deals",
                    style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        padding: EdgeInsets.fromLTRB(45, 10, 45, 10),
                        color: Colors.black54,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        textColor: Colors.white,
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 22.0),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      RaisedButton(
                        padding: EdgeInsets.fromLTRB(45, 10, 44, 10),
                        color: Colors.blueGrey,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                        textColor: Colors.white,
                        child: const Text(
                          'Register',
                          style: TextStyle(fontSize: 22.0),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                      ),
                    ],
                  )
                ]),
              )),
        ],
      ),
    );
  }
}