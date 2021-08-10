import 'dart:convert';
import 'package:find_mentor/enums.dart';
import 'package:find_mentor/model/contribution.dart';

List<Person> personFromJson(String str) =>
    List<Person>.from(json.decode(str).map((x) => Person.fromJson(x)));

String personToJson(List<Person> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Person {
  Person({
    this.registeredAt,
    this.name,
    this.twitterHandle,
    this.github,
    this.linkedin,
    this.interests,
    this.goals,
    this.mentor,
    this.slug,
    this.avatar,
    this.displayInterests,
    this.isHireable,
    this.mentorships,
    this.contributions,
    this.mail,
    this.stackoverflow,
  });

  String registeredAt;
  String name;
  String twitterHandle;
  String github;
  String linkedin;
  String interests;
  String goals;
  Mentor mentor;
  String slug;
  String avatar;
  String displayInterests;
  bool isHireable;
  List<Contribution> mentorships;
  List<Contribution> contributions;
  String mail;
  String stackoverflow;

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      registeredAt: json["registered_at"],
      name: json["name"],
      twitterHandle: json["twitter_handle"],
      github: json["github"],
      linkedin: json["linkedin"],
      interests: json["interests"],
      goals: json["goals"],
      mentor: mentorValues.map[json["mentor"]],
      slug: json["slug"],
      avatar: json["avatar"],
      displayInterests: json["displayInterests"],
      isHireable: json["isHireable"],
      mentorships: List<Contribution>.from(json["mentorships"].map((x) => Contribution.fromJson(x))),
      contributions: List<Contribution>.from(json["contributions"].map((x) => Contribution.fromJson(x))),
      mail: json["mail"] == null ? null : json["mail"],
      stackoverflow:json["stackoverflow"] == null ? null : json["stackoverflow"],
    );
  }

    Map<String, dynamic> toJson() => {
        "registered_at": registeredAt,
        "name": name,
        "twitter_handle": twitterHandle,
        "github": github,
        "linkedin": linkedin,
        "interests": interests,
        "goals": goals,
        "mentor": mentorValues.reverse[mentor],
        "slug": slug,
        "avatar": avatar,
        "displayInterests": displayInterests,
        "isHireable": isHireable,
        "mentorships": List<dynamic>.from(mentorships.map((x) => x.toJson())),
        "contributions": List<dynamic>.from(contributions.map((x) => x.toJson())),
        "mail": mail == null ? null : mail,
        "stackoverflow": stackoverflow == null ? null : stackoverflow,
    };
}

final mentorValues = EnumValues(
    {"Both": Mentor.BOTH, "Mentee": Mentor.MENTEE, "Mentor": Mentor.MENTOR});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
