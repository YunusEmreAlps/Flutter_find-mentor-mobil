// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/core/model/event.dart';

// Fetch our Events from Local API
Future<List<EventElement>> fetchEvents() async {
  String response = await rootBundle.loadString(AppStrings.API_EVENTS_URL);
  Map data = json.decode(response);

  var events = eventFromJson(response);

  AppConstants.eventsCount = data["events"].length;
  print("Events List Size: ${data["events"].length}");
  return events.events;
}
