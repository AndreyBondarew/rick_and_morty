import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:rick_and_morty_test_restapi/app/core/common/base/base_filter.dart';
import 'package:rick_and_morty_test_restapi/app/core/common/model/person_list_model.dart';
import 'package:rick_and_morty_test_restapi/app/view/screen/person/detail.dart';
import 'package:rick_and_morty_test_restapi/app/viewmodel/person/contract/list_contract.dart';
//import 'package:image/image.dart';

class PersonBuildInListWidget extends StatefulWidget {
  final BaseFilter? filter;

  const PersonBuildInListWidget({Key? key, this.filter}) : super(key: key);

  @override
  State<PersonBuildInListWidget> createState() => _State();
}

class _State extends State<PersonBuildInListWidget> with SingleTickerProviderStateMixin {
  final PersonListViewModelContract _viewModel = Injector().get<PersonListViewModelContract>();
  final List<PersonListModel> persons = [];
  final int _expandItemCount = 5;
  bool expand = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _viewModel.notification.listen((event) => _eventDispatch(event));
    _viewModel.load(filter: widget.filter);
  }

  @override
  Widget build(BuildContext context) {
    if (expand) {
      return Expanded(child: buildContent());
    }
    return buildContent();
  }

  Widget buildContent() {
    if (isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        (expand && persons.length > _expandItemCount)
            ? Expanded(
                child: buildList(),
              )
            : buildList(),
        persons.length > _expandItemCount
            ? TextButton(
                onPressed: () => setState(() {
                  expand = !expand;
                }),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(expand ? 'collapse' : 'expand (${persons.length - _expandItemCount} element)'),
                    Icon(expand ? Icons.arrow_drop_up_outlined : Icons.arrow_drop_down_outlined),
                  ],
                ),
              )
            : Container(),
      ],
    );
  }

  Widget buildList() {
    return ListView.builder(
      controller: ScrollController(),
      shrinkWrap: true,
      itemCount: expand ? persons.length : min(_expandItemCount, persons.length),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            leading: Image(image: ResizeImage(NetworkImage(persons[index].avatarUri), width: 64)),
            title: Text(persons[index].name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
            subtitle: Text(persons[index].species),
            visualDensity: VisualDensity.comfortable,
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonDetailScreen(
                      id: persons[index].id,
                      name: persons[index].name,
                    ),
                  ));
            },
          ),
        );
      },
    );
  }

  void _eventDispatch(PersonListNotifier event) {
    if (event is PersonListSuccessLoadNotifier) {
      persons.clear();
      setState(() {
        isLoading = false;
        persons.addAll(event.persons);
      });
    }
    if (event is PersonListStartLoadingNotifier) {
      setState(() {
        isLoading = true;
      });
    }
    if (event is PersonListErrorLoadingNotifier) {
      setState(() {
        isLoading = false;
      });
    }
  }
}
