import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/edit.dart';
import 'package:shopping/products.dart';
import 'package:shopping/shop.dart';
import 'navdrawer.dart';
import 'signup.dart';
import 'package:shopping/navdrawer.dart';
import 'enter.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Shop()),
                );
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
            ),
            backgroundColor: Color(0xffBC9E79),
            title: Text("The Street Closer"),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Products()),
                  );
                },
                icon: Icon(
                  Icons.save,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: Form(
            child:Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Title",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Price",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Description",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Image URL",
                    ),
                  ),
                ),

              ],
            )
          )

        )
    );
  }
}