import 'package:first_app/constants.dart';
import 'package:first_app/database/database_helper.dart';
import 'package:first_app/database/models/user_model.dart';
import 'package:first_app/login_register/form_title.dart';
import 'package:flutter/material.dart';

class RegisterStyle extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterStyle> {
  //Variables helping to get and insert new user into
  //Database
  late DatabaseHelper _dbHelper;
  User _user = User();
  final _formKey = GlobalKey<FormState>();
  //Initializing
  @override
  void initState() {
    super.initState();
    setState(() {
      _dbHelper = DatabaseHelper.instance;
    });
  }

  @override
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
              FormTitle("REGISTER"),
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
                    onSaved: (val) => setState(() => _user.userName = val),
                    validator: (val) =>
                        (val!.length == 0 ? "username is required" : null),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 16),
                  child: TextFormField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Name",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black38,
                      ),
                      fillColor: minorColor,
                      filled: true,
                    ),
                    onSaved: (val) => setState(() => _user.name = val),
                    validator: (val) =>
                        (val!.length == 0 ? "name is required" : null),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 16),
                  child: TextFormField(
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black38,
                      ),
                      fillColor: minorColor,
                      filled: true,
                    ),
                    onSaved: (val) => setState(() => _user.email = val),
                    validator: (val) => ((val!.contains("@") || val.length == 0)
                        ? null
                        : "your mail is required"),
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
                      hintText: "Password",
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black38,
                      ),
                      fillColor: minorColor,
                      filled: true,
                    ),
                    onSaved: (val) => setState(() => _user.password = val),
                    validator: (val) =>
                        (val!.length == 0 ? "Password is required" : null),
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
              )
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
        await _dbHelper.insertUser(_user);
        Navigator.pushNamed(context, "login");
      });
      form.reset();
    }
  }
}
