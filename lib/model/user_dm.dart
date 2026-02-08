class UserDM {
  static UserDM? currentUser;
  static const collectionName = "users";
  String id;
  String name;
  String address;
  String phoneNumber;
  String email;
  List<String> favoriteEventIds;

  UserDM({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.email,
    this.favoriteEventIds = const [],
  });

  static UserDM fromJson(Map<String, dynamic> json) {
    List<dynamic> favorites = json["favoriteEventIds"];
    return UserDM(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        favoriteEventIds: favorites.map((id) => id.toString()).toList()
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "address": address,
      "phoneNumber": phoneNumber,
      "favoriteEventIds": [],
    };
  }
}