import 'package:flutter/material.dart';
import 'package:javacodersnairobiflutter/view/coder_profile_view.dart';

class AllCodersWidget extends StatefulWidget {
  @override
  _AllCodersState createState() => _AllCodersState();
}

class _AllCodersState extends State<AllCodersWidget> {
  final _dummyCoders = <JavaCoder>[
    const JavaCoder("John Doe", null),
    const JavaCoder("Jane Doe", null),
    const JavaCoder("Jon Snow", null),
    const JavaCoder("Anastasia Steele", null),
    const JavaCoder("Thor of Odin", null),
    const JavaCoder("Thanos", null),
    const JavaCoder("Thanos", null),
    const JavaCoder("Thanos", null),
    const JavaCoder("Thanos", null),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: <Widget>[
        ..._dummyCoders
            .map((coder) => CoderCard(coder.avatarUrl, coder.username))
      ],
    );
  }
}

class JavaCoder {
  final String username;
  final String avatarUrl;

  const JavaCoder(this.username, this.avatarUrl);
}

class CoderCard extends StatelessWidget {
  final String avatarUrl;
  final String username;

  const CoderCard(this.avatarUrl, this.username);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => _handleCardTap(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 48,
              backgroundColor: Theme.of(context).primaryColor,
              child: Text(
                '$username',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Text(
                username,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleCardTap(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (context) => CoderProfileView()));
  }
}
