import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:javacodersnairobiflutter/all_coders/repository.dart';
import 'package:javacodersnairobiflutter/coder_profile/view.dart';

import 'model.dart';

class AllCodersView extends StatefulWidget {
  @override
  _AllCodersState createState() => _AllCodersState();
}

class _AllCodersState extends State<AllCodersView> {
  Future<List<JavaCoder>> futureCodersList;

  @override
  void initState() {
    super.initState();
    futureCodersList = getJavaCoders();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureCodersList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              ...snapshot.data
                  .map((coder) => CoderCard(coder.avatarUrl, coder.username))
                  .toList()
            ],
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
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
            avatarUrl == null
                ? CircleAvatar(
                    radius: 48,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Text(
                      '$username',
                      textAlign: TextAlign.center,
                    ),
                  )
                : CircleAvatar(
                    radius: 48,
                    backgroundImage: NetworkImage(avatarUrl),
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
