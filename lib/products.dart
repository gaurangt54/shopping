import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/add.dart';
import 'package:shopping/edit.dart';
import 'package:shopping/final.dart';
import 'package:shopping/product.dart';
import 'package:shopping/shop.dart';
import 'navdrawer.dart';
import 'signup.dart';
import 'package:shopping/navdrawer.dart';
import 'enter.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Shop()),
                );
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Your Products",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            if(Product.cart>0) Cart(),
            SizedBox(
              height: 20.0,
            ),
            if(Product.cart>0) RaisedButton(
              padding: EdgeInsets.fromLTRB(45, 10, 44, 10),
              color: Colors.blueGrey,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Final()),
                );
              },
              textColor: Colors.white,
              child: const Text(
                'Buy Now',
                style: TextStyle(fontSize: 22.0),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
            ),
            if(Product.cart<0) Text(
              "Go to Shop Page using + Sign",
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Cart extends StatefulWidget {

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  static var cart = Product.cart;

  @override
  Widget build(BuildContext context) {

    String c = cart.toString();
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Product()),
        );
      },
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 45.0,
              backgroundImage: AssetImage("images/product.jpg"),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              children: [
                Text(
                  "Turtle Neck (S)",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.minimize,
                        size: 20.0,
                      ),
                      onPressed: () {
                        Product.cart = Product.cart - 1;
                        cart--;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Products()),
                        );
                      },
                    ),
                    Text(
                      c,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 20.0,
                      ),
                      onPressed: () {
                        Product.cart = Product.cart + 1;
                        cart++;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Products()),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),

            SizedBox(
              width: 10.0,
            ),

            IconButton(
              icon: Icon(
                Icons.delete,
                size: 45.0,
              ),
              onPressed: () {
                Product.cart = 0;
                cart = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Products()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
