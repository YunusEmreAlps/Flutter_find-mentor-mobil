import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:find_mentor/enums.dart';
import 'package:find_mentor/model/person.dart';
import 'package:find_mentor/util/app_constant.dart';

// Fetch our Mentees from API
Future<List<Person>> fetchMentees() async {
  final response = await http.get(
    Uri.encodeFull(AppConstant.apiPersonsURL),
    headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var persons = personFromJson(response.body);

    // Filtering
    List<Person> menteesList = List();
    for (var i = 0; i < persons.length; i++) {
      if (persons[i].mentor != Mentor.MENTOR) {
        menteesList.add(persons[i]);
      }
    }
    persons.clear();

    AppConstant.menteesCount = menteesList.length;
    print("Mentees List Size: ${menteesList.length}");
    return menteesList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print(response.reasonPhrase);
    throw json.decode(response.body)['error']['message'];
  }
}
