import 'package:equatable/equatable.dart';

enum WeatherCondition {
  snow,
  sleet,
  hail,
  thunderstorm,
  heavyRain,
  lightRain,
  showers,
  heavyCloud,
  lightCloud,
  clear,
  unknown
}

class Weather extends Equatable {
  final WeatherCondition weatherCondition;
  final String formattedCondition;
  final double mainTemp;
  final double temp;
  final double maxTemp;
  final int locationId;
  final String created;
  final DateTime lastUpdated;
  final String location;

  Weather({
    required this.weatherCondition,
    required this.formattedCondition,
    required this.mainTemp,
    required this.temp,
    required this.maxTemp,
    required this.locationId,
    required this.created,
    required this.lastUpdated,
    required this.location,
});

  @override
  // TODO: implement props
  List<Object> get props => [
        weatherCondition,
        formattedCondition,
        mainTemp,
        temp,
        maxTemp,
        locationId,
        created,
        lastUpdated,
        location
      ];

  //convert form Json to Weather Object
/*
{
   "consolidated_weather":[
      {
         "id":4610365921951744,
         "weather_state_name":"Light Rain",
         "weather_state_abbr":"lr",
         "wind_direction_compass":"WNW",
         "created":"2021-09-26T01:03:20.183110Z",
         "applicable_date":"2021-09-25",
         "min_temp":10.935,
         "max_temp":20.355,
         "the_temp":19.619999999999997,
         "wind_speed":7.62251166152337,
         "wind_direction":285.1187107090369,
         "air_pressure":1016.5,
         "humidity":42,
         "visibility":12.721953789867175,
         "predictability":75
      },
  */

  factory Weather.fromJson(dynamic jsonObject) {
    final consolidatedWeather = jsonObject['consolidated_weather'][0];
    return Weather(
        weatherCondition: _mapStringToWeatherCondition(
            consolidatedWeather['weather_state_abbr']),
        formattedCondition: consolidatedWeather['weather_state_name'],
        mainTemp: consolidatedWeather['min_temp'] as double,
        temp: consolidatedWeather['the_temp'] as double,
        maxTemp: consolidatedWeather['max_temp'] as double,
        locationId: consolidatedWeather['woeid'] as int ,
        created: consolidatedWeather['created'],
        lastUpdated: DateTime.now(),
        location: jsonObject['title']);
  }

  static WeatherCondition _mapStringToWeatherCondition(String inputString) {
    Map<String, WeatherCondition> map = {
      'sn': WeatherCondition.snow,
      'sl': WeatherCondition.sleet,
      'h': WeatherCondition.hail,
      't': WeatherCondition.thunderstorm,
      'hr': WeatherCondition.heavyRain,
      'lr': WeatherCondition.lightRain,
      's': WeatherCondition.showers,
      'hc': WeatherCondition.heavyCloud,
      'lc': WeatherCondition.lightCloud,
      'c': WeatherCondition.clear
    };
    return map[inputString] ?? WeatherCondition.unknown;
  }
}
