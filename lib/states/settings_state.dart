import 'package:equatable/equatable.dart';

enum TemperatureUnit { fahrenheit, celsius }

class SettingState extends Equatable {
  final TemperatureUnit temperatureUnit;

  const SettingState({required this.temperatureUnit})
      : assert(temperatureUnit != null);

  @override
  List<Object> get props => [];
}
