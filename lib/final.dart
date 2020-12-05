import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/shop.dart';
import 'package:shopping/signup.dart';
import 'enter.dart';

class Final extends StatefulWidget {
  @override
  _FinalState createState() => _FinalState();
}

class _FinalState extends State<Final> {
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) => Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color(0xffBC9E79),
            padding: EdgeInsets.all(40.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Congratulations!",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 500.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/final.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 22.0,
                ),
                Text(
                  "Your Order has been placed",
                  style: TextStyle(
                  fontSize: 20.0,
                    color: Colors.white
                )
                ),
                Text(
                    "Successfully!",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white
                    )
                ),
                SizedBox(
                  height: 22.0,
                ),
                RaisedButton(
                  padding: EdgeInsets.fromLTRB(45, 10, 45, 10),
                  color: Colors.black87,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Shop()),
                    );
                  },
                  textColor: Colors.white,
                  child: const Text(
                    'Go Back to the Store',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }
}