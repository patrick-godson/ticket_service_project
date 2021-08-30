import 'dart:async';
import 'dart:ui';
import 'package:first_app/constants.dart';
import 'package:first_app/login/login.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 50,
              bottom: 50,
              left: 320,
            ),
            child: InkWell(
              child: Text(
                "Register",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, 'register');
              },
            ),
          ),
          Center(
            child: Container(
              width: 380,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 25,
                    //spreadRadius: 20,
                  ),
                ],
              ),
              child: LoginStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
