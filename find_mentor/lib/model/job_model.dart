import 'dart:convert';
import 'package:find_mentor/enums.dart';

JobModel jobModelFromJson(String str) => JobModel.fromJson(json.decode(str));
String jobModelToJson(JobModel data) => json.encode(data.toJson());

class JobModel {
  JobModel({
    this.jobs,
  });

  List<Job> jobs;

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        jobs: List<Job>.from(json["jobs"].map((x) => Job.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "jobs": List<dynamic>.from(jobs.map((x) => x.toJson())),
      };
}

class Job {
  Job({
    this.date,
    this.company,
    this.position,
    this.address,
    this.description,
    this.location,
    this.logo,
    this.tags,
    this.remote,
    this.isRemoveAllowed,
  });

  String date;
  String company;
  String position;
  String address;
  String description;
  String location;
  String logo;
  List<String> tags;
  Remote remote;
  bool isRemoveAllowed;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        date: json["date"],
        company: json["company"],
        position: json["position"],
        address: json["address"],
        description: json["description"],
        location: json["location"],
        logo: json["logo"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        remote: remoteValues.map[json["remote"]],
        isRemoveAllowed: json["isRemoveAllowed"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "company": company,
        "position": position,
        "address": address,
        "description": description,
        "location": location,
        "logo": logo,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "remote": remoteValues.reverse[remote],
        "isRemoveAllowed": isRemoveAllowed,
      };
}

final remoteValues = EnumValues({"Evet": Remote.EVET, "Hibrit": Remote.HIBRIT, "Hayır": Remote.HAYIR});

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
