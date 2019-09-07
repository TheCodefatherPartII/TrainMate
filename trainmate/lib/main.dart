import 'package:flutter/material.dart';
import 'package:trainmate/screens/OnboardingPage.dart';

import 'package:trainmate/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TrainMate',
      theme: codefatherTheme,
      home: OnboardingPage(title: 'TrainMate'),
    );
  }
}