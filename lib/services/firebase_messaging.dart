import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseMessagingService {
  static FirebaseMessagingService shared = FirebaseMessagingService();

  FirebaseFirestore? _instance;

  FirebaseMessagingService() {
    if (_instance == null) {
      FirebaseApp? app;
      var apps =
          Firebase.apps.where((f) => f.name == "appPosto-support-messages");
      if (apps.length > 0) {
        app = apps.first;
      }
      if (app == null) {
        String appId = "1:84341623465:ios:33fc9f0842b1b3dd71b7b8";
        if (Platform.isAndroid) {
          appId = "1:84341623465:android:3685a8a2d5cea75771b7b8";
        }
        FirebaseOptions options = FirebaseOptions(
            apiKey: "AIzaSyCbYh-UHa7tx4UWBr4368dbi0MWIeajLR4",
            authDomain: "appposto-support-messages.firebaseapp.com",
            appId: appId,
            messagingSenderId: "84341623465",
            projectId: "appposto-support-messages",
            measurementId: "G-1ZQ8XMDY65");
        Firebase.initializeApp(
          name: "appPosto-support-messages",
          options: options,
        ).then(
            (value) => _instance = FirebaseFirestore.instanceFor(app: value));
      } else {
        _instance = FirebaseFirestore.instanceFor(app: app);
      }
    }
  }

  Stream<List<Map<String, dynamic>?>> listenToMessages(String roomId) {
    return _instance!
        .collection("messages")
        .where("roomId", isEqualTo: roomId)
        .snapshots()
        .map((event) => event.docChanges.map((e) => e.doc.data()).toList());
  }

  insertMessage(Map<String, dynamic> message) {
    _instance!.collection("messages").add(message);

    _instance!
        .collection("users")
        .where("id", isEqualTo: message["roomId"])
        .get()
        .then((value) {
      _instance!.collection("users").doc(value.docs.first.id).update({
        "metadata.lastMessage": message["createdAt"],
        "metadata.lastMessageText": message["text"]
      });
    });
  }

  saveUser(Map<String, dynamic> user) {
    _instance!.collection("users").add(user);
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getUserBy(String id) async {
    var value = _instance!.collection("users").where("id", isEqualTo: id).get();

    return value;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getMessagesBy(
      String userId) async {
    return _instance!
        .collection("messages")
        .where("roomId", isEqualTo: userId)
        .orderBy("createdAt", descending: true)
        .get();
  }
}
