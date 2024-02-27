import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

String dateToHour(String date) {
  return date.split('T').last;
}

String? getDate() {
  var dateFormat = DateFormat("EEEE dd MMMM y");
  return dateFormat.format(DateTime.now());
}