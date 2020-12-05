import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/navdrawer.dart';
import 'package:shopping/product.dart';
import 'package:shopping/products.dart';
import 'package:shopping/signup.dart';
import 'enter.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          backgroundColor: Color(0xffBC9E79),
          title: Text("The Street Closet"),
          actions: [
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Products()),
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Products()),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child:Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Top Trends",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Pro(),
                      Pro(),

                    ],
                  ),
                  Row(
                    children: [
                      Pro(),
                      Pro(),
                    ],
                  ),
                  Row(
                    children: [
                      Pro(),
                      Pro(),
                    ],
                  ),

                ],
              )),
        ),
      ),
    );
  }
}

class Pro extends StatefulWidget {
  @override
  _ProState createState() => _ProState();
}


class _ProState extends State<Pro> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Product()),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        height: 272.0,
        width: 175.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color:Colors.grey),
          image: DecorationImage(
              image: AssetImage("images/mul.jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 200.0,
            ),
            Container(
              padding: EdgeInsets.only(left:5.0, top: 5.0, bottom:5.0, right: 2.0 ),
              color: Colors.white,
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height:6.0,
                          ),
                          Text(
                            "Turtle Neck",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20.0,),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Text(
                            "Rs. 3500",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Container(
                            margin: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.favorite_border,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.shopping_cart,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}