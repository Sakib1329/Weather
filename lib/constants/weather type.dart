import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:weather/model/weather_model.dart';

WeatherType getweathertype(Current? curernt){
  if(curernt?.isDay==1){
if(curernt?.condition?.text=="Sunny"){
  return WeatherType.sunny;
}
else if(curernt?.condition?.text=="Overcast"){
  return WeatherType.overcast;
}
else if(curernt?.condition?.text=="Partly Cloudy"){
  return WeatherType.cloudy;
}else if(curernt?.condition?.text=="Cloudy"){
  return WeatherType.cloudy;}
else if(curernt?.condition?.text=="Mist"){
  return WeatherType.lightSnow;
}
else if(curernt!.condition!.text!.contains("thunder")) {
  return WeatherType.thunder;
}
else if(curernt!.condition!.text!.contains("thunder")) {
  return WeatherType.thunder;
}
else if(curernt!.condition!.text!.contains("rainy")) {
  return WeatherType.heavyRainy;
}
else if(curernt!.condition!.text!.contains("showers")) {
  return WeatherType.middleSnow;
}
else if(curernt?.condition?.text=="Clear"){
  return WeatherType.sunny;
}
  }
  else{

    if(curernt?.condition?.text=="Sunny"){
      return WeatherType.sunnyNight;
    }
    else if(curernt?.condition?.text=="Overcast"){
      return WeatherType.overcast;
    }
    else if(curernt?.condition?.text=="Partly Cloudy"){
      return WeatherType.cloudy;
    }else if(curernt?.condition?.text=="Cloudy"){
      return WeatherType.cloudy;}
    else if(curernt?.condition?.text=="Mist"){

      return WeatherType.lightSnow;
    }
    else if(curernt!.condition!.text!.contains("thunder")) {
      return WeatherType.thunder;
    }
    else if(curernt!.condition!.text!.contains("thunder")) {
      return WeatherType.thunder;
    }
    else if(curernt!.condition!.text!.contains("rainy")) {
      return WeatherType.heavyRainy;
    }
    else if(curernt!.condition!.text!.contains("showers")) {
      return WeatherType.middleSnow;
    }
    else if(curernt?.condition?.text=="Clear"){
      return WeatherType.sunnyNight;
    }


  }




return WeatherType.thunder;

}