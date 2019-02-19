import 'package:flutter/material.dart';
import 'Doorlock.dart';
import 'SettingScreen.dart';
import 'LiveStream.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Welcome to ring App',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Bringing your doorbell to your phone',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label){
      Color color = Theme.of(context).primaryColor;

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children:[

          Icon(icon, color: color),

          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );


    }

    RaisedButton buildRaisedButton(IconData icon, String label, Function func) {
      return RaisedButton(
          child:
          buildButtonColumn(icon, label ),
          onPressed: () {
            func();
          }
      );
    }

    void pressBtn(Widget widget) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => widget));
    }
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildRaisedButton(Icons.videocam, LiveStream.label , () => pressBtn(LiveStream())),
          buildRaisedButton(Icons.lock_open, Doorlock.label, () => pressBtn(Doorlock())),
          buildRaisedButton(Icons.settings, SettingScreen.label, () => pressBtn(SettingScreen())),
        ],
      ),
    );

    return MaterialApp(
      title: 'Ring App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ring - Test Mode'),
        ),
        body: ListView(
          children: [
            titleSection,
            buttonSection,
          ],
        ),
      ),
    );
  }
}