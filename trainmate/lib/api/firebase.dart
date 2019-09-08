import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trainmate/models/message.dart';

Stream<List<Message>> getMessages(String tripId) {
  return Firestore.instance
      .collection('channels')
      .document('$tripId')
      .collection('messages')
      .snapshots()
      .map((QuerySnapshot snapshot) {

    return snapshot.documents
        .map((document) => Message.fromJson(document.data))
        .toList()
        ..sort((a,b) => a.date.compareTo(b.date));
  });
}

void sendMessage(String tripId, Message message) {
  Firestore.instance
      .collection('channels')
      .document('$tripId')
      .collection('messages')
      .add(message.toJson());
}
