import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
import 'services/firebase_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final Completer<WebViewController> _controller = Completer<WebViewController>();
  bool _isLoading = false;

  String _hostUrl = "https://postocosmo.com.br/";
  String _logoPath = "icone/logocosmo.png";
  String _appPostoLogoPath = "icone/logoapposto.jpg";
  String _urlLocalizacao = "https://goo.gl/maps/49T4b1pLSoe5gcM2A";

  @override
  Widget build(BuildContext context) {
    FirebaseService fBService = FirebaseService.shared;
    if (Platform.isIOS) {
      fBService.requestNotificationToken((accepted, service) {});
    }
    fBService.requestToken().then((value) {
      fBService.fcmToken = value;
      print("TOKENNNNNNN: $value");
    });

    var body = 
    Stack(
      children: [
        WebView(
          onPageFinished: (url) {
            print("should update loader to false .... /n/n");
            _toggleLoader(false);
          },
          initialUrl: _hostUrl + 'new/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          }
        ),
        _isLoading ? Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: Center(
            child: Container(
              width: 80,
              height: 80,
              child: CircularProgressIndicator()
            ),
          ),
        )
        : Stack(),
      ]
    );

    OfflineBuilder offBuilder = OfflineBuilder(
      child: body,
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;

        return Stack(
          children: [
            body,
            !connected ?
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black,
              child: Center(
                child: Container(
                  child: Text(
                    "Você está sem internet!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                  ),
                ),
              ),
            ): Stack()
          ],
        );
      },
    );


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff493163),
        centerTitle: true,
        title: Image.asset(
          _appPostoLogoPath,
          fit: BoxFit.cover,
          height: 38,
        ),
      ),
      body: offBuilder,
      drawer: _buildDrawer(),
    );
  }

  _toggleLoader(bool state) {
    print("updating loader to ${!_isLoading}");
    _isLoading = state;
    setState(() {});
    // Future.delayed(Duration(seconds: 4), () {
    //   _isLoading = false;
    //   setState(() {});
    // });

  } 

  Widget _buildListTileItem(String title, Icon icon, String url) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(fontSize: 16.0),
      ),
      onTap: () {
        setState(() {
          _controller.future.then((c) {
            print("will load new url $url");
            c.loadUrl(url);
          });          
          Navigator.pop(context);  
          _toggleLoader(true);
        });
      },
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        children: [
          DrawerHeader(
            child: Text(''),
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              image: DecorationImage(
                image: AssetImage(_logoPath),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          _buildListTileItem(
            "PONTUAÇÃO",
            Icon(Icons.credit_card),
            _hostUrl + 'minha-conta/points-and-rewards/',
          ),
          _buildListTileItem(
            "OFERTAS",
            Icon(Icons.local_offer),
            _hostUrl + 'ofertas/',
          ),
          _buildListTileItem(
            "LOCALIZAÇÃO",
            Icon(Icons.explore),
            _urlLocalizacao,
          ),
          _buildListTileItem(
            "CONVÊNIOS",
            Icon(Icons.extension),
            _hostUrl + 'convenios/',
          ),
          _buildListTileItem(
            "AVALIAR ATENDIMENTO",
            Icon(Icons.local_gas_station),
            _hostUrl + 'atendimento/',
          ),
          _buildListTileItem(
            'POLÍTICA DE PRIVACIDADE',
            Icon(Icons.import_contacts),
            _hostUrl + 'politica-de-privacidade-e-uso-do-sistema/',
          ),
        ],
      ),
    );
  }
}