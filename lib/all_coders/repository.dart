import 'dart:convert';

import 'package:http/http.dart';

import 'model.dart';

Future<List<JavaCoder>> getJavaCoders() async {
  var codersQueryUrl =
      "https://api.github.com/search/users?q=type:User+location:Nairobi+language:JAVA";
  final response = await get(codersQueryUrl);

  if (response.statusCode == 200) {
    final coders = <JavaCoder>[];
    for (var item in jsonDecode(response.body)['items']) {
      coders.add(JavaCoder(item['login'], item['avatar_url']));
    }
    return coders;
  } else {
    throw Exception('Failed to fetch data.');
  }
}
