import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather/constants/constants.dart';
import 'package:weather/model/weather_model.dart';

class ApiService{

Future<weathermodel> getWeatherdata(String searchtext)async{
  String url ="$base_url&q=$searchtext&days=7";


  try{
    Response response=await get(Uri.parse(url));
    if(response.statusCode==200){
      Map<String,dynamic> json=jsonDecode(response.body);
      weathermodel wm=weathermodel.fromJson(json);
      return wm;

    }
    else{
      throw('No data found');
    }

  }catch(e){

    throw e.toString();
  }

}


}