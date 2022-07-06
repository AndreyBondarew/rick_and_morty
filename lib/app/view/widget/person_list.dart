import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rick_and_morty_test_restapi/app/view/widget/person_detail.dart';

import '../../core/common/model/person_list_model.dart';
import '../../viewmodel/person_list_vm.dart';

class PersonListView extends StatefulWidget {
  const PersonListView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PersonListView> {
  final List<PersonListModel> persons = [];
  final PersonListViewModel viewModel = PersonListViewModel();

  @override
  void initState() {
    viewModel.event.listen((event) {
      dispatch(event);
    });
    viewModel.load();
    super.initState();
  }

  void dispatch(PersonListNotification event) {
    if (event is ResultPersonListNotification) {
      return setState(() {
        persons.clear();
        persons.addAll(event.persons);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (persons.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text("Loading, pleace wait"),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: persons.length,
      itemBuilder: (context, index) {
        PersonListModel person = persons[index];
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
            child: Card(
                elevation: 3,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 8.0),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: Image.network(
                      person.url,
                    ),
                  ),
                  title: Text(
                    person.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('species: ${person.species} status: ${person.status}'),
                  onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (index) => PersonaDetailPage(person.id)))},
                )));
      },
    );
  }
}
