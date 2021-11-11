// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;

// username, reponame, branchname
Future<String> fetchReadMe(String username, String reponame, String branchname) async {
  final response = await http.get(
    Uri.encodeFull("https://raw.githubusercontent.com/${username}/${reponame}/${branchname}/README.md"),
    headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
    },
  );
  print(username);
  print(reponame);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // String readme = json.decode(response.body.toString());
    // print(json.decode(response.body));
    return response.body;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print(response.reasonPhrase);
    throw json.decode(response.body)['error']['message'];
  }
}
