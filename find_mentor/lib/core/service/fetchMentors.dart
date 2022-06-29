// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/core/enums/enums.dart';
import 'package:find_mentor/core/model/person.dart';

// Fetch our Mentors from API
class MentorModel extends Model {
  List<Person> mentorsList = [];

  fetchMentors() async {
    var client = http.Client();
    var response = await client.get(
      Uri.parse(AppStrings.API_PERSONS_URL),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List persons = json.decode(response.body);

      // Filtering
      List filteredList = List.empty(growable: true);
      for (var i = 0; i < persons.length; i++) {
        if (persons[i]["mentor"] != mentorValues.reverse[Mentor.MENTEE]) {
          filteredList.add(persons[i]);
        }
      }
      print("Mentors List Size: ${filteredList.length}");

      int listLength = mentorsList.length;
      for (int index = listLength; index < (listLength + 10); index++) {
        mentorsList.add(Person.fromJson(filteredList[index]));
      }
      AppConstants.mentorsCount = filteredList.length;
      print("Mentors List Size: ${AppConstants.mentorsCount}");
      notifyListeners();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.reasonPhrase);
      throw json.decode(response.body)['error']['message'];
    }
  }
}
