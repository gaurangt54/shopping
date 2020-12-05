import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/final.dart';
import 'package:shopping/products.dart';
import 'package:shopping/shop.dart';
import 'package:shopping/signup.dart';
import 'enter.dart';

class Product extends StatefulWidget {

  static var cart = 0;

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {



  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.topLeft,
              height: 400.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/product.jpg"), fit: BoxFit.cover),
              ),
              margin: EdgeInsets.only(top: 24.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Shop()),
                      );
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  SizedBox(
                    width: 250.0,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Product()),
                      );
                    },
                    icon: Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: () {
                      Product.cart = Product.cart + 1 ;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Product()),
                      );
                    },
                    icon: Icon(Icons.add_shopping_cart),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Turtle Neck",
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        Text(
                          "Price:",
                          style: TextStyle(
                              fontSize: 27.0, ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Rs. 3500",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 25.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        Text(
                          "Size: ",
                          style: TextStyle(
                              fontSize: 27.0, ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Only S is Available",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 25.0,
                          ),
                        ),
                        /*
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "M",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 25.0,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "L",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 25.0,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "XL",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 25.0,
                          ),
                        ),
                        */

                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: [
                        Text(
                          "Product Description:",
                          style: TextStyle(
                              fontSize: 25.0, ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      children: [
                        Text(
                          "Product Description",
                          style: TextStyle(
                            fontSize: 19.0,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Product Description",
                          style: TextStyle(
                            fontSize: 19.0,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Product Description",
                          style: TextStyle(
                            fontSize: 19.0,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Product Description",
                          style: TextStyle(
                            fontSize: 19.0,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(45, 10, 45, 10),
                      color: Colors.black87,
                      onPressed: () {
                        Product.cart = Product.cart + 1 ;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Products()),
                        );
                      },
                      textColor: Colors.white,
                      child: const Text(
                        'Buy Now',
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
          ],
        ),
      ),
    );
  }
}
