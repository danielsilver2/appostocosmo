import 'package:appostocosmo/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    title: "Posto Cosmo",
    home: Principal(),
  ));
}

/// TELA INICIAL
class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseService fBService = FirebaseService.shared;
    if (Platform.isIOS) {
      fBService.requestNotificationToken((accepted, service) {});
    }
    fBService.requestToken().then((value) => fBService.fcmToken = value);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff493163),
        centerTitle: true,
        title: Image.asset(
          'icone/logoapposto.jpg',
          fit: BoxFit.cover,
          height: 38,
        ),
      ),
      body: WebView(
        initialUrl: 'https://postocosmo.com.br/new/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  image: DecorationImage(
                    image: AssetImage("icone/logocosmo.png"),
                    fit: BoxFit.cover,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text(
                'PONTUAÇÃO',
                style: TextStyle(fontSize: 16.0),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Pontos(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
              title: Text('OFERTAS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Ofertas(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.explore),
              title: Text('LOCALIZAÇÃO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Localizacao(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.extension),
              title: Text('CONVÊNIOS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Convenios(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_gas_station),
              title: Text('AVALIAR ATENDIMENTO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Avaliar(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_bus),
              title: Text('CADASTRO DE VEÍCULOS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cadastro(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text('Esqueci a senha'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Senha(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.import_contacts),
              title: Text('Política de Privacidade'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Politica(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}

/// TELA PONTOS
class Pontos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff493163),
        centerTitle: true,
        title: Image.asset(
          'icone/logoapposto.jpg',
          fit: BoxFit.cover,
          height: 38,
        ),
      ),
      body: WebView(
        initialUrl: 'https://postocosmo.com.br/minha-conta/points-and-rewards/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  image: DecorationImage(
                    image: AssetImage("icone/logocosmo.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('PONTUAÇÃO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Pontos(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
              title: Text('OFERTAS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Ofertas(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.explore),
              title: Text('LOCALIZAÇÃO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Localizacao(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.extension),
              title: Text('CONVÊNIOS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Convenios(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_gas_station),
              title: Text('AVALIAR ATENDIMENTO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Avaliar(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_bus),
              title: Text('CADASTRO DE VEÍCULOS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cadastro(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text('Esqueci a senha'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Senha(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.import_contacts),
              title: Text('Política de Privacidade'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Politica(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}

/// TELA OFERTAS
class Ofertas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff493163),
        centerTitle: true,
        title: Image.asset(
          'icone/logoapposto.jpg',
          fit: BoxFit.cover,
          height: 38,
        ),
      ),
      body: WebView(
        initialUrl: 'https://postocosmo.com.br/ofertas/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  image: DecorationImage(
                    image: AssetImage("icone/lagoquadrada.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('PONTUAÇÃO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Pontos(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
              title: Text('OFERTAS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Ofertas(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.explore),
              title: Text('LOCALIZAÇÃO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Localizacao(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.extension),
              title: Text('CONVÊNIOS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Convenios(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_gas_station),
              title: Text('AVALIAR ATENDIMENTO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Avaliar(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_bus),
              title: Text('CADASTRO DE VEÍCULOS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cadastro(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text('Esqueci a senha'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Senha(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.import_contacts),
              title: Text('Política de Privacidade'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Politica(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}

/// TELA lOCALIZAÇÃO
class Localizacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff493163),
        centerTitle: true,
        title: Image.asset(
          'icone/logoapposto.jpg',
          fit: BoxFit.cover,
          height: 38,
        ),
      ),
      body: WebView(
        initialUrl: 'https://goo.gl/maps/49T4b1pLSoe5gcM2A',
        javascriptMode: JavascriptMode.unrestricted,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  image: DecorationImage(
                    image: AssetImage("icone/logocosmo.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('PONTUAÇÃO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Pontos(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
              title: Text('OFERTAS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Ofertas(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.explore),
              title: Text('LOCALIZAÇÃO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Localizacao(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.extension),
              title: Text('CONVÊNIOS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Convenios(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_gas_station),
              title: Text('AVALIAR ATENDIMENTO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Avaliar(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_bus),
              title: Text('CADASTRO DE VEÍCULOS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cadastro(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text('Esqueci a senha'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Senha(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.import_contacts),
              title: Text('Política de Privacidade'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Politica(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}

/// TELA CONVENIOS
class Convenios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff493163),
        centerTitle: true,
        title: Image.asset(
          'icone/logoapposto.jpg',
          fit: BoxFit.cover,
          height: 38,
        ),
      ),
      body: WebView(
        initialUrl: 'https://postocosmo.com.br/convenios/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  image: DecorationImage(
                    image: AssetImage("icone/logocosmo.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('PONTUAÇÃO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Pontos(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
              title: Text('OFERTAS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Ofertas(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.explore),
              title: Text('LOCALIZAÇÃO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Localizacao(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.extension),
              title: Text('CONVÊNIOS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Convenios(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_gas_station),
              title: Text('AVALIAR ATENDIMENTO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Avaliar(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_bus),
              title: Text('CADASTRO DE VEÍCULOS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cadastro(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text('Esqueci a senha'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Senha(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.import_contacts),
              title: Text('Política de Privacidade'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Politica(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}

/// TELA AVALIAR ATENDIMENTO
class Avaliar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff493163),
        centerTitle: true,
        title: Image.asset(
          'icone/logoapposto.jpg',
          fit: BoxFit.cover,
          height: 38,
        ),
      ),
      body: WebView(
        initialUrl: 'https://postocosmo.com.br/atendimento/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  image: DecorationImage(
                    image: AssetImage("icone/lagoquadrada.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('PONTUAÇÃO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Pontos(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
              title: Text('OFERTAS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Ofertas(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.explore),
              title: Text('LOCALIZAÇÃO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Localizacao(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.extension),
              title: Text('CONVÊNIOS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Convenios(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_gas_station),
              title: Text('AVALIAR ATENDIMENTO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Avaliar(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_bus),
              title: Text('CADASTRO DE VEÍCULOS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cadastro(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text('Esqueci a senha'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Senha(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.import_contacts),
              title: Text('Política de Privacidade'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Politica(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}

/// TELA CADASTRO DE VEÍCULOS
class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff493163),
        centerTitle: true,
        title: Image.asset(
          'icone/logoapposto.jpg',
          fit: BoxFit.cover,
          height: 38,
        ),
      ),
      body: WebView(
        initialUrl: 'https://postocosmo.com.br/cadveiculo/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  image: DecorationImage(
                    image: AssetImage("icone/lagoquadrada.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('PONTUAÇÃO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Pontos(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
              title: Text('OFERTAS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Ofertas(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.explore),
              title: Text('LOCALIZAÇÃO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Localizacao(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.extension),
              title: Text('CONVÊNIOS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Convenios(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_gas_station),
              title: Text('AVALIAR ATENDIMENTO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Avaliar(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_bus),
              title: Text('CADASTRO DE VEÍCULOS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cadastro(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text('Esqueci a senha'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Senha(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.import_contacts),
              title: Text('Política de Privacidade'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Politica(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}

/// TELA ESQUECEU A SENHA
class Senha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff493163),
        centerTitle: true,
        title: Image.asset(
          'icone/logoapposto.jpg',
          fit: BoxFit.cover,
          height: 38,
        ),
      ),
      body: WebView(
        initialUrl: 'https://postocosmo.com.br/minha-conta/lost-password/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  image: DecorationImage(
                    image: AssetImage("icone/lagoquadrada.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('PONTUAÇÃO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Pontos(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
              title: Text('OFERTAS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Ofertas(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.explore),
              title: Text('LOCALIZAÇÃO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Localizacao(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.extension),
              title: Text('CONVÊNIOS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Convenios(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_gas_station),
              title: Text('AVALIAR ATENDIMENTO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Avaliar(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_bus),
              title: Text('CADASTRO DE VEÍCULOS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cadastro(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text('Esqueci a senha'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Senha(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.import_contacts),
              title: Text('Política de Privacidade'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Politica(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}

/// TELA POLITICA DE PRIVACIDADE
class Politica extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff493163),
        centerTitle: true,
        title: Image.asset(
          'icone/logoapposto.jpg',
          fit: BoxFit.cover,
          height: 38,
        ),
      ),
      body: WebView(
        initialUrl:
            'https://postocosmo.com.br/politica-de-privacidade-e-uso-do-sistema/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  image: DecorationImage(
                    image: AssetImage("icone/lagoquadrada.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('PONTUAÇÃO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Pontos(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
              title: Text('OFERTAS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Ofertas(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.extension),
              title: Text('CONVÊNIOS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Convenios(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_gas_station),
              title: Text('AVALIAR ATENDIMENTO'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Avaliar(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.directions_bus),
              title: Text('CADASTRO DE VEÍCULOS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cadastro(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text('Esqueci a senha'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Senha(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.import_contacts),
              title: Text('Política de Privacidade'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Politica(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
