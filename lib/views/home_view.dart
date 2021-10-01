import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:appostocosmo/views/chat/chat_validation_view.dart';
import 'package:appostocosmo/views/components/custom_drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/firebase_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool _isLoading = false;

  String _hostUrl = "https://app.postocosmo.com.br/";
  String _logoPath = "icone/logocosmo.png";
  String _appPostoLogoPath = "icone/logoapposto.jpg";
  String _urlLocalizacao = "https://goo.gl/maps/49T4b1pLSoe5gcM2A";

  @override
  Widget build(BuildContext context) {
    FirebaseService fBService = FirebaseService.shared;
    fBService.requestNotificationToken((accepted, service) {});
    fBService.requestToken().then((value) {
      fBService.fcmToken = value;
      print("TOKENNNNNNN: $value");
    });

    var body = Stack(children: [
      WebView(
          onPageFinished: (url) {
            print("should update loader to false .... /n/n");
            _toggleLoader(false);
          },
          initialUrl: _hostUrl,
          javascriptMode: JavascriptMode.unrestricted,
          navigationDelegate: (NavigationRequest request) {
            String urlChange = request.url;

            if (urlChange.contains('instagram') ||
                urlChange.contains('wa.me') ||
                urlChange.contains('maps.app.goo.gl')) {
              _redirect(request.url);
              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          }),
      _isLoading
          ? Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black,
              child: Center(
                child: Container(
                  width: 80,
                  height: 80,
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          : Stack(),
    ]);

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
            !connected
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black,
                    child: Center(
                      child: Container(
                        child: Text(
                          "Você está sem internet!",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  )
                : Stack()
          ],
        );
      },
    );

    return WillPopScope(
      onWillPop: () {
        _controller.future.then((value) => value.goBack());
        return Future.value(false);
      },
      child: Scaffold(
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
      ),
    );
  }

  CustomDrawer _buildDrawer() {
    tapMenu(String url) {
      setState(() {
        _controller.future.then((c) {
          c.loadUrl(url);
        });
        Navigator.pop(context);
        _toggleLoader(true);
      });
    }

    goTo(Widget screen) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    }

    List<DrawerItemBuilder> items = [
      DrawerItemBuilder("OFERTAS", Icon(Icons.local_offer), () {
        tapMenu(_hostUrl + 'ofertas/');
      }),
      DrawerItemBuilder("MEUS DADOS", Icon(Icons.person), () {
        tapMenu(_hostUrl + 'my-account-2/');
      }),
      DrawerItemBuilder("LOCALIZAÇÃO", Icon(Icons.explore), () {
        tapMenu(_urlLocalizacao);
      }),
      DrawerItemBuilder("PARCEIROS", Icon(Icons.group), () {
        tapMenu(_hostUrl + 'convenios/');
      }),
      DrawerItemBuilder("CONVÊNIOS", Icon(Icons.extension), () {
        tapMenu(_hostUrl + 'grupos/');
      }),
      DrawerItemBuilder("AVALIAR ATENDIMENTO", Icon(Icons.local_gas_station),
          () {
        tapMenu(_hostUrl + 'atendimento/');
      }),
      DrawerItemBuilder("POLÍTICA DE PRIVACIDADE", Icon(Icons.import_contacts),
          () {
        tapMenu(_hostUrl + 'politica-de-privacidade-e-uso-do-sistema/');
      }),
      DrawerItemBuilder("FALE CONOSCO", Icon(Icons.support), () {
        goTo(ChatValidationView());
      }),
    ];

    return CustomDrawer(items, AssetImage(_logoPath));
  }

  _redirect(String url) {
    if (url.contains("instagram") || url.contains("wa.me")) {
      _launchURL(url);
    } else if (url.contains("maps")) {
      _launchURL(url
          .split("link=")
          .last
          .replaceAll("%2F", "/")
          .replaceAll("%3A", ":"));
    }
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
}
