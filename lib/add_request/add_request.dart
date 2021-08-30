import 'package:file_picker/file_picker.dart';
import 'package:first_app/constants.dart';
import 'package:first_app/database/database_helper.dart';
import 'package:first_app/database/models/request_model.dart';
import 'package:first_app/pending_requests/pending_request.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddRequest extends StatefulWidget {
  const AddRequest({Key? key}) : super(key: key);

  @override
  _AddRequestState createState() => _AddRequestState();
}

class _AddRequestState extends State<AddRequest> {
  Request _request = Request();
  final _formKey = GlobalKey<FormState>();
  late DatabaseHelper _dbHelper;
  int index = 1;

  @override
  void initState() {
    super.initState();
    _dbHelper = DatabaseHelper.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Add Request"),
        actions: [
          Padding(
            padding: EdgeInsets.all(1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => getFile(),
                  icon: Icon(Icons.attach_file),
                ),
                IconButton(
                  onPressed: () => _onSubmit(),
                  icon: Icon(Icons.check),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: primaryColor,
      ),
      backgroundColor: minorColor,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Level",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black38,
                    ),
                  ),
                  onSaved: (val) => setState(() => _request.level = val!),
                  validator: (val) =>
                      (val!.length == 0 ? "This field is required" : null)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Full Name",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black38,
                    ),
                  ),
                  onSaved: (val) => setState(() => _request.fullName = val!),
                  validator: (val) =>
                      (val!.length == 0 ? "This field is required" : null)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Phone",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black38,
                    ),
                  ),
                  onSaved: (val) => setState(() => _request.phone = val!),
                  validator: (val) =>
                      (val!.length < 10 ? "Phone number is required" : null)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Type",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black38,
                    ),
                  ),
                  onSaved: (val) => setState(() => _request.type = val!),
                  validator: (val) =>
                      (val!.length == 0 ? "This field is required" : null)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Description",
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black38,
                    ),
                  ),
                  onSaved: (val) => setState(() => _request.description = val!),
                  validator: (val) =>
                      (val!.length == 0 ? "This field is required" : null)),
            ),
          ],
        ),
      ),
    );
  }

  _onSubmit() async {
    var form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        DateTime now = DateTime.now();
        //_request.creationDate =
        //  "${now.day}-${now.month}-${now.year} ${now.hour}:${now.minute}:${now.second}";
        _request.creationDate = DateFormat("dd-MM-yyyy hh:mm:ss").format(now);
        _dbHelper.insertRequest(_request);
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PendingRequest()));

      form.reset();
    }
  }

  Future<void> getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      _request.file = file.path.toString();
    }
  }
}
