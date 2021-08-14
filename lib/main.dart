import 'package:flutter/material.dart';
import 'package:mernmaid/dashboard/screens/home.dart';
import 'package:mernmaid/github_code_screen.dart';
import 'package:mernmaid/github_verification_screen.dart';
import 'package:mernmaid/login_screen.dart';
import 'package:mernmaid/signup_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        accentColor: Color.fromRGBO(247, 140, 140, 1),
      ),
      home: LoginScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/sign_up":
            return PageTransition(
              child: SignUpScreen(),
              type: PageTransitionType.fade,
              settings: settings,
            );
            break;
          case '/github_verification_screen':
            return PageTransition(
              child: GitHubVerificationScreen(),
              type: PageTransitionType.fade,
              settings: settings,
            );
            break;
          default:
            return null;
        }
      },
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SignUpScreen.routeName: (ctx) => SignUpScreen(),
        Home.routeName: (ctx) => Home(),
        GithubCodeScreen.routeName: (ctx) => GithubCodeScreen(),
        GitHubVerificationScreen.routeName: (ctx) => GitHubVerificationScreen(),
      },
    );
  }
}
