import 'package:flutter/material.dart';
import 'package:rick_and_morty_test_restapi/app/view/theme/app_theme_builder.dart';

import 'app/di/di.dart';
import 'app/view/screen/episode/list.dart';
import 'app/view/screen/location/list.dart';
import 'app/view/screen/person/list.dart';
import 'app/view/screen/start_page.dart';

void main() {
  Di().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    //print('start');
    return MaterialApp(
      title: 'Rick and Morty',
      theme: AppThemeDataBuilder.buildThemeDataLight(),
      /*ThemeData(
        primarySwatch: Colors.blue,
      ),*/
      /*home: AnimatedSplashScreen(
          nextScreen: StartPage(),
          splash: Image.asset('assets/images/start3.gif'),
          backgroundColor: Colors.transparent,
          splashTransition: SplashTransition.slideTransition,
          duration: 2500,
        ),*/
      initialRoute: '/',
      routes: {
        '/': (ctx) => const StartPage(),
        '/personList': (ctx) => const PersonListScreen(),
        '/locationList': (ctx) => const LocationListScreen(),
        '/episodeList': (ctx) => const EpisodeListScreen(),
        /*'/splash': (ctx) => AnimatedSplashScreen(
              nextScreen: const StartPage(),
              splash: Image.asset('assets/images/start3.gif'),
              backgroundColor: Colors.white54,
              //splashIconSize: 250,
              //splashTransition: SplashTransition.sizeTransition,
              duration: 1500,
            ),*/
      },
    );
  }
}
