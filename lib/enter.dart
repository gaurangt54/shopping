import 'dart:ui';
import 'login.dart';
import 'signup.dart';
import 'package:flutter/material.dart';

class Enter extends StatefulWidget {
  @override
  _EnterState createState() => _EnterState();
}

class _EnterState extends State<Enter> {
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) => Scaffold(
              body: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25.0,
                        ),
                        SizedBox(
                          height: 450.0,
                          child: Center(
                              child: Text(
                            "THE STREET CLOSET",
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 100.0,
                            ),
                            RaisedButton(
                              padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                              color: Colors.black,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()),
                                );
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
                            SizedBox(
                              height: 20.0,
                            ),
                            RaisedButton(
                              padding: EdgeInsets.fromLTRB(45, 10, 45, 10),
                              color: Colors.grey,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()),
                                );
                              },
                              textColor: Colors.white,
                              child: const Text(
                                'Signup',
                                style: TextStyle(fontSize: 25.0),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/mul.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
              ),
            );
  }
}
