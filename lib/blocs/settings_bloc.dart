import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/events/settings_event.dart';
import 'package:weather_app/states/settings_state.dart';

class SettingBloc extends Bloc<SettingsEvent, SettingState> {
  //initial State
  SettingBloc() : super(SettingState(temperatureUnit: TemperatureUnit.celsius));

  @override
  Stream<SettingState> mapEventToState(SettingsEvent settingsEvent) async* {
    if (settingsEvent is SettingsEventToggUnit) {
      //state = 'setting state'
      yield SettingState(
          temperatureUnit: state.temperatureUnit == TemperatureUnit.celsius
              ? TemperatureUnit.fahrenheit
              : TemperatureUnit.celsius);
    }
  }
}
