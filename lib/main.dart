import 'package:flutter/material.dart';
import 'package:javacodersnairobiflutter/all_coders/view.dart';

const appName = 'Java Coders Nairobi';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primaryColor: Color(0xff5d6c5c),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(appName),
        ),
        body: AllCodersWidget(),
      ),
    );
  }
}
