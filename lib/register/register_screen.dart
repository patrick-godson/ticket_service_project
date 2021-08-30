

import 'package:first_app/constants.dart';
import 'package:first_app/register/register.dart';
import "package:flutter/material.dart";

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
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
                  "Login",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  // Navigate back to the first screen by popping the current route
                  // off the stack.
                  Navigator.pop(context);
                },
              ),
            ),
            Center(
              child: Container(
                width: 380,
                height: 600,
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
                child: RegisterStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
