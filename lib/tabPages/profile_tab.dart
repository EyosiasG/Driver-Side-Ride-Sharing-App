import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/global/global.dart';
import 'package:flutterproject/splashScreen/splash_screen.dart';
import 'package:flutterproject/util/driver_preferences.dart';
import 'package:flutterproject/widgets/driver_stats.dart';
import 'package:flutterproject/widgets/profile_widget.dart';

import '../model/driver.dart';

class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({Key? key}) : super(key: key);

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  final driver = DriverPreferences.myDriver;
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('drivers');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
          stream: ref.child(currentFirebaseUser!.uid.toString()).onValue,
          builder: (context, AsyncSnapshot snapshot){
          Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
          return ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ListTile(
                title: Text(map['name']),
              ),
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
          );
        }
      )
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

