import 'package:flutter/material.dart';
import 'package:appostocosmo/services/firebase_service.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
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
                  color: Color(0xff493163),
                  image: DecorationImage(
                    image: AssetImage("icone/logocosmo.png"),
                    fit: BoxFit.none,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
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
              leading: Icon(Icons.group_add),
              title: Text('CADASTRAR'),
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
                  color: Color(0xff493163),
                  image: DecorationImage(
                    image: AssetImage("icone/logocosmo.png"),
                    fit: BoxFit.none,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
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
              leading: Icon(Icons.group_add),
              title: Text('CADASTRAR'),
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
                  color: Color(0xff493163),
                  image: DecorationImage(
                    image: AssetImage("icone/logocosmo.png"),
                    fit: BoxFit.none,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
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
              leading: Icon(Icons.group_add),
              title: Text('CADASTRAR'),
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
        initialUrl: 'https://goo.gl/maps/jomGo62oqqatcRsJ6',
        javascriptMode: JavascriptMode.unrestricted,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                  color: Color(0xff493163),
                  image: DecorationImage(
                    image: AssetImage("icone/logocosmo.png"),
                    fit: BoxFit.none,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
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
              leading: Icon(Icons.group_add),
              title: Text('CADASTRAR'),
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
                  color: Color(0xff493163),
                  image: DecorationImage(
                    image: AssetImage("icone/logocosmo.png"),
                    fit: BoxFit.none,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
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
              leading: Icon(Icons.group_add),
              title: Text('CADASTRAR'),
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
        initialUrl:
            'https://www.google.com/search?sxsrf=ALeKk01wKNFV_M7OmVGMuyY-OZ155bK7dA%3A1602005319974&ei=R6l8X9OKO6Sy5OUP7tmOqAc&q=posto+cosmo+itaporanga&oq=posto+cosmo+i&gs_lcp=CgZwc3ktYWIQARgAMgIIADoGCAAQFhAeULeJAVjkiQFgkpYBaABwAHgAgAH9AYgBqwWSAQUwLjEuMpgBAKABAaoBB2d3cy13aXrAAQE&sclient=psy-ab#lrd=0x7a69dff95e70c77:0x3f7d77753619f4af,3,,,',
        javascriptMode: JavascriptMode.unrestricted,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                  color: Color(0xff493163),
                  image: DecorationImage(
                    image: AssetImage("icone/logocosmo.png"),
                    fit: BoxFit.none,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
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
              leading: Icon(Icons.group_add),
              title: Text('CADASTRAR'),
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

/// TELA CADASTRO
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
        initialUrl: 'https://postocosmo.com.br/registro/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(''),
              decoration: BoxDecoration(
                  color: Color(0xff493163),
                  image: DecorationImage(
                    image: AssetImage("icone/logocosmo.png"),
                    fit: BoxFit.none,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
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
              leading: Icon(Icons.group_add),
              title: Text('CADASTRAR'),
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
                  color: Color(0xff493163),
                  image: DecorationImage(
                    image: AssetImage("icone/logocosmo.png"),
                    fit: BoxFit.none,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
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
              leading: Icon(Icons.group_add),
              title: Text('CADASTRAR'),
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
                  color: Color(0xff493163),
                  image: DecorationImage(
                    image: AssetImage("icone/logocosmo.png"),
                    fit: BoxFit.none,
                  )),
            ),
            ListTile(
              leading: Icon(Icons.local_offer),
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
              leading: Icon(Icons.group_add),
              title: Text('CADASTRAR'),
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
