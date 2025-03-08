import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/model/weather_model.dart';

class Forecast7day extends StatelessWidget {
final Forecastday? fd;
  const Forecast7day({super.key, this.fd});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
borderRadius: BorderRadius.circular(20),
        color: Colors.white24,
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(8),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          Image.network("https:${fd?.day?.condition?.icon ?? ""}"),
Expanded(
  child: Text(DateFormat.MMMEd().format(DateTime.parse(fd?.date.toString() ?? "")),style:TextStyle(
    color: Colors.white,
  ),),
),
          Expanded(
            child: Text(fd?.day?.condition?.text.toString() ?? "",style:TextStyle(
              color: Colors.white,
            ),),
          ),

          Text("^${fd?.day?.maxtempC?.round()}/${fd?.day?.mintempC?.round()}",style:TextStyle(
            color: Colors.white,
          ),),

        ],
      ),
    );
  }
}
