import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventDM {
  String id;
  String ownerId;
  CategoryDM categoryDM;
  String title;
  String description;
  DateTime dateTime;
  String imagePathDark;
  String imagePathLight;

  EventDM({
    required this.id,
    required this.ownerId,
    required this.categoryDM,
    required this.dateTime,
    required this.title,
    required this.description,
    required this.imagePathDark,
    required this.imagePathLight,
  });

  static EventDM fromJson(Map<String, dynamic> json) {
    Timestamp timeStamp = json["dateTime"];
    return EventDM(
      id: json["id"],
      ownerId: json["ownerId"],
      categoryDM: CategoryDM.fromJson(json["category"]),
      dateTime: timeStamp.toDate(),
      title: json["title"],
      description: json["description"],
      imagePathDark: json["imagePathDark"] ,
      imagePathLight: json["imagePathLight"] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "ownerId": ownerId,
      "category": categoryDM.toJson(),
      "title": title,
      "description": description,
      "dateTime": dateTime,
      "imagePathDark": imagePathDark,
      "imagePathLight": imagePathLight,
    };
  }
}

class CategoryDM {
  String name;
  String imagePath;
  String imagePathLight;
  String imagePathDark;
  IconData icon;

  CategoryDM({
    required this.name,
    required this.imagePath,
    required this.imagePathLight,
    required this.imagePathDark,
    required this.icon,
  });

  static CategoryDM fromJson(Map<String, dynamic> json) {
    int codePoint = json["icon"];
    return CategoryDM(
      name: json["name"],
      imagePath: json["imagePath"] ?? "",
      imagePathLight: json["imagePathLight"] ?? json["imagePath"] ,
      imagePathDark: json["imagePathDark"] ?? json["imagePath"] ,
      icon: IconData(codePoint, fontFamily: 'MaterialIcons'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "imagePath": imagePath,
      "imagePathLight": imagePathLight,
      "imagePathDark": imagePathDark,
      "icon": icon.codePoint,
    };
  }
}