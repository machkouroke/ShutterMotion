import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _xAxis =
          prefs.getStringList('ff_xAxis')?.map(double.parse).toList() ?? _xAxis;
    });
    _safeInit(() {
      _yAxis =
          prefs.getStringList('ff_yAxis')?.map(double.parse).toList() ?? _yAxis;
    });
    _safeInit(() {
      _tempSeuil = prefs.getDouble('ff_tempSeuil') ?? _tempSeuil;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<double> _xAxis = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0];
  List<double> get xAxis => _xAxis;
  set xAxis(List<double> value) {
    _xAxis = value;
    prefs.setStringList('ff_xAxis', value.map((x) => x.toString()).toList());
  }

  void addToXAxis(double value) {
    _xAxis.add(value);
    prefs.setStringList('ff_xAxis', _xAxis.map((x) => x.toString()).toList());
  }

  void removeFromXAxis(double value) {
    _xAxis.remove(value);
    prefs.setStringList('ff_xAxis', _xAxis.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromXAxis(int index) {
    _xAxis.removeAt(index);
    prefs.setStringList('ff_xAxis', _xAxis.map((x) => x.toString()).toList());
  }

  void updateXAxisAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    _xAxis[index] = updateFn(_xAxis[index]);
    prefs.setStringList('ff_xAxis', _xAxis.map((x) => x.toString()).toList());
  }

  void insertAtIndexInXAxis(int index, double value) {
    _xAxis.insert(index, value);
    prefs.setStringList('ff_xAxis', _xAxis.map((x) => x.toString()).toList());
  }

  List<double> _yAxis = [2.0, 3.0, 6.0, 4.0, 5.0, 3.0, 4.0];
  List<double> get yAxis => _yAxis;
  set yAxis(List<double> value) {
    _yAxis = value;
    prefs.setStringList('ff_yAxis', value.map((x) => x.toString()).toList());
  }

  void addToYAxis(double value) {
    _yAxis.add(value);
    prefs.setStringList('ff_yAxis', _yAxis.map((x) => x.toString()).toList());
  }

  void removeFromYAxis(double value) {
    _yAxis.remove(value);
    prefs.setStringList('ff_yAxis', _yAxis.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromYAxis(int index) {
    _yAxis.removeAt(index);
    prefs.setStringList('ff_yAxis', _yAxis.map((x) => x.toString()).toList());
  }

  void updateYAxisAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    _yAxis[index] = updateFn(_yAxis[index]);
    prefs.setStringList('ff_yAxis', _yAxis.map((x) => x.toString()).toList());
  }

  void insertAtIndexInYAxis(int index, double value) {
    _yAxis.insert(index, value);
    prefs.setStringList('ff_yAxis', _yAxis.map((x) => x.toString()).toList());
  }

  double _tempSeuil = 20.0;
  double get tempSeuil => _tempSeuil;
  set tempSeuil(double value) {
    _tempSeuil = value;
    prefs.setDouble('ff_tempSeuil', value);
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
