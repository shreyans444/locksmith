import 'package:flutter/material.dart';

class Doorlock extends StatelessWidget {
  static String label = "Toggle Lock";
  @override
  Widget build(BuildContext context) {

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme
          .of(context)
          .primaryColor;

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

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

    void pressBtn(StatelessWidget widget) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => widget));
    }
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildRaisedButton(Icons.lock, 'LOCK' , () => print('Door Locked')),
          buildRaisedButton(Icons.lock_open, 'UNLOCK', () => print('Door Unlocked')),
        ],
      ),
    );


    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: Center(
        child:
          buttonSection,

      ),
    );
  }
}