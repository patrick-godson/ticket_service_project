import 'dart:async';

import 'package:first_app/constants.dart';
import 'package:first_app/database/models/user_model.dart';
import 'package:first_app/login_register/form_title.dart';
import 'package:flutter/material.dart';
import 'package:first_app/database/database_helper.dart';

class LoginStyle extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginStyle> {
  late String _username;
  late String _password;
  List<User> _users = [];
  late DatabaseHelper _dbHelper;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _dbHelper = DatabaseHelper.instance;
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              FormTitle("HOME"),
            ],
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 16),
                  child: TextFormField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: "User Name",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black38,
                      ),
                      fillColor: minorColor,
                      filled: true,
                    ),
                    onSaved: (val) => setState(() => _username = val!),
                    validator: (val) =>
                        (val!.length == 0 ? "User Name is required" : null),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 16),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: "password",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black38,
                      ),
                      fillColor: minorColor,
                      filled: true,
                    ),
                    onSaved: (val) => setState(() => _password = val!),
                    validator: (val) =>
                        (val!.length == 0 ? "password is required" : null),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: primaryColor,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    onPressed: () => _onSubmit(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _onSubmit() async {
    var form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() async {
        _users = await _dbHelper.fetchUsers();
        var checker = false;
        for (int i = 0; i < _users.length; i++) {
          if (_users[i].userName == _username) {
            if (_users[i].password == _password) checker = true;
          }
        }
        if (checker) Navigator.pushNamed(context, "pendingRequest");
      });
      form.reset();
    }
  }
}
