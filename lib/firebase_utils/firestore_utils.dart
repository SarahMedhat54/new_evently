import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_c17/ui/model/event_dm.dart';
import 'package:evently_c17/ui/model/user_dm.dart';

Future<UserDM> getUserFromFirestore(String id) async {
  var usersCollection = FirebaseFirestore.instance.collection("users");
  var userDoc = usersCollection.doc(id);
  DocumentSnapshot snapshot = await userDoc.get();
  Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
  return UserDM.fromJson(map);
}

void createUserInFirestore(UserDM user) {
  var usersCollection = FirebaseFirestore.instance.collection("users");
  var emptyDoc = usersCollection.doc(user.id);
  emptyDoc.set(user.toJson());
}

Future<void> createEventInFirestore(EventDM event) async {
  CollectionReference eventsCollection = FirebaseFirestore.instance.collection(
    "events",
  );
  var doc = eventsCollection.doc();
  event.id = doc.id;
  await doc.set(event.toJson());
}

Stream<List<EventDM>> getEventsFromFirestore() {
  CollectionReference eventsCollection = FirebaseFirestore.instance.collection(
    "events",
  );
  // QuerySnapshot querySnapshot = await eventsCollection.get();
  // return querySnapshot.docs.map((doc) {
  //   var json = doc.data() as Map<String, dynamic>;
  //   return EventDM.fromJson(json);
  // }).toList();
  Stream<QuerySnapshot> stream = eventsCollection.snapshots();
  return stream.map((querySnapshot) {
    return querySnapshot.docs.map((doc) {
      var json = doc.data() as Map<String, dynamic>;
      return EventDM.fromJson(json);
    }).toList();
  });
}

addEventToFavorite(String eventId, UserDM user) {
  CollectionReference userCollection = FirebaseFirestore.instance.collection(
    UserDM.collectionName,
  );
  var docRef = userCollection.doc(user.id);

  List<String> favoriteEventIds = List.of(user.favoriteEventIds);
  favoriteEventIds.add(eventId);
  user.favoriteEventIds = favoriteEventIds;

  // user.favoriteEventIds.add(eventId); this throws an exception
  docRef.update({"favoriteEventIds": user.favoriteEventIds});
}

removeEventFromFavorite(String eventId, UserDM user) {
  CollectionReference userCollection = FirebaseFirestore.instance.collection(
    UserDM.collectionName,
  );
  var docRef = userCollection.doc(user.id);
  user.favoriteEventIds.remove(eventId);
  docRef.update({"favoriteEventIds": user.favoriteEventIds});
}

Future<List<EventDM>> getFavoriteEventsForUser(String uid) async {
  if(UserDM.currentUser!.favoriteEventIds.isEmpty) return [];
  CollectionReference eventsCollection = FirebaseFirestore.instance.collection(
    "events",
  );
  QuerySnapshot querySnapshot = await eventsCollection.where("id", whereIn: UserDM.currentUser!.favoriteEventIds).get();
  return querySnapshot.docs.map((doc) {
    var json = doc.data() as Map<String, dynamic>;
    return EventDM.fromJson(json);
  }).toList();
}

// updateEvent
