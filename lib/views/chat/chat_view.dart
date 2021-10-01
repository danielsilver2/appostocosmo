import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_file/open_file.dart';
import 'package:appostocosmo/services/firebase_messaging.dart';
import 'package:appostocosmo/services/firebase_service.dart';
import 'package:appostocosmo/views/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class ChatView extends StatefulWidget {
  final String? id;
  final String email;
  final String phone;
  final String name;
  final String gasStation;

  ChatView(this.email, this.phone, this.name, this.gasStation, {this.id});

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  List<types.Message> _messages = [];

  late types.User _user;

  types.User appPostoUser = types.User(
    id: "apposto_user",
    firstName: "App",
    lastName: "Posto",
  );

  FirebaseMessagingService fbMessaging = FirebaseMessagingService.shared;

  @override
  initState() {
    super.initState();

    String _userId =
        md5.convert(utf8.encode(widget.email + widget.gasStation)).toString();

    if (widget.id != null) {
      _userId = widget.id!;
    }

    SharedPreferences.getInstance()
        .then((value) => value.setString("support_user_id", _userId));
    List<String> nameSplitted = widget.name.split(" ");

    String? fcmToken = FirebaseService.shared.fcmToken;

    int userColor =
        Colors.primaries[Random().nextInt(Colors.primaries.length)].value;

    this._user = types.User(
      id: _userId,
      firstName: nameSplitted.removeAt(0),
      lastName: nameSplitted.join(" "),
      metadata: {
        "email": widget.email,
        "phone": widget.phone,
        "station": widget.gasStation,
        "fcmToken": fcmToken,
        "color": userColor
      },
    );

    if (widget.id == null) {
      FirebaseMessagingService.shared.saveUser(_user.toJson());
    }

    _loadMessages();
    _startListeningToMessages();
  }

  _startListeningToMessages() {
    var onMessagesChange =
        FirebaseMessagingService.shared.listenToMessages(_user.id);
    onMessagesChange.listen((event) {
      event.forEach((j) {
        if (j != null) {
          types.Message msg = types.Message.fromJson(j);
          bool containsLocally = false;
          for (var element in _messages) {
            if (element.id == msg.id) {
              containsLocally = true;
              break;
            }
          }

          if (!containsLocally) {
            setState(() {
              _messages.insert(0, msg);
            });
          }
        }
      });
    });
  }

  _insertOnFirebase(types.Message message) {
    FirebaseMessagingService.shared.insertMessage(message.toJson());
  }

  _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
      _insertOnFirebase(message);
    });
  }

  _handleAtachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SizedBox(
            height: 144,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _handleImageSelection();
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Photo'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _handleFileSelection();
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('File'),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Cancel'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
        roomId: _user.id,
      );

      _addMessage(message);
    }
  }

  _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
        roomId: _user.id,
      );

      _addMessage(message);
    }
  }

  _handleMessageTap(types.Message message) async {
    if (message is types.FileMessage) {
      await OpenFile.open(message.uri);
    }
  }

  _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = _messages[index].copyWith(previewData: previewData);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        _messages[index] = updatedMessage;
      });
    });
  }

  _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
      roomId: _user.id,
    );

    _addMessage(textMessage);
  }

  _loadMessages() async {
    var query = await FirebaseMessagingService.shared.getMessagesBy(_user.id);
    final messages =
        query.docs.map((e) => types.Message.fromJson(e.data())).toList();

    if (messages.length == 0) {
      var welcomeMsg =
          "Seja bem vindo(a) ao Suporte APPosto! Nosso horário de atendimento é de segunda a sexta das 9:00 às 17:00hrs exceto feriados! Mas não se preocupe! Você pode deixar registrada a sua solicitação abaixo e no próximo dia útil faremos contato para lhe ajudar!";

      final welcome = types.TextMessage(
        author: appPostoUser,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: welcomeMsg,
        roomId: _user.id,
      );

      this._addMessage(welcome);
    }

    setState(() {
      _messages = messages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => Home()), (route) => false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff493163),
          centerTitle: true,
          title: Text("Suporte"),
        ),
        body: SafeArea(
          bottom: false,
          child: Chat(
            l10n: ChatL10nPt(
              emptyChatPlaceholder: "Sem nenhuma mensagem ainda",
              inputPlaceholder: "Escreva sua mensagem",
            ),
            messages: _messages,
            onMessageTap: _handleMessageTap,
            onSendPressed: _handleSendPressed,
            user: _user,
          ),
        ),
      ),
    );
  }
}
