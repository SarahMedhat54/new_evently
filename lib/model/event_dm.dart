import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventDM {
  String id;
  String ownerId;
  CategoryDM categoryDM;
  String title;
  String description;
  DateTime dateTime;

  EventDM({
    required this.id,
    required this.ownerId,
    required this.categoryDM,
    required this.dateTime,
    required this.title,
    required this.description,
  });

  static EventDM fromJson(Map<String, dynamic> json) {
    // Safely handle the Firestore Timestamp
    Timestamp? timeStamp = json["dateTime"] as Timestamp?;

    return EventDM(
      id: json["id"] as String? ?? '',
      ownerId: json["ownerId"] as String? ?? "",
      // If "category" is missing in Firestore, we pass an empty map to CategoryDM
      categoryDM: CategoryDM.fromJson(json["category"] as Map<String, dynamic>? ?? {}),
      dateTime: timeStamp?.toDate() ?? DateTime.now(),
      title: json["title"] as String? ?? "",
      description: json["description"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "ownerId": ownerId,
      "category": categoryDM.toJson(),
      "title": title,
      "description": description,
      "dateTime": dateTime, // Firestore SDK converts DateTime to Timestamp automatically
      "dateTime": dateTime,
      "imagePathDark": imagePathDark,
      "imagePathLight": imagePathLight,
    };
  }
}

class CategoryDM {
  String name;
  String imagePath;
  String imageDarkPath;
  String imagePathLight;
  String imagePathDark;
  IconData icon;

  CategoryDM({
    required this.name,
    required this.imagePath,
    required this.imageDarkPath,
    required this.imagePathLight,
    required this.imagePathDark,
    required this.icon,
  });

  static CategoryDM fromJson(Map<String, dynamic> json) {
    return CategoryDM(
      name: json["name"] as String? ?? "Unknown",
      imagePath: json["imagePath"] as String? ?? "",
      imageDarkPath: json["imageDarkPath"] as String? ?? "",
      // Provide a default icon (Icons.error) if the codePoint is missing
      icon: IconData(
        json["icon"] as int? ?? 0xe237,
        fontFamily: 'MaterialIcons',
      ),
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
      "imageDarkPath": imageDarkPath,
      "icon": icon.codePoint,
    };
  }
}
      "imagePathLight": imagePathLight,
      "imagePathDark": imagePathDark,
      "icon": icon.codePoint,
    };
  }
}
