import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/utils/weather_type.dart';
import 'package:weather/constants/weather%20type.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/service/api_service.dart';
import 'package:weather/ui/forecast7day.dart';
import 'package:weather/ui/hourforecast.dart';
import 'package:weather/ui/todaysweather.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  ApiService apiService=ApiService();
  final _texteditingcontroller=TextEditingController();
  String searchtext="auto:ip";

  _inputdialogue(BuildContext context)async{


    return showDialog(context: context, builder: (context){
       return AlertDialog(
         title: Text('Search Location'),
         content: TextField(
           controller: _texteditingcontroller,
           decoration: InputDecoration(
             hintText: 'Search by city/zipcode/lat'
           ),
         ),
         actions: [
           ElevatedButton(onPressed: (){
             if(_texteditingcontroller.text.isEmpty){
               return;
             }
else
             Navigator.pop(context,_texteditingcontroller.text);
           }, child: Text('Search')),
           ElevatedButton(onPressed: (){
             Navigator.pop(context);

           }, child: Text('Cancel')),



         ],
       );

     });

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()async{
            String text =await _inputdialogue(context);
            setState(() {
              searchtext=text;
            });

          }, icon: Icon(Icons.search,color: Colors.white,)),
          IconButton(onPressed: (){
            searchtext="auto:ip";
            setState(() {

            });

          }, icon: Icon(Icons.my_location,color: Colors.white,)),
        ],
        title: Row(
mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('WeatherNow',style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic),),
            Icon(Icons.cloudy_snowing,color: Colors.yellow,),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(

          child: FutureBuilder(

          future: apiService.getWeatherdata(searchtext),

          builder: (context,snapshot)
          {
            if(snapshot.hasData){
              weathermodel? wm= snapshot.data;
              print("Total forecast days: ${wm?.forecast?.forecastday?.length}");

              return Stack(
                children:[
                  WeatherBg(weatherType: getweathertype(wm?.current),

                      width: MediaQuery.of(context).size.width, height: 718),
                  SizedBox(
                    child: Column(
                      children: [
                        Todaysweather(wm: wm,),
                       Center(child: Text('Hourly Forecast',style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                       ),)),
                        SizedBox(height: 5,),
                        SizedBox(
                          height: 112,
                          child: ListView.builder(itemBuilder: (context,index){

                            Hour? hour = wm?.forecast?.forecastday?[0].hour?[index];
                            return Hourforecast(hour: hour,);
                          },
                          itemCount: wm?.forecast?.forecastday?[0].hour?.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        SizedBox(height: 10,),

                        Text("Weekly Forecast",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                        Expanded(
                          child: ListView.builder(itemBuilder: (context,index){

                            Forecastday? fd = wm?.forecast?.forecastday?[index];
                            return Forecast7day(fd: fd,);
                          },
                            itemCount: wm?.forecast?.forecastday?.length,

                            scrollDirection: Axis.vertical,
                          ),
                        ),


                      ],
                    ),
                  ),
            ],
              );

            }
            if(snapshot.hasError)
              {
                return Center(child: Text('Error has occured'),);

              }
            return Center(child: CircularProgressIndicator(),);

          },
          )
      )

    );
  }
}
