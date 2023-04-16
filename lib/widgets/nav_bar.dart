import 'package:flutter/material.dart';
import 'package:flutterproject/authentication/login_screen.dart';

import '../global/global.dart';
import '../splashScreen/splash_screen.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Abebe Bekele'),
            accountEmail: Text('ab@gmail.com'),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://images.unsplash.com/photo-1517849845537-4d257902454a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
                  width: 90,
                  height: 90,
                  fit:BoxFit.cover,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('My Profile'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('New Ride'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Requests'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.support),
            title: Text('Support'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.policy),
            title: Text('Policies'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              fAuth.signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginScreen.idScreen, (route) => false);

    }
          ),
          Divider(),

        ],
      ),


    );
  }
}
