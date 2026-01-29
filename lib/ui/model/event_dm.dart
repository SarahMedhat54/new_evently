import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class EventDM {
  CategoryDM categoryDM;
  String title;
  String description;
  DateTime dateTime;
  String id;
  String ownerId;

  static EventDM fromJson(Map<String, dynamic> json) {
    Timestamp timestamp = json["dateTime"];
    return EventDM(
      categoryDM: CategoryDM.fromJson(json["categoryDM"]),
      dateTime: timestamp.toDate(),
      title: json["title"],
      description: json["description"],
      id: json["id"],
      ownerId: json["ownerId"],
    );
  }

  Map<String, dynamic> toJson() => {
    "categoryDM": categoryDM.toJson(),
    "title": title,
    "description": description,
    "dateTime": dateTime,
    "id": id,
    "ownerId": ownerId,
  };

  EventDM({
    required this.categoryDM,
    required this.dateTime,
    required this.title,
    required this.description,
    required this.id,
    required this.ownerId,
  });
}

class CategoryDM {
  String name;
  String imagePath;
  IconData icon;

  CategoryDM({required this.name, required this.imagePath, required this.icon});

  static CategoryDM fromJson(Map<String, dynamic> json) {
    int codePoint = json["icon"];
    return CategoryDM(
      name: json["name"],
      imagePath: json["imagePath"],
      icon: IconData(codePoint),
    );
  }

  toJson() {
    return {"name": name, "imagePath": imagePath, "icon": icon.codePoint};
  }
}
