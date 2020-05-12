import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoderProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coder Profile'),
      ),
      body: CoderProfileContent(),
    );
  }
}

class CoderProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 150,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Text('John Doe'),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    'John Doe',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Some possibly really long description/bio for the developer at hand.',
              textAlign: TextAlign.center,
            ),
          ),
          ProfileDetails(),
          SizedBox(
            height: 16,
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Share'.toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
            onPressed: _handleShareButtonPress,
          )
        ],
      ),
    ));
  }

  void _handleShareButtonPress() {
    // TODO: Implement
  }
}

class ProfileDetails extends StatelessWidget {
  final strongTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Text(
                '56',
                style: strongTextStyle,
              ),
              Text('Repos'),
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Text('132', style: strongTextStyle),
              Text('Followers'),
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Text('305', style: strongTextStyle),
              Text('Following'),
            ],
          ),
        ),
      ],
    );
  }
}
