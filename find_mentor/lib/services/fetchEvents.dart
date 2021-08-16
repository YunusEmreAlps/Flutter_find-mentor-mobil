import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:find_mentor/model/event.dart';
import 'package:find_mentor/util/app_constant.dart';

// Fetch our Events from Local API
Future<List<EventElement>> fetchEvents() async {
  String response = await rootBundle.loadString(AppConstant.apiEventsURL);
  Map data = json.decode(response);

  var events = eventFromJson(response);

  AppConstant.eventsCount = data["events"].length;
  print("Events List Size: ${data["events"].length}");
  return events.events;
}
