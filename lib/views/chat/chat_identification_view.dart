import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:appostocosmo/views/chat/chat_view.dart';

enum Postos { Caetes, DoLago, Roncador, JK, Paranagua, Cosmo }

extension PostosExtension on Postos {
  String get name => describeEnum(this);

  String get displayTitle {
    switch (this) {
      case Postos.Caetes:
        return "caetes";
      case Postos.DoLago:
        return "lago";
      case Postos.Roncador:
        return "roncador";
      case Postos.JK:
        return "jk";
      case Postos.Paranagua:
        return "paranagua";
      case Postos.Cosmo:
        return "cosmo";
    }
  }
}

class ChatIdentificationView extends StatefulWidget {
  @override
  _ChatIdentificationViewState createState() => _ChatIdentificationViewState();
}

class _ChatIdentificationViewState extends State<ChatIdentificationView> {
  String? email;
  String? phone;
  String? name;
  final Postos gasStation = Postos.Cosmo;

  List<Widget> _formFields() {
    return [
      SizedBox(height: 64),
      Center(
        child: Text(
          """Antes de prosseguir ao atendimento, precisaremos dos dados abaixo para identificação""",
          style: TextStyle(fontSize: 21, height: 1.2),
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(height: 64),
      TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(fontSize: 20),
        onChanged: (value) {
          this.email = value;
        },
        decoration: InputDecoration(
          hintText: "Email",
          icon: Icon(
            Icons.email,
            size: 32,
          ),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value != null && !value.contains("@")) {
            return "O email deve ser válido";
          }
        },
      ),
      SizedBox(height: 32),
      TextFormField(
        keyboardType: TextInputType.phone,
        style: TextStyle(fontSize: 20),
        onChanged: (value) {
          this.phone = phone;
        },
        decoration: InputDecoration(
          hintText: "(##) #####-####",
          icon: Icon(Icons.phone, size: 32),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          TelefoneInputFormatter()
        ],
        validator: (value) {
          if (value != null) {
            String numbersStr = value.replaceAll(new RegExp(r'[^0-9]'), '');
            if (numbersStr.length == 11) {
              this.phone = numbersStr;
              return null;
            }
          }
          return "O telefone deve ser válido";
        },
      ),
      SizedBox(height: 32),
      TextFormField(
        style: TextStyle(fontSize: 20),
        onChanged: (value) {
          this.name = value.toLowerCase();
        },
        decoration: InputDecoration(
          hintText: "Seu Nome",
          icon: Icon(Icons.person, size: 32),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Precisamos do seu nome!";
          }
        },
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff493163),
        centerTitle: true,
        title: Text("Suporte"),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(32, 0, 48, 0),
          child: ListView(
            children: _formFields() +
                [
                  SizedBox(height: 48),
                  _buildContinueButton(),
                ],
          ),
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return InkWell(
      onTap: () {
        if (this.email != null && this.phone != null && this.name != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatView(this.email!, this.phone!,
                  this.name!, this.gasStation.displayTitle),
            ),
          );
        }
      },
      child: Center(
        child: Container(
          width: 260,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xff493163),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              "continuar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
