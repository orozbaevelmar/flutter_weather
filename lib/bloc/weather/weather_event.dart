part of 'weather_bloc.dart';

sealed class WeathersEvent extends Equatable {
  const WeathersEvent();

  @override
  List<Object> get props => [];
}

class WeathersLoadEvent extends WeathersEvent {
  @override
  List<Object> get props => [];
}
