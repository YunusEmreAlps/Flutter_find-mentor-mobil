import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:find_mentor/util/app_constant.dart';
import 'package:find_mentor/model/contribution.dart';

// Fetch our Mentorships from API
Future<List<Contribution>> fetchMentorships() async {
  final response = await http.get(
    Uri.encodeFull(AppConstant.apiMentorshipsURL),
    headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var mentorships = activeMentorshipFromJson(response.body);

    AppConstant.mentorshipsCount = mentorships.mentorships.length;
    print("mentorships List Size: ${mentorships.mentorships.length}");
    return mentorships.mentorships;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print(response.reasonPhrase);
    throw json.decode(response.body)['error']['message'];
  }
}
