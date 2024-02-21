// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeatherResponseStruct extends BaseStruct {
  WeatherResponseStruct({
    double? temperature,
    int? isday,
    double? humidity,
    String? sunrise,
    String? sunset,
    double? windspeed,
    double? indiceuv,
  })  : _temperature = temperature,
        _isday = isday,
        _humidity = humidity,
        _sunrise = sunrise,
        _sunset = sunset,
        _windspeed = windspeed,
        _indiceuv = indiceuv;

  // "temperature" field.
  double? _temperature;
  double get temperature => _temperature ?? 0.0;
  set temperature(double? val) => _temperature = val;
  void incrementTemperature(double amount) =>
      _temperature = temperature + amount;
  bool hasTemperature() => _temperature != null;

  // "isday" field.
  int? _isday;
  int get isday => _isday ?? 0;
  set isday(int? val) => _isday = val;
  void incrementIsday(int amount) => _isday = isday + amount;
  bool hasIsday() => _isday != null;

  // "humidity" field.
  double? _humidity;
  double get humidity => _humidity ?? 0.0;
  set humidity(double? val) => _humidity = val;
  void incrementHumidity(double amount) => _humidity = humidity + amount;
  bool hasHumidity() => _humidity != null;

  // "sunrise" field.
  String? _sunrise;
  String get sunrise => _sunrise ?? '';
  set sunrise(String? val) => _sunrise = val;
  bool hasSunrise() => _sunrise != null;

  // "sunset" field.
  String? _sunset;
  String get sunset => _sunset ?? '';
  set sunset(String? val) => _sunset = val;
  bool hasSunset() => _sunset != null;

  // "windspeed" field.
  double? _windspeed;
  double get windspeed => _windspeed ?? 0.0;
  set windspeed(double? val) => _windspeed = val;
  void incrementWindspeed(double amount) => _windspeed = windspeed + amount;
  bool hasWindspeed() => _windspeed != null;

  // "indiceuv" field.
  double? _indiceuv;
  double get indiceuv => _indiceuv ?? 0.0;
  set indiceuv(double? val) => _indiceuv = val;
  void incrementIndiceuv(double amount) => _indiceuv = indiceuv + amount;
  bool hasIndiceuv() => _indiceuv != null;

  static WeatherResponseStruct fromMap(Map<String, dynamic> data) =>
      WeatherResponseStruct(
        temperature: castToType<double>(data['temperature']),
        isday: castToType<int>(data['isday']),
        humidity: castToType<double>(data['humidity']),
        sunrise: data['sunrise'] as String?,
        sunset: data['sunset'] as String?,
        windspeed: castToType<double>(data['windspeed']),
        indiceuv: castToType<double>(data['indiceuv']),
      );

  static WeatherResponseStruct? maybeFromMap(dynamic data) => data is Map
      ? WeatherResponseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'temperature': _temperature,
        'isday': _isday,
        'humidity': _humidity,
        'sunrise': _sunrise,
        'sunset': _sunset,
        'windspeed': _windspeed,
        'indiceuv': _indiceuv,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'temperature': serializeParam(
          _temperature,
          ParamType.double,
        ),
        'isday': serializeParam(
          _isday,
          ParamType.int,
        ),
        'humidity': serializeParam(
          _humidity,
          ParamType.double,
        ),
        'sunrise': serializeParam(
          _sunrise,
          ParamType.String,
        ),
        'sunset': serializeParam(
          _sunset,
          ParamType.String,
        ),
        'windspeed': serializeParam(
          _windspeed,
          ParamType.double,
        ),
        'indiceuv': serializeParam(
          _indiceuv,
          ParamType.double,
        ),
      }.withoutNulls;

  static WeatherResponseStruct fromSerializableMap(Map<String, dynamic> data) =>
      WeatherResponseStruct(
        temperature: deserializeParam(
          data['temperature'],
          ParamType.double,
          false,
        ),
        isday: deserializeParam(
          data['isday'],
          ParamType.int,
          false,
        ),
        humidity: deserializeParam(
          data['humidity'],
          ParamType.double,
          false,
        ),
        sunrise: deserializeParam(
          data['sunrise'],
          ParamType.String,
          false,
        ),
        sunset: deserializeParam(
          data['sunset'],
          ParamType.String,
          false,
        ),
        windspeed: deserializeParam(
          data['windspeed'],
          ParamType.double,
          false,
        ),
        indiceuv: deserializeParam(
          data['indiceuv'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'WeatherResponseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WeatherResponseStruct &&
        temperature == other.temperature &&
        isday == other.isday &&
        humidity == other.humidity &&
        sunrise == other.sunrise &&
        sunset == other.sunset &&
        windspeed == other.windspeed &&
        indiceuv == other.indiceuv;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [temperature, isday, humidity, sunrise, sunset, windspeed, indiceuv]);
}

WeatherResponseStruct createWeatherResponseStruct({
  double? temperature,
  int? isday,
  double? humidity,
  String? sunrise,
  String? sunset,
  double? windspeed,
  double? indiceuv,
}) =>
    WeatherResponseStruct(
      temperature: temperature,
      isday: isday,
      humidity: humidity,
      sunrise: sunrise,
      sunset: sunset,
      windspeed: windspeed,
      indiceuv: indiceuv,
    );
