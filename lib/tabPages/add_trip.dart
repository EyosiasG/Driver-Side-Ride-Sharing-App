import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';


import '../components/number_stepper.dart';
import '../components/text_field.dart';
import '../global/global.dart';

class AddTrip extends StatefulWidget {
  const AddTrip({Key? key}) : super(key: key);

  @override
  State<AddTrip> createState() => _AddTripState();
}

class _AddTripState extends State<AddTrip> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController pickUpLocationEditingController = TextEditingController();
  TextEditingController dropOffLocationEditingController = TextEditingController();

  var _selectedSeats = 0;
  var _dateTime = DateTime.now();
  var _timeOfDay = TimeOfDay.now();
  static const uuid = Uuid();
  String? tripId = uuid.v4() + currentFirebaseUser!.uid.toString();

  saveTripInfo(){
    Map driverTripMap =
    {
      "id": tripId,
      "driver_id": currentFirebaseUser!.uid.toString(),
      "pick_up": pickUpLocationEditingController.text.trim(),
      "drop_off" : dropOffLocationEditingController.text.trim(),
      "seats": _selectedSeats,
      "date": _dateTime,
      "time": _timeOfDay,
    };


    DatabaseReference driverRef = FirebaseDatabase.instance.ref().child("trips");
    driverRef.child(tripId!).set(driverTripMap);
    Fluttertoast.showToast(msg: "Trip Details has been saved");

  }


  void _showDatePicker(BuildContext context){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2024)
    ).then((value){
      setState((){
      _dateTime = value!;
      });
    });
  }

  void _showTimePicker(BuildContext context){
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value){
      _timeOfDay = value!;
    }
    );
  }

  String _formatDate(DateTime dateTime){
    return DateFormat.yMMMEd().format(dateTime);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
              children: [
                const SizedBox(height: 24,),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/PickUpDestination.png",
                      width: 20,
                      height: 100,
                    ),
                    new Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          children: [
                            TextFieldForm(
                              text: "Pick-Up Location",
                              controller: pickUpLocationEditingController,
                              capitalization: TextCapitalization.none,
                              textInputType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                            ),
                            SizedBox(height: 2,),
                            TextFieldForm(
                              text: "Drop-Off Location",
                              controller: dropOffLocationEditingController,
                              capitalization: TextCapitalization.none,
                              textInputType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Text(currentFirebaseUser!.displayName.toString()),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Date:"),
                    Text(_formatDate(_dateTime)),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: IconButton(
                          onPressed: (){
                            _showDatePicker(context);
                          },
                          icon: new Icon(Icons.edit_calendar)
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Time:"),
                    Text(_timeOfDay.format(context).toString()),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: IconButton(
                          onPressed: (){
                            _showTimePicker(context);
                          },
                          icon: new Icon(Icons.watch)
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Text("Seats"),
                NumberStepper(
                    initialValue: _selectedSeats,
                    min: 1,
                    max: 6,
                    step: 1,
                    onChanged: (value){
                      setState(){
                        _selectedSeats = value;
                      }

                    }
                ),
                SizedBox(
                  height: 50,
                  width: 350,
                  child: ElevatedButton(
                      onPressed: (){
                        saveTripInfo();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.greenAccent,
                        elevation: 3,
                        shape: RoundedRectangleBorder( //to set border radius to button
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      child: const Text(
                        "Create Trip",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,

                        ),
                      )),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
