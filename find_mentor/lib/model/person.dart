import 'package:find_mentor/enums.dart';
import 'package:find_mentor/model/contribution.dart';

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
    this.mail,
    this.mentorships,
    this.contributions,
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
  String mail;
  List<Contribution> mentorships;
  List<Contribution> contributions;

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
      mail: json["mail"],
      mentorships: List<Contribution>.from(json["mentorships"].map((x) => Contribution.fromJson(x))),
      contributions: List<Contribution>.from(json["contributions"].map((x) => Contribution.fromJson(x))),
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
        "mail": mail,
        "mentorships": List<dynamic>.from(mentorships.map((x) => x.toJson())),
        "contributions": List<dynamic>.from(contributions.map((x) => x.toJson())),
      };
}

final mentorValues = EnumValues({
    "Both": Mentor.BOTH,
    "Mentee": Mentor.MENTEE,
    "Mentor": Mentor.MENTOR
});

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
