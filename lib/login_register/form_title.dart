import 'package:first_app/constants.dart';
import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {
  final String _title;

  FormTitle(this._title);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Text(
        _title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
