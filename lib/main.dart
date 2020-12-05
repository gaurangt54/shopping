import 'dart:ui';
import 'package:shopping/edit.dart';
import 'package:shopping/product.dart';
import 'page1.dart';
import 'enter.dart';
import 'signup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/auth.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Auth(),),
      ],
      child: MaterialApp(
        home: Page2(),
      ),
    );

  }
}

void main() {
  runApp(Page1());
}
