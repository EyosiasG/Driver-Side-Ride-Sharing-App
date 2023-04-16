import 'package:flutter/material.dart';
import 'package:flutterproject/tabPages/trip_history_tab.dart';

class TripHistoryDetails extends StatelessWidget {
  const TripHistoryDetails({Key? key, required this.trip}) : super(key: key);

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 24,),
                  const Text(
                      "Trip Details",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                     Image.asset(
                            "images/PickUpDestination.png",
                            width: 40,
                            height: 70,
                     ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "4-Kilo Campus",
                            textAlign: TextAlign.left
                            ,
                          ),
                          SizedBox(height: 30),
                          Text(
                              "Lafto View Negd Bank"
                          ),
                        ],
                      ),

                    ],
                  ),
                  SizedBox(height: 15,),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Row(
                          children: [
                          Icon(Icons.attach_money),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              "Total Fair :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "365 Br."
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(Icons.event_seat),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              "Seats :",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                                "4"
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Divider(),

                ],
              ),
            )
        )
    );

  }
}
