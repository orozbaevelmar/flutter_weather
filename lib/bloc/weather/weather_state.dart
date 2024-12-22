part of 'weather_bloc.dart';

sealed class WeathersState extends Equatable {
  const WeathersState();

  @override
  List<Object?> get props => [];
}

class WeathersInitialLoading extends WeathersState {
  final String message;
  const WeathersInitialLoading({required this.message});

  @override
  List<Object> get props => [];
}

class WeathersInitialError extends WeathersState {
  final String message;
  const WeathersInitialError({required this.message});

  @override
  List<Object> get props => [message];
}

class WeathersEmpty extends WeathersState {
  final String emptyListText;
  const WeathersEmpty({required this.emptyListText});

  @override
  List<Object> get props => [emptyListText];
}

class WeathersLoaded extends WeathersState {
  final WeatherModel weatherModel;

  const WeathersLoaded({
    required this.weatherModel,
  });

  @override
  List<Object?> get props => [weatherModel];
}
