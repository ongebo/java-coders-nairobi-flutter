import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:javacodersnairobiflutter/coder_profile/model.dart';
import 'package:javacodersnairobiflutter/coder_profile/repository.dart';
import 'package:share/share.dart';

class CoderProfileView extends StatelessWidget {
  final String _coderUsername;

  CoderProfileView(this._coderUsername);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coder Profile'),
      ),
      body: CoderProfileContent(_coderUsername),
    );
  }
}

class CoderProfileContent extends StatelessWidget {
  final String _coderUsername;

  const CoderProfileContent(this._coderUsername);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: const EdgeInsets.all(16),
      child: FutureBuilder(
        future: getCoderProfile(_coderUsername),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final CoderProfile coderProfile = snapshot.data;
            return Column(
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 150,
                        backgroundImage: NetworkImage(coderProfile.avatarUrl),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          coderProfile.username,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    coderProfile.bio ?? '',
                    textAlign: TextAlign.center,
                  ),
                ),
                ProfileDetails(coderProfile),
                SizedBox(
                  height: 16,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  color: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Share'.toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Share.share(
                        'Check out this awesome developer @${coderProfile.username}, ${coderProfile.htmlUrl}.');
                  },
                )
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
      ),
    ));
  }
}

class ProfileDetails extends StatelessWidget {
  final strongTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  final CoderProfile _coderProfile;

  ProfileDetails(this._coderProfile);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Text(
                '${_coderProfile.numberOfPublicRepos}',
                style: strongTextStyle,
              ),
              Text('Repos'),
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Text('${_coderProfile.numberOfFollowers}',
                  style: strongTextStyle),
              Text('Followers'),
            ],
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Text('${_coderProfile.numberOfFollowedUsers}',
                  style: strongTextStyle),
              Text('Following'),
            ],
          ),
        ),
      ],
    );
  }
}
