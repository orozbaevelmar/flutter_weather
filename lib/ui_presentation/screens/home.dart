import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/bloc/weather/weather_bloc.dart';
import 'package:flutter_weather/constants/color.dart';
import 'package:flutter_weather/constants/text_style.dart';
import 'package:flutter_weather/model/weather.dart';
import 'package:flutter_weather/ui_presentation/widgets/center_text.dart';
import 'package:flutter_weather/ui_presentation/widgets/valid_image_url.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _timer = Timer.periodic(const Duration(hours: 1), (timer) {
      context.read<WeathersBloc>().add(WeathersLoadEvent());
    });
    super.initState();
  }

  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBloc()),
    );
  }

  Widget _buildBloc() {
    return BlocBuilder<WeathersBloc, WeathersState>(
      builder: (context, state) {
        return switch (state) {
          WeathersInitialLoading() =>
            const Center(child: CircularProgressIndicator()),
          WeathersInitialError() => CenterText(text: state.message),
          WeathersEmpty() => CenterText(text: state.emptyListText),
          WeathersLoaded() => _buildWeather(context, state.weatherModel),
        };
      },
    );
  }

  Widget _buildWeather(context, WeatherModel weatherModel) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, size: 30),
                SizedBox(width: 10),
                Text(
                  weatherModel.location?.region ?? 'Неизвестно',
                  style: MTextStyle.big(MColor.black),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text(weatherModel.location?.localtime ?? 'Неизвестно',
                style: MTextStyle.small(MColor.black)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.07),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ValidImageUrl(
                  imageUrl: weatherModel.current?.condition?.icon ?? '',
                  size: 70,
                  borderRadius: BorderRadius.circular(15),
                ),
                SizedBox(width: 20),
                Text(
                    weatherModel.current?.temp_c != null
                        ? '${weatherModel.current?.temp_c}°'
                        : 'Неизвестно',
                    style: MTextStyle.medium(MColor.black)),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Обнов.', style: MTextStyle.small(MColor.black)),
                SizedBox(width: 10),
                Text(weatherModel.current?.last_updated ?? 'Неизвестно',
                    style: MTextStyle.small(MColor.black)),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            ListTile(
              title: Text(
                'Cкорость ветра, км/ч',
                style: MTextStyle.small(MColor.black),
              ),
              trailing: Text(
                '${weatherModel.current?.windKph}',
                style: MTextStyle.small(MColor.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
