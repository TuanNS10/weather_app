import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable{}
class SettingsEventToggUnit extends SettingsEvent{
  @override
  List<Object> get props => [];
}