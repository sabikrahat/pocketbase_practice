import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const appName = 'pocketbase_practice';

// const baseUrl = 'http://live.algoramming.com:1000';
const baseUrl = 'http://103.113.227.244:1000';
// const baseUrl = 'http://127.0.0.1:8090';
// const baseUrl = 'http://10.0.2.2:8090';
const users = 'users';

const Color white = Colors.white;
const Color black = Colors.black;
const Color kPrimaryColor = Color(0xFF23336A);
const kFieldBg = Color.fromARGB(255, 219, 219, 219);

String get todayNow => DateFormat('MMMM d, y  hh:mm a').format(DateTime.now());

DateFormat dateFormatted = DateFormat('dd-MM-yyyy');
DateFormat timeFormatted = DateFormat('hh:mm:ss a');
DateFormat dateTimeFormatted = DateFormat('dd-MM-yyyy hh:mm:ss a');
NumberFormat bdtNumberFormat = NumberFormat('#,##,##0.00#');
NumberFormat usdNumberFormat = NumberFormat('#,##0.00');

final defaultRadius = BorderRadius.circular(5.0);

const defaultDuration = Duration(milliseconds: 400);

const mainStart = MainAxisAlignment.start;
const mainCenter = MainAxisAlignment.center;
const mainEnd = MainAxisAlignment.end;
const mainSpaceBetween = MainAxisAlignment.spaceBetween;
const mainSpaceEvenly = MainAxisAlignment.spaceEvenly;
const mainSpaceAround = MainAxisAlignment.spaceAround;

const crossStart = CrossAxisAlignment.start;
const crossCenter = CrossAxisAlignment.center;
const crossEnd = CrossAxisAlignment.end;
const crossStretch = CrossAxisAlignment.stretch;

const mainMax = MainAxisSize.max;
const mainMin = MainAxisSize.min;
