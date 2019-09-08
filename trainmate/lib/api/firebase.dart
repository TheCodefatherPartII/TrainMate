import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trainmate/models/message.dart';

Stream<List<Message>> getMessages(String tripId) {
  return Firestore.instance.collection('channels/$tripId').snapshots().map((QuerySnapshot snapshot) {
    return snapshot.documents.map((document) => Message(
      colour: Color(int.parse(document['colour'], radix: 16)),
      identity: document['identity'],
      name: document['name'],
      text: document['text'],
      date: document['date'],
      image: document['image'],
      isBroadcast: document['isBroadcast'],
    ));
  });
}