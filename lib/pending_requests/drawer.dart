import 'package:first_app/constants.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16.0),
                margin: EdgeInsets.only(
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: primaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 30,
                        bottom: 10,
                      ),
                      child: CircleAvatar(
                        backgroundColor: minorColor,
                        maxRadius: 40,
                        child: Icon(
                          Icons.person,
                          color: primaryColor,
                          size: 50,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        bottom: 5,
                      ),
                      child: Text(
                        "Gigabyteltd",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: minorColor,
                        ),
                      ),
                    ),
                    Text(
                      "servis@gigabyteltd.com",
                      style: TextStyle(
                        color: minorColor,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: drawerIcon(Icons.description_rounded),
                //drawerText function is below my Class
                title: drawerText('Requests'),
                onTap: () => Navigator.pushNamed(context, "pendingRequest"),
              ),
              ListTile(
                leading: drawerIcon(Icons.post_add),
                title: drawerText('Add Request'),
                onTap: () => Navigator.pushNamed(context, "addRequest"),
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              ListTile(
                leading: drawerIcon(Icons.settings_outlined),
                title: drawerText('Settings'),
                onTap: () => Navigator.pushNamed(context, "settings"),
              ),
              ListTile(
                leading: drawerIcon(Icons.contact_support_rounded),
                title: drawerText('Contact'),
                onTap: () => Navigator.pushNamed(context, "contact"),
              ),
              ListTile(
                leading: drawerIcon(Icons.logout_rounded),
                title: drawerText('Logout'),
                onTap: () => Navigator.pushNamed(context, "login"),
              ),
            ],
          ),
        ),
        VerticalDivider(
          width: 1,
          thickness: 1,
        ),
      ],
    );
  }
}

Widget drawerText(String text) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: primaryColor,
      fontSize: 17,
    ),
  );
}

Widget drawerIcon(IconData icon) {
  return Icon(
    icon,
    color: primaryColor.withOpacity(0.3),
  );
}
