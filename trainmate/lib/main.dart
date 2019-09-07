import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:trainmate/screens/chat_page.dart';
import 'package:trainmate/screens/onboarding_page.dart';
import 'package:trainmate/screens/pick_destination.dart';
import 'package:trainmate/user.dart';
import 'package:uuid/uuid.dart';

import 'package:trainmate/theme.dart';

// generate unique session id on app start
final user = User(Uuid().v4());

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<User>(
      model: user,
      child: MaterialApp(
        title: 'TrainMate',
        theme: codefatherTheme,
        home: OnboardingPage(title: 'TrainMate'),
        onGenerateRoute: (settings) {
          final args = settings.arguments as Map<String, dynamic>;

          switch (settings.name) {
            case '/chat':
              return MaterialPageRoute(
                settings: settings,
                builder: (c) => ChatPage(
                  title: args["title"],
                  trip: args["trip"],
                  destination: args["destination"],
                ),
              );

            case '/pick-destination':
              return MaterialPageRoute(
                settings: settings,
                builder: (c) => PickDestinationPage(
                  carriageId: args['carriageId'],
                ),
              );
          }

          print('Unexpected route name: ${settings.name}');
          return null;
        },
      ),
    );
  }
}
