import 'dart:ui';
import 'package:flutter/material.dart';

class DrawerItemBuilder {
  late String title;
  late Icon icon;
  late Function onTap;

  DrawerItemBuilder(String title, Icon icon, Function onTap) {
    this.title = title;
    this.icon = icon;
    this.onTap = onTap;
  }
}

class CustomDrawer extends StatefulWidget {
  final List<DrawerItemBuilder> items;
  final AssetImage headerImage;

  CustomDrawer(this.items, this.headerImage);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  Widget build(BuildContext context) {
    List<Widget> options = [];

    widget.items.forEach((i) {
      options.add(_buildListTile(i));
    });

    return Drawer(
      child: ListView(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        children: <Widget>[
              DrawerHeader(
                child: Text(''),
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  image: DecorationImage(
                    image: widget.headerImage,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ] +
            options,
      ),
    );
  }

  Widget _buildListTile(DrawerItemBuilder itemBuilder) {
    return ListTile(
      leading: itemBuilder.icon,
      title: Text(itemBuilder.title, style: TextStyle(fontSize: 16.0)),
      onTap: () {
        itemBuilder.onTap();
      },
    );
  }
}
