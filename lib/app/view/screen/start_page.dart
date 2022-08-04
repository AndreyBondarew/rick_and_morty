import 'package:flutter/material.dart';

import '../widget/drawer/common_drawer.dart';

class StartPage extends StatelessWidget {
  final String url = 'https://rickandmortyapi.com/api/location/31';

  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int idIndex = url.lastIndexOf('/');
    String id = url.substring(idIndex + 1, url.length);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/personList');
              },
              child: Text('person list'),
            ),
            Text(url),
            Text('id: $id'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/locationList');
              },
              child: Text('location list'),
            ),
          ],
        ),
      ),
      drawer: MediaQuery.of(context).size.width < 500
          ? Drawer(
              child: Menu(),
            )
          : null,
      /*body: SafeArea(
            child: Center(
                child: MediaQuery.of(context).size.width < 500
                    ? Content()
                    : Row(children: [
                        Container(width: 200.0, child: Menu()),
                        Container(width: MediaQuery.of(context).size.width - 200.0, child: Content())
                      ]))),*/
    );
  }
}

/*class Menu extends StatelessWidget {
  @override
  Widget build(context) => ListView(children: [
        FlatButton(
            onPressed: () {},
            child: ListTile(
              leading: Icon(Icons.looks_one),
              title: Text("First Link"),
            )),
        FlatButton(
            onPressed: () {},
            child: ListTile(
              leading: Icon(Icons.looks_two),
              title: Text("Second Link"),
            )),
        FlatButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/login");
            },
            child: ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Log Out"),
            ))
      ]);
}*/

class Content extends StatelessWidget {
  final List<String> elements = [
    "Zero",
    "One",
    "Two",
    "Three",
    "Four",
    "Five",
    "Six",
    "Seven",
    "Eight",
    "A Million Billion Trillion",
    "A much, much longer text that will still fit"
  ];

  @override
  Widget build(context) => GridView.builder(
      itemCount: elements.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 130.0,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
      ),
      itemBuilder: (context, i) => Card(child: Center(child: Padding(padding: EdgeInsets.all(8.0), child: Text(elements[i])))));
}
