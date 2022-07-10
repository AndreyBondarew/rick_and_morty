import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:rick_and_morty_test_restapi/app/view/screen/person/detail.dart';

import '../../../core/common/model/person_list_model.dart';
import '../../../viewmodel/person/contract/list_contract.dart';

class PersonListWidget extends StatefulWidget {
  const PersonListWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PersonListWidget> {
  final List<PersonListModel> persons = [];
  final PersonListViewModelContract viewModel = Injector().get<PersonListViewModelContract>();
  final ScrollController _scrollController = ScrollController();
  bool isLoading = true;
  bool availableData = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() => _loadMore());
    viewModel.notification.listen((event) => _dispatch(event));
    viewModel.load();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
          itemBuilder: (BuildContext ctx, int index) => _itemBuild(ctx, index),
          shrinkWrap: true,
          itemCount: persons.length,
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2.5,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            //mainAxisExtent: 96,
          ),
        ),
        isLoading ? const LinearProgressIndicator(color: Colors.redAccent) : Container(),
      ],
    );
  }

  Widget _itemBuild_(BuildContext ctx, int index) {
    return Card(
      /*child: ListTile(
        title: Text(persons[index].name),
      ),*/
      elevation: 3,
      child: ListTile(
        //contentPadding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 8.0),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(700),
          child: Image.network(
            persons[index].url,
          ),
        ),
        title: Text(
          persons[index].name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('species: ${persons[index].species} status: ${persons[index].status}'),
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => PersonDetailScreen(
                id: persons[index].id,
              ),
            ),
          )
        },
      ),
    );
  }

  Widget _itemBuild(BuildContext ctx, int index) {
    return GestureDetector(
      child: Card(
        elevation: 3,
        child: Column(
          children: [
            Spacer(),
            SizedBox(
              height: 110,
              width: 110,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: Image.network(persons[index].url),
              ),
            ),
            Column(
              children: [
                Text(
                  persons[index].name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('species: ${persons[index].species} status: ${persons[index].status}'),
              ],
            ),
          ],
        ),
      ),
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => PersonDetailScreen(
              id: persons[index].id,
            ),
          ),
        )
      },
    );
  }

  //==========================
  @override
  void dispose() {
    viewModel.dispose();
    _scrollController.removeListener(() => _loadMore());
    super.dispose();
  }

  //==========================
  void _dispatch(PersonListNotifier notifier) {
    if (notifier is PersonListSuccessLoadNotifier) {
      persons.clear();
      setState(() {
        isLoading = false;
        persons.addAll(notifier.persons);
      });
    }
    if (notifier is PersonalListStartLoadingNotifier) {
      setState(() {
        isLoading = true;
      });
    }
    if (notifier is PersonListNothingLoadingNotifier) {
      availableData = false;
      setState(() {
        isLoading = false;
      });
    }
  }

  void _loadMore() {
    if (availableData && _scrollController.position.maxScrollExtent == _scrollController.position.pixels && !isLoading) {
      viewModel.load();
    }
  }
}
