// To parse this JSON data, do
//
//     final event = eventFromMap(jsonString);

// Dart imports:
import 'dart:convert';

Event eventFromJson(String str) => Event.fromJson(json.decode(str));

String eventToJson(Event data) => json.encode(data.toJson());

class Event {
    Event({
        this.events,
    });

    List<EventElement> events;

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        events: List<EventElement>.from(json["events"].map((x) => EventElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
    };
}

class EventElement {
    EventElement({
        this.eventName,
        this.speakers,
        this.link,
        this.date,
        this.status,
    });

    String eventName;
    List<Speaker> speakers;
    String link;
    String date;
    String status;

    factory EventElement.fromJson(Map<String, dynamic> json) => EventElement(
        eventName: json["event_name"],
        speakers: List<Speaker>.from(json["speakers"].map((x) => Speaker.fromJson(x))),
        link: json["link"],
        date: json["date"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "event_name": eventName,
        "speakers": List<dynamic>.from(speakers.map((x) => x.toJson())),
        "link": link,
        "date": date,
        "status": status,
    };
}

class Speaker {
    Speaker({
        this.name,
        this.twitter,
    });

    String name;
    String twitter;

    factory Speaker.fromJson(Map<String, dynamic> json) => Speaker(
        name: json["name"],
        twitter: json["twitter"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "twitter": twitter,
    };
}
