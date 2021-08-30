import 'dart:async';

import 'package:first_app/add_request/add_request.dart';
import 'package:first_app/constants.dart';
import 'package:first_app/database/database_helper.dart';
import 'package:first_app/database/models/request_model.dart';
import 'package:first_app/pending_requests/drawer.dart';
import 'package:first_app/view_request/view_request.dart';
import 'package:flutter/material.dart';

class PendingRequest extends StatefulWidget {
  @override
  _PendingRequestState createState() => _PendingRequestState();
}

class _PendingRequestState extends State<PendingRequest> {
  late DatabaseHelper _dbHelper;
  late Future<List<Request>> _requests;

  @override
  void initState() {
    super.initState();
    _dbHelper = DatabaseHelper.instance;
    _refreshRequestList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: minorColor,
      appBar: AppBar(
        title: Text("Pending Requests"),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 18,
            ),
            child: Row(
              children: [
                Icon(Icons.arrow_drop_down_rounded),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.search),
                ),
                Icon(Icons.notifications),
              ],
            ),
          ),
        ],
        backgroundColor: primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        foregroundColor: minorColor,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddRequest()),
          ).then(onGoBack);
        },
        child: Icon(Icons.add),
      ),
      drawer: DrawerScreen(),
      body: FutureBuilder<List<Request>>(
        future: _dbHelper.fetchRequests(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Request _request = snapshot.data![index];
                return InkWell(
                  hoverColor: primaryColor,
                  highlightColor: primaryColor.withOpacity(0.2),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewRequestScreen(
                          request: _request,
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: double.infinity,
                    height: 110,
                    child: Card(
                      elevation: 5,
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              child: Icon(
                                Icons.crop_square_outlined,
                                size: 30,
                                color: primaryColor.withOpacity(opacityValue),
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 5,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: 0,
                                        ),
                                        child: Text(
                                          "#${_request.id}",
                                          style: TextStyle(
                                            color: primaryColor
                                                .withOpacity(opacityValue),
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "${_request.creationDate}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 8,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _request.type.toString().toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Icon(
                                        Icons.check_circle_outline,
                                        size: 30,
                                        color: checkedColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.only(
                                top: 5,
                              ),
                              child: Text(
                                "${capitalize(_request.fullName.toString())} - ${capitalize(_request.level.toString())} - Techniker Atandı",
                                style: TextStyle(
                                  color: primaryColor.withOpacity(opacityValue),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            dense: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text("Loading..."),
            );
          }
        },
      ),
    );
  }

  _refreshRequestList() {
    _requests = _dbHelper.fetchRequests();
    setState(() {});
  }

  FutureOr onGoBack(dynamic value) {
    _refreshRequestList();
    setState(() {});
  }

  String capitalize(String s) {
    return "${s[0].toUpperCase()}${s.substring(1)}";
  }
}
