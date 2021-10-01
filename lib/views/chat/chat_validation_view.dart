import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:appostocosmo/services/firebase_messaging.dart';
import 'package:appostocosmo/views/chat/chat_identification_view.dart';
import 'package:appostocosmo/views/chat/chat_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatValidationView extends StatefulWidget {
  @override
  _ChatValidationViewState createState() => _ChatValidationViewState();
}

class _ChatValidationViewState extends State<ChatValidationView> {
  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((value) {
      String? userId = value.getString("support_user_id");

      if (userId != null) {
        FirebaseMessagingService.shared.getUserBy(userId).then((value) {
          if (value.docs.length > 0) {
            Map<String, dynamic> userJson = value.docs.first.data();
            types.User user = types.User.fromJson(userJson);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatView(
                  user.metadata?["email"],
                  user.metadata?["phone"],
                  "${user.firstName} ${user.lastName}",
                  user.metadata?["station"],
                  id: user.id,
                ),
              ),
            );
          } else {
            goToChatIdentification();
          }
        });
      } else {
        goToChatIdentification();
      }
    });

    return Center(
      child: Container(
        width: 64,
        height: 64,
        child: CircularProgressIndicator(),
      ),
    );
  }

  goToChatIdentification() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatIdentificationView(),
      ),
    );
  }
}
