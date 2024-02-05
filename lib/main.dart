import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mafhom/curves.dart';
import 'package:mafhom/modules/splash/splash_screen.dart';
import 'package:mafhom/screen.dart';
import 'package:mafhom/shared/bloc_observer.dart';

import 'modules/onboarding/onboarding_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  TestCurves(),
    );
  }
}

