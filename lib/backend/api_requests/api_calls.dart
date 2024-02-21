import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Open Meteo Group Code

class OpenMeteoGroup {
  static String baseUrl = 'https://api.open-meteo.com/v1';
  static Map<String, String> headers = {};
  static GetWeatherDataCall getWeatherDataCall = GetWeatherDataCall();
}

class GetWeatherDataCall {
  Future<ApiCallResponse> call({
    double? latitude = 0,
    double? longitude = 0,
    String? temperatureUnit = 'celsius',
    String? windSpeedUnit = 'kmh',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get weather data',
      apiUrl: '${OpenMeteoGroup.baseUrl}/forecast',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'latitude': latitude,
        'longitude': longitude,
        'current':
            "temperature_2m,relative_humidity_2m,apparent_temperature,is_day,wind_speed_10m",
        'forecast_days': 1,
        'daily': "sunrise,sunset,uv_index_max",
        'temperature_unit': temperatureUnit,
        'wind_speed_unit': windSpeedUnit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  double? temperature(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.current.temperature_2m''',
      ));
  int? isday(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.current.is_day''',
      ));
  double? humidity(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.current.relative_humidity_2m''',
      ));
  String? sunrise(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.daily.sunrise[0]''',
      ));
  String? sunset(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.daily.sunset[0]''',
      ));
  double? windspeed(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.current.wind_speed_10m''',
      ));
  double? indiceuv(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.daily.uv_index_max[0]''',
      ));
}

/// End Open Meteo Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
