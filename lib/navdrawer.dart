import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/final.dart';
import 'package:shopping/login.dart';
import 'package:shopping/products.dart';
import 'package:shopping/shop.dart';
import 'package:shopping/signup.dart';
import 'enter.dart';
import 'package:provider/provider.dart';
import './providers/auth.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: [
            DrawerHeader(
              padding: EdgeInsets.all(12.0),
              child:Column(
                children:[
                  CircleAvatar(
                    radius: 45.0,
                    backgroundImage: AssetImage("images/blue.jpg"),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    " The Street Closet",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xffBC9E79),
              ),
            ),
          ListTile(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Shop()),
              );
            },
            title: Row(
              children: [
                Icon(
                  Icons.shop,
                  size: 30.0,
                ),
                Text(
                  " Shop",
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Products()),
              );
            },
            title: Row(
              children: [
                Icon(
                    Icons.card_giftcard,
                  size: 30.0,
                ),
                Text(
                    " Orders",
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Products()),
              );
            },
            title: Row(
              children: [
                Icon(
                  Icons.create,
                  size: 30.0,
                ),
                Text(
                  " Manage Products",
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                )
              ],
            ),
          ),
          ListTile(
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<Auth>(context , listen: false).logout();
            },
            title: Row(
              children: [
                Icon(
                  Icons.file_upload,
                  size: 30.0,
                ),
                Text(
                  " Logout",
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                )
              ],
            ),
          ),


        ],
      ),
    );
  }
}