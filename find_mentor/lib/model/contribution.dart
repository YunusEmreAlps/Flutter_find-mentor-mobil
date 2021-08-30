import 'dart:convert';

ActiveMentorship activeMentorshipFromJson(String str) => ActiveMentorship.fromJson(json.decode(str));
String activeMentorshipToJson(ActiveMentorship data) => json.encode(data.toJson());

class ActiveMentorship {
    ActiveMentorship({
        this.mentorships,
    });

    List<Contribution> mentorships;

    factory ActiveMentorship.fromJson(Map<String, dynamic> json) => ActiveMentorship(
        mentorships: List<Contribution>.from(json["mentorships"].map((x) => Contribution.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "mentorships": List<dynamic>.from(mentorships.map((x) => x.toJson())),
    };
}

class Contribution {
  Contribution({
    this.empty,
    this.mentor,
    this.projectAdress,
    this.goal,
    this.slug,
    this.contributors,
  });

  String empty;
  String mentor;
  String projectAdress;
  String goal;
  String slug;
  List<Contributor> contributors;

  factory Contribution.fromJson(Map<String, dynamic> json) => Contribution(
        empty: json[""],
        mentor: json["mentor"],
        projectAdress: json["project_adress"],
        goal: json["goal"],
        slug: json["slug"],
        contributors: List<Contributor>.from(json["contributors"].map((x) => Contributor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "": empty,
        "mentor": mentor,
        "project_adress": projectAdress,
        "goal": goal,
        "slug": slug,
        "contributors": List<dynamic>.from(contributors.map((x) => x.toJson())),
      };
}

class Contributor {
  Contributor({
    this.username,
    this.githubAddress,
    this.avatar,
    this.fmnUrl,
  });

  String username;
  String githubAddress;
  String avatar;
  String fmnUrl;

  factory Contributor.fromJson(Map<String, dynamic> json) => Contributor(
        username: json["username"],
        githubAddress: json["github_address"],
        avatar: json["avatar"],
        fmnUrl: json["fmn_url"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "github_address": githubAddress,
        "avatar": avatar,
        "fmn_url": fmnUrl,
      };
}
