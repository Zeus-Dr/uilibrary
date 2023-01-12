// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:uilibrary/pages/home_page.dart';
import 'package:uilibrary/pages/login.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: MediaQuery.of(context).size.width / 2 + 30,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          //close navigation drawer before
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
        },
        child: Container(
            child: Container(
              padding: EdgeInsets.only(
                bottom: 24,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 52,
                    backgroundImage: ExactAssetImage(
                        'lib/images/fce0f6027d2fcbbd232fddcd71873f03.jpg'),
                  ),
                  SizedBox(height: 12),
                  Text('Mwesigye Joseph'),
                  Divider(
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top)),
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text('Home'),
            onTap: () {
              //close navigation drawer before
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text('Favorites'),
            onTap: () {
              //Navigate to Favorites Page
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications_none_outlined),
            title: Text('Notifications'),
            onTap: () {
              //Navigate to Favorites Page
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              //Navigate to Settings page
            },
          ),
          ListTile(
            leading: Icon(Icons.dark_mode_outlined),
            title: Text('Theme'),
            onTap: () {
              //Change Theme
            },
          ),
        ],
      ),
    );
  }
}
