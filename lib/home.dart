
import 'package:flutter/material.dart';



import 'screens/remote_object.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArCore Demo'),
      ),
      body: ListView(
        children: <Widget>[






          ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RemoteObject()));
            },
            title: Text("Remote object"),
          ),

        ],
      ),
    );
  }
}
