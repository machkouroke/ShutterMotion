import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _tempSeuil = await secureStorage.getDouble('ff_tempSeuil') ?? _tempSeuil;
    });
    await _safeInitAsync(() async {
      _location =
          latLngFromString(await secureStorage.getString('ff_location')) ??
              _location;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_userLocation') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_userLocation') ?? '{}';
          _userLocation =
              LocationStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_weatherData') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_weatherData') ?? '{}';
          _weatherData = WeatherResponseStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  double _tempSeuil = 20.0;
  double get tempSeuil => _tempSeuil;
  set tempSeuil(double value) {
    _tempSeuil = value;
    secureStorage.setDouble('ff_tempSeuil', value);
  }

  void deleteTempSeuil() {
    secureStorage.delete(key: 'ff_tempSeuil');
  }

  LatLng? _location = const LatLng(0, 0);
  LatLng? get location => _location;
  set location(LatLng? value) {
    _location = value;
    value != null
        ? secureStorage.setString('ff_location', value.serialize())
        : secureStorage.remove('ff_location');
  }

  void deleteLocation() {
    secureStorage.delete(key: 'ff_location');
  }

  LocationStruct _userLocation = LocationStruct.fromSerializableMap(
      jsonDecode('{"latitude":"0","longitude":"0"}'));
  LocationStruct get userLocation => _userLocation;
  set userLocation(LocationStruct value) {
    _userLocation = value;
    secureStorage.setString('ff_userLocation', value.serialize());
  }

  void deleteUserLocation() {
    secureStorage.delete(key: 'ff_userLocation');
  }

  void updateUserLocationStruct(Function(LocationStruct) updateFn) {
    updateFn(_userLocation);
    secureStorage.setString('ff_userLocation', _userLocation.serialize());
  }

  WeatherResponseStruct _weatherData =
      WeatherResponseStruct.fromSerializableMap(jsonDecode(
          '{"temperature":"0","isday":"0","humidity":"0","sunrise":"19:00","sunset":"19:00","windspeed":"0","indiceuv":"0"}'));
  WeatherResponseStruct get weatherData => _weatherData;
  set weatherData(WeatherResponseStruct value) {
    _weatherData = value;
    secureStorage.setString('ff_weatherData', value.serialize());
  }

  void deleteWeatherData() {
    secureStorage.delete(key: 'ff_weatherData');
  }

  void updateWeatherDataStruct(Function(WeatherResponseStruct) updateFn) {
    updateFn(_weatherData);
    secureStorage.setString('ff_weatherData', _weatherData.serialize());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
