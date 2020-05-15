import 'dart:convert';

import 'package:http/http.dart';

import 'model.dart';

Future<CoderProfile> getCoderProfile(String coderUsername) async {
  final coderProfileUrl = 'https://api.github.com/users/$coderUsername';
  final Response response = await get(coderProfileUrl);

  if (response.statusCode == 200) {
    final profileMap = jsonDecode(response.body);
    return CoderProfile(
        avatarUrl: profileMap['avatar_url'],
        bio: profileMap['bio'],
        username: profileMap['login'],
        numberOfPublicRepos: profileMap['public_repos'],
        numberOfFollowers: profileMap['followers'],
        numberOfFollowedUsers: profileMap['following'],
        htmlUrl: profileMap['html_url']);
  } else {
    throw Exception('Error fetching coder profile.');
  }
}
