import 'dart:ui';

import 'package:first_app/constants.dart';
import 'package:flutter/material.dart';

class TechnicianDropDown extends StatefulWidget {
  const TechnicianDropDown({Key? key}) : super(key: key);

  @override
  _TechnicianDropDownState createState() => _TechnicianDropDownState();
}

class _TechnicianDropDownState extends State<TechnicianDropDown> {
  String dropdownValue = 'Technician';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(
        Icons.arrow_drop_down_rounded,
        size: 35,
        color: minorColor,
      ),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>["Technician", 'John', 'Mehmet', 'Yan', 'Ali']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
