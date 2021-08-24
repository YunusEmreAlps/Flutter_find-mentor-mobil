import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:find_mentor/enums.dart';
import 'package:find_mentor/model/person.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:find_mentor/util/app_constant.dart';

// Fetch our Mentees from API
class MenteeModel extends Model {
  List<Person> menteesList = [];

  fetchMentees() async {
    var client = http.Client();
    var response = await client.get(
      Uri.parse(AppConstant.apiPersonsURL),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List persons = json.decode(response.body);

      // Filtering
      List filteredList = List();
      for (var i = 0; i < persons.length; i++) {
        if (persons[i]["mentor"] != mentorValues.reverse[Mentor.MENTOR]) {
          filteredList.add(persons[i]);
        }
      }
      print("Mentees List Size: ${filteredList.length}");

      int listLength = menteesList.length;
      for (int index = listLength; index < (listLength + 10); index++) {
        menteesList.add(Person.fromJson(filteredList[index]));
      }
      AppConstant.menteesCount = filteredList.length;
      print("Mentees List Size: ${menteesList.length}");
      notifyListeners();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.reasonPhrase);
      throw json.decode(response.body)['error']['message'];
    }
  }
}
