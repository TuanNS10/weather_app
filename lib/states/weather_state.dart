import 'package:equatable/equatable.dart';
import 'package:weather_app/model/weather.dart';

abstract class WeatherState extends Equatable{
  const WeatherState();
  @override
  List<Object> get props => [];
}
class WeatherStateInitial extends WeatherState{}
class WeatherStateLoading extends WeatherState{}
class WeatherStateSuccess extends WeatherState{
  final Weather weather;
  const WeatherStateSuccess({required this.weather}): assert(weather != null);
  @override
  List<Object> get props => [weather];
}
class WeatherStateFailure extends WeatherState{}