import 'dart:convert';

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
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get weather data',
      apiUrl: '${OpenMeteoGroup.baseUrl}/forecast',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'latitude': latitude,
        'longitude': longitude,
        'current': "temperature_2m,relative_humidity_2m,is_day",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
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
