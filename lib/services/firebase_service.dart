import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseService {
  static FirebaseService shared = FirebaseService();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  String fcmToken;

  requestNotificationToken(Function(bool, FirebaseService) onRequested) {
    _firebaseMessaging.requestNotificationPermissions(IosNotificationSettings(
        sound: true, badge: true, alert: true, provisional: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      onRequested(true, shared);
    });
  }

  Future<String> requestToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    if (token == null) {
      token = await _firebaseMessaging.getToken();
      _firebaseMessaging.subscribeToTopic("appostocosme");
      _saveToken(token);

      prefs.setString("token", token);
    }

    return token;
  }

  _saveToken(String token) {
    Firebase.initializeApp().then((value) {
      print("💥🎉📱🍞 TOKEN $token");
      FirebaseFirestore.instance
          .collection('tokens')
          .add({"token": token, "aplicativo": "recompenseClub"});
    });
  }
}
