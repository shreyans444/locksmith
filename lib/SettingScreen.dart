import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  static String label = "Settings";
  @override
  Widget build(BuildContext context) {
    final title = 'Settings';
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Change Password'),
          ),
          ListTile(
            leading: Icon(Icons.phone_android),
            title: Text('Device ID : 276A294'),
          ),
        ],

      )





    );
  }
}

