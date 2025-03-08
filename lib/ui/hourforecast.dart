import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/model/weather_model.dart';

class Hourforecast extends StatelessWidget {
  final Hour? hour;
  const Hourforecast({super.key, this.hour});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
width: 80,
child: Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,

  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: Text(hour?.tempC?.round().toString() ?? "",style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
        ),
        Text("o",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white),)


      ],
    ),

    Container(
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[900],

      ),
      child: Image.network("https:${hour?.condition?.icon ?? ""}"),
    ),
    Text(DateFormat.j().format(DateTime.parse(hour?.time ?? "")),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),),

  ],
)
    );
  }
}
