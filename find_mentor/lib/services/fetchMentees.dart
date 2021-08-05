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
    List<Person> persons = List();

    persons = (json.decode(response.body) as List)
        .map((data) => Person.fromJson(data))
        .toList();

    // Filtering
    List<Person> menteesList = List();
    for (var i = 0; i < persons.length; i++) {
      if (persons[i].mentor != Mentor.MENTOR) {
        menteesList.add(persons[i]);
      }
    }
    persons.clear();

    print("Mentees List Size: ${menteesList.length}");
    AppConstant.menteesCount = menteesList.length;
    return menteesList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception(AppConstant.apiErrorText);
  }
}
