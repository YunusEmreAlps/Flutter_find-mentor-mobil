import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:find_mentor/model/job_model.dart';
import 'package:find_mentor/util/app_constant.dart';

// Fetch our Jobs from API
Future<List<Job>> fetchJobs() async {
  final response = await http.get(
    Uri.encodeFull(AppConstant.apiJobsURL),
    headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jobs = jobModelFromJson(response.body);

    AppConstant.jobsCount = jobs.jobs.length;
    print("Jobs List Size: ${jobs.jobs.length}");
    return jobs.jobs;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print(response.reasonPhrase);
    throw json.decode(response.body)['error']['message'];
  }
}
