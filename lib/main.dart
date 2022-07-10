import 'package:flutter/material.dart';
import 'package:rick_and_morty_test_restapi/app/view/screen/start_page.dart';

import 'app/di/di.dart';
import 'app/view/screen/person/list.dart';

void main() {
  Di().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //print('start');
    return MaterialApp(
        title: 'Rick and Morty',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: const PersonListScreen(),
        initialRoute: '/',
        routes: {
          '/': (ctx) => StartPage(),
          '/personList': (ctx) => const PersonListScreen(),
        });
  }
}
