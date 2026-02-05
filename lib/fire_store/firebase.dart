import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/event_dm.dart';
Future<void> updateEventInFirestore(EventDM event) async {
  CollectionReference collection = FirebaseFirestore.instance.collection(
    "events",
  );

  await collection.doc(event.id).update(event.toJson());
}