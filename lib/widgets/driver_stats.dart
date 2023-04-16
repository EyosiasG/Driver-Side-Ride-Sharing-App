import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/main.dart';
import 'package:flutterproject/model/driver.dart';

class DriverStats extends StatelessWidget {

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
      child:Row (
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, '4.5', 'Rating'),
          buildDivider(),
          buildButton(context, '4500 km', 'Mileage'),
        ],
      )
  );
  Widget buildDivider() => Container(
      height: 24,
      child: VerticalDivider()
  );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: (){},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 2,),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        )
      );


}

