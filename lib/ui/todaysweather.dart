import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:intl/intl.dart';
import 'package:weather/model/weather_model.dart';

class Todaysweather extends StatelessWidget {
  final weathermodel? wm;
  const Todaysweather({super.key, this.wm});

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
            width: double.infinity,
            height: 305,
            child: Column(
              children: [
                SizedBox(height: 2,),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Text(wm?.location?.name ?? "",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,

                      ),),
                      Text(DateFormat.yMMMMEEEEd().format(DateTime.parse(wm?.current?.lastUpdated ?? "")),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,

                        ),),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 30,),
                  Container(
                    width: 80,
                    decoration:BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white10,

                    ),
                    child: Image.network(

                        "https:${wm?.current?.condition?.icon ?? ""}"

                    ),
                  ),
Spacer(),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: Text(wm?.current?.tempC?.round().toString() ?? "",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 60,
                                color: Colors.pink,

                              ),),
                            ),
                            Text("o",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.pink,
                        
                            ),
                            ),
                          ],
                        ),
                        Text(wm?.current?.condition?.text ?? "",style:
                        TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                        ),),
                      ],
                    ),
                    const SizedBox(width: 20,)
                ],),
                Container(
                  margin: EdgeInsets.only(top: 8,left: 15,right: 15),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(30),

                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.thermostat,color: Colors.white,size: 15,),

                                  Text(" Feels like",style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                  ),),
                                ],
                              ),
                              Text(wm?.current?.feelslikeC?.round().toString() ?? "",style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),),
                            ],
                          ),
                          Column(

                            children: [

                              Row(

                                children: [
                                  Icon(Icons.cyclone,color: Colors.white,size: 15,),
                                  Text(" Wind",style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                  ),),
                                ],
                              ),
                              Text(" ${wm?.current?.windKph?.toString()} Km/h",style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height:10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.water_drop_outlined,color: Colors.white,size: 15,),
                                  Text(" Humidity",style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                  ),),
                                ],
                              ),
                              Text("   ${wm?.current?.humidity?.round().toString() ?? ""}%",style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),),
                            ],
                          ),
                          Column(
                            children: [

                              Row(
                                children: [
                                  Icon(Icons.visibility,color: Colors.white,size: 15,),
                                  Text(" Visibility",style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                  ),),
                                ],
                              ),
                              Text("    ${wm?.current?.visKm?.toString()} Km",style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),


              ],
            ),





      );
  }
}
