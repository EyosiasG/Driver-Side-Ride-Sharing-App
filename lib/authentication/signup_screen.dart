import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/authentication/car_info_screen.dart';
import 'package:flutterproject/widgets/progress_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../global/global.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  validateForm()
  {
    if(nameTextEditingController.text.length < 3){
      Fluttertoast.showToast(msg: "name must be atleast 3 characters.");
    }
    else if(!emailTextEditingController.text.contains("@")){
      Fluttertoast.showToast(msg: "email is not valid.");
    }
    else if(phoneTextEditingController.text.isEmpty){
      Fluttertoast.showToast(msg: "phone number is required.");
    }
    else if(passwordTextEditingController.text.length < 8){
      Fluttertoast.showToast(msg: "password must be at least 8 characters.");
    }
    else{
     saveDriverInfo();
    }
  }

  saveDriverInfo() async
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c){
          return ProgressDialog(message: "Processing, Pleasa wait...",);
        }
    );

    final User? firebaseUser = (
        await fAuth.createUserWithEmailAndPassword(
            email: emailTextEditingController.text.trim(),
            password: passwordTextEditingController.text.trim(),
        ).catchError((msg){
          Navigator.pop(context);
          Fluttertoast.showToast(msg: "Error: " + msg.toString());

        })
    ).user;

    if(firebaseUser != null){
      Map driverMap =
      {
        "id": firebaseUser.uid,
        "name" : nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": phoneTextEditingController.text.trim(),
      };

      DatabaseReference driverRef = FirebaseDatabase.instance.ref().child("drivers");
      driverRef.child(firebaseUser.uid).set(driverMap);

      currentFirebaseUser = firebaseUser;
      Fluttertoast.showToast(msg: "Account has been created!");
      Navigator.push(context, MaterialPageRoute(builder: (c)=> CarInfoScreen() ));
    }
    else{
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Account has not been created!");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(

            children: [
              const SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("images/splashScreen.jpg"),
              ),

              const SizedBox(height: 10,),

              const Text(
                "Register as a Driver",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: nameTextEditingController,
                style: const TextStyle(
                  color: Colors.grey
                ),
                decoration: InputDecoration(
                  labelText: "Full Name",
                  hintText: "Full Name",

                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                  ),
                  hintStyle: const TextStyle(
                    color:Colors.grey,
                    fontSize: 10,
                  ),
                  labelStyle: const TextStyle(
                    color:Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                    color: Colors.grey
                ),
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Email",

                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                  ),
                  hintStyle: const TextStyle(
                    color:Colors.grey,
                    fontSize: 10,
                  ),
                  labelStyle: const TextStyle(
                    color:Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: phoneTextEditingController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(
                    color: Colors.grey
                ),
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  hintText: "Phone Number",

                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                  ),
                  hintStyle: const TextStyle(
                    color:Colors.grey,
                    fontSize: 10,
                  ),
                  labelStyle: const TextStyle(
                    color:Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: passwordTextEditingController,
                keyboardType: TextInputType.text,
                obscureText: true,
                style: const TextStyle(
                    color: Colors.grey
                ),
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Password",

                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                  ),
                  hintStyle: const TextStyle(
                    color:Colors.grey,
                    fontSize: 10,
                  ),
                  labelStyle: const TextStyle(
                    color:Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 50,
                width:300,
                child: ElevatedButton(
                    onPressed: (){
                      validateForm();
                      //Navigator.push(context, MaterialPageRoute(builder: (c)=> CarInfoScreen()));

                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent,
                      elevation: 3,
                      shape: RoundedRectangleBorder( //to set border radius to button
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,

                      ),
                    )),
              )

            ],
          ),
        ),
      )
    );
  }
}
