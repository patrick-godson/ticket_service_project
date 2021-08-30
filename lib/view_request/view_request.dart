import 'package:first_app/constants.dart';
import 'package:first_app/database/database_helper.dart';
import 'package:first_app/database/models/request_model.dart';
import 'package:first_app/view_request/technician.dart';
import 'package:flutter/material.dart';

class ViewRequestScreen extends StatelessWidget {
  ViewRequestScreen({Key? key, required this.request}) : super(key: key);
  final Request request;
  DatabaseHelper _dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("#${request.id}"),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: IconButton(
              onPressed: () {
                _dbHelper.deleteRequest(request.id as int);
                Navigator.pushNamed(context, "pendingRequest");
              },
              icon: Icon(Icons.delete),
            ),
          ),
        ],
        backgroundColor: primaryColor,
      ),
      backgroundColor: minorColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: 5,
        ),
        child: SizedBox(
          width: double.infinity,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    request.type.toString().toUpperCase(),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 120,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text(
                        "${capitalize(request.description.toString())}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 40,
                color: primaryColor.withOpacity(opacityValue),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TechnicianDropDown(),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Technician Appointed",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Technician ID: 1",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String capitalize(String s) {
    return "${s[0].toUpperCase()}${s.substring(1)}";
  }
}
