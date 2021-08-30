import 'package:first_app/contacts/contacts.dart';
import 'package:first_app/login/login_screen.dart';
import 'package:first_app/register/register_screen.dart';
import 'package:first_app/pending_requests/pending_request.dart';
import 'package:first_app/settings/settings.dart';
import 'package:first_app/view_request/view_request.dart';
import 'package:flutter/material.dart';

import 'add_request/add_request.dart';
import 'pending_requests/pending_request.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _title = "MyApp Screen";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      initialRoute: 'login',
      routes: {
        // When navigating to the "login" route, build the LoginScreen widget.
        'login': (context) => LoginScreen(),
        // When navigating to the "register" route, build the RegisterScreen widget.
        'register': (context) => RegisterScreen(),
        //When navigating to the "pending_request", build the PendingScreen
        "pendingRequest": (context) => PendingRequest(),
        "addRequest": (context) => AddRequest(),
        "contact": (context) => ContactScreen(),
        "settings": (context) => SettingsScreen(),
      },

      /* home: Scaffold(
        //appBar: AppBar(
        //title: Text(_title),
        //),
        body: LoginStyle(),
      ), */
    );
  }
}
