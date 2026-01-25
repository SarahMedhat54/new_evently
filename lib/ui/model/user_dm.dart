UserDM? currentUser;
class UserDM {
  static UserDM? currentUser;
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
}
