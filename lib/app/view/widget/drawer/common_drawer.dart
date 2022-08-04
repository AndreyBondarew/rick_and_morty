import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Menu();
  }
}

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currentPage = ModalRoute.of(context)?.settings.name ?? '/';
    return Container(
      color: Colors.grey.shade200,
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/header.png'),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 25,
                width: 150,
                alignment: Alignment.center,
                color: const Color.fromARGB(175, 50, 50, 50),
                child: Text(
                  'Rick and Morty',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade100,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                    child: ListTile(
                      title: (Text(
                        'Home page',
                        style: TextStyle(
                          fontWeight: ((currentPage == "/") ? FontWeight.bold : FontWeight.normal),
                        ),
                      )),
                      leading: const Icon(Icons.home),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, '/personList'),
                    child: ListTile(
                      title: (Text(
                        'Person',
                        style: TextStyle(
                          fontWeight: ((currentPage == "/personList") ? FontWeight.bold : FontWeight.normal),
                        ),
                      )),
                      leading: const Icon(Icons.person),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, '/locationList'),
                    child: ListTile(
                      title: (Text(
                        'Location',
                        style: TextStyle(
                          fontWeight: ((currentPage == "/locationList") ? FontWeight.bold : FontWeight.normal),
                        ),
                      )),
                      leading: const Icon(Icons.place),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(context, '/episodeList'),
                    child: ListTile(
                      title: (Text(
                        'Episode',
                        style: TextStyle(
                          fontWeight: ((currentPage == "/episodeList") ? FontWeight.bold : FontWeight.normal),
                        ),
                      )),
                      leading: const Icon(Icons.camera),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 1,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () => _launchURL('https://github.com/AndreyBondarew/rick_and_morty'),
                        child: const ListTile(
                          title: (Text('Github')),
                          leading: Icon(Icons.code),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 1,
              color: Colors.blueGrey,
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Text('Rick & Morty REST API demo app'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 1,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }

  _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }
}
