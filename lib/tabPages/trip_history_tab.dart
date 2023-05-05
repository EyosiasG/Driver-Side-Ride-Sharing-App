import 'package:flutter/material.dart';
import 'package:flutterproject/tabPages/trip_history_details.dart';

class TripHistoryTabPage extends StatefulWidget {
  const TripHistoryTabPage({Key? key}) : super(key: key);

  @override
  State<TripHistoryTabPage> createState() => _TripHistoryTabPageState();
}
class Trip{
  final String destination;
  final String date;

  const Trip({
    required this.destination,
    required this.date
});
}
class _TripHistoryTabPageState extends State<TripHistoryTabPage> {
  List<Trip> trips = [
    const Trip(
        destination: 'HiLCoe',
        date : 'March 15, 2020 at 3:50 AM'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: trips.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index){
            final trip = trips[index];
            return Card(
                shadowColor: Colors.transparent,
                elevation: 0,
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListTile(
                title : Text('Destination $index',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
                subtitle:RichText(
                    text: const TextSpan(
                        text: "4th April , 2023 at 10:37AM",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                              text: "\nFinished",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.green,
                                  fontSize: 15)
                          )
                        ])
                ),
                trailing: const Icon(Icons.arrow_forward),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TripHistoryDetails(trip:trip),
                  ));
                },
              ),
            ),

            );
          }

          ),
    );
  }
}
