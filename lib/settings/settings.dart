import 'package:first_app/constants.dart';
import 'package:first_app/database/database_helper.dart';
import 'package:first_app/database/models/setting_model.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController _controller = TextEditingController(
    text: "https://api.server.test",
  );
  final _formKey = GlobalKey<FormState>();
  late List<Setting> dbLink;
  late DatabaseHelper _dbHelper;
  late int index;
  @override
  void initState() {
    super.initState();
    _dbHelper = DatabaseHelper.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: TextField(
                controller: _controller,
                onChanged: (text) {
                  _controller.addListener(() {});
                },
                decoration: InputDecoration(
                  labelText: "Server Link",
                  labelStyle: TextStyle(
                    color: primaryColor.withOpacity(0.4),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 5,
                ),
                child: OutlinedButton(
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 17,
                    ),
                  ),
                  onPressed: () => _onSave(),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 5,
                ),
                child: Text(
                  _controller.text,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onSave() {
    for (int i = 0; i < dbLink.length; i++) {
      dbLink[0].link = _controller.text;
      _dbHelper.insertSetting(dbLink[0]);
    }
    setState(() {
      _controller.clear();
    });
  }
}
