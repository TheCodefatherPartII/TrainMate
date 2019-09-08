import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trainmate/models/message.dart';

final String tripId = '670A.442.125.2.T.8.58577537';

Stream<List<Message>> getMessages(String _something) {
  return Firestore.instance
      .collection('channels')
      .document('$tripId')
      .collection('messages')
      .snapshots()
      .map((QuerySnapshot snapshot) {
    return snapshot.documents
        .map((document) => Message.fromJson(document.data))
        .toList()
          ..sort((a, b) => a.date.compareTo(b.date));
  });
}

void sendMessage(String _something, Message message) {
  Firestore.instance
      .collection('channels')
      .document('$tripId')
      .collection('messages')
      .add(message.toJson());
}
