// ignore_for_file: prefer_const_constructors

import 'package:deka_mobile/di/di.dart';
import 'package:deka_mobile/resource/theme.dart';
import 'package:deka_mobile/ui/dashboard/dashboard.dart';
import 'package:deka_mobile/ui/login/login.dart';
import 'package:deka_mobile/ui/rekap_izin/input/input_rekap_izin.dart';
import 'package:deka_mobile/ui/rekap_izin/rekap_izin.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      debugShowCheckedModeBanner: true,
      initialRoute: Login.nameRoute,
      routes: {
        Login.nameRoute: (context) => Login(),
        Dashboard.nameRoute: (context) => Dashboard(),
        RekapIzin.nameRoute: (context) => RekapIzin(),
        InputRekapIzin.nameRoute: (context) => InputRekapIzin(),
      },
    );
  }
}