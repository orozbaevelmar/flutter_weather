import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/model/weather.dart';
import 'package:flutter_weather/services/weather_handler.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeathersBloc extends Bloc<WeathersEvent, WeathersState> {
  WeathersBloc() : super(const WeathersInitialLoading(message: 'Loading ...')) {
    on<WeathersLoadEvent>(_getProducts);
  }
  WeatherModel weatherModel = WeatherModel();

  _getProducts(WeathersLoadEvent event, emit) async {
    await _goForward(emit, 'В каталоге отсутствует продукт');
  }

  _goForward(emit, String emptyListText) async {
    weatherModel = WeatherModel(
      location: null,
      current: null,
    );

    emit(const WeathersInitialLoading(message: 'Fetching data....'));

    final response = await WeatherHandler.getData();

    response.fold(
      (l) =>
          emit(const WeathersInitialError(message: 'Failed to load products')),
      (r) {
        weatherModel = WeatherModel(
          current: r.current,
          location: r.location,
        );
        bool isEmpty =
            weatherModel.location == null && weatherModel.current == null;
        if (isEmpty) {
          emit(WeathersEmpty(emptyListText: emptyListText));
          return;
        }

        emit(WeathersLoaded(weatherModel: weatherModel));
      },
    );
  }
}
