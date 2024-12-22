// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WeatherModel {
  Location? location;
  Current? current;

  WeatherModel({this.location, this.current});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'location': location?.toMap(),
      'current': current?.toMap(),
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      location: map['location'] != null
          ? Location.fromMap(map['location'] as Map<String, dynamic>)
          : null,
      current: map['current'] != null
          ? Current.fromMap(map['current'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Location {
  String? name;
  String? region;
  String? country;
  String? localtime;
  Location({
    this.name,
    this.region,
    this.country,
    this.localtime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'region': region,
      'country': country,
      'localtime': localtime,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      name: map['name'],
      region: map['region'],
      country: map['country'],
      localtime: map['localtime'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Current {
  String? last_updated;
  double? temp_c;
  double? windKph;
  Condition? condition;
  Current({this.last_updated, this.temp_c, this.windKph, this.condition});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'last_updated': last_updated,
      'temp_c': temp_c,
      'windKph': windKph,
      'condition': condition?.toMap(),
    };
  }

  factory Current.fromMap(Map<String, dynamic> map) {
    return Current(
      last_updated:
          map['last_updated'] != null ? map['last_updated'] as String : null,
      temp_c: map['temp_c'] != null ? map['temp_c'] as double : null,
      windKph: map['windKph'] != null ? map['windKph'] as double : null,
      condition: map['condition'] != null
          ? Condition.fromMap(map['condition'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Current.fromJson(String source) =>
      Current.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Condition {
  String? text;
  String? icon;
  Condition({
    this.text,
    this.icon,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'icon': icon,
    };
  }

  factory Condition.fromMap(Map<String, dynamic> map) {
    return Condition(
      text: map['text'] != null ? map['text'] as String : null,
      icon: map['icon'] != null ? map['icon'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Condition.fromJson(String source) =>
      Condition.fromMap(json.decode(source) as Map<String, dynamic>);
}
