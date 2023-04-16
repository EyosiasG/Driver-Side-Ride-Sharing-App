import 'package:flutter/material.dart';
import 'package:flutterproject/global/global.dart';
import 'package:flutterproject/splashScreen/splash_screen.dart';
import 'package:flutterproject/util/driver_preferences.dart';
import 'package:flutterproject/widgets/driver_stats.dart';
import 'package:flutterproject/widgets/profile_widget.dart';

import '../model/driver.dart';

class ProfileTabPage extends StatelessWidget {

  final driver = DriverPreferences.myDriver;

  const ProfileTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 15,),
          const Text(
            "My Profile",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
          ),
          const SizedBox(height: 15,),
          ProfileWidget(
              imagePath: driver.imagePath,
              onClicked: () async {}),

          const SizedBox(height: 20,),
          buildName(driver),
          const SizedBox(height: 24,),
          DriverStats(),
        ],



        /*child: ElevatedButton(
          child: Text(
            "Sign Out",
          ),
          onPressed: (){
            fAuth.signOut();
            Navigator.push(context, MaterialPageRoute(builder: (c) => const MySplashScreen()));
          },*/
      ),
    );
  }

  Widget buildName(Driver driver) => Column(
    children: [
      Text(
        driver.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      const SizedBox(height: 5,),
      Text(
        driver.email,
        style: const TextStyle(
            color:  Colors.grey
        ),
      )
    ],
  );


}

