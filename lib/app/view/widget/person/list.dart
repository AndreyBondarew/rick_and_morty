import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/person/filter/multiple_list.dart';

import '../../../core/common/model/person_list_model.dart';
import '../../../viewmodel/person/contract/list_contract.dart';
import '../../screen/person/detail.dart';

class PersonListWidget extends StatefulWidget {
  final MultiplePersonListFilter? filter;

  const PersonListWidget({Key? key, this.filter}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PersonListWidget> {
  final List<PersonListModel> persons = [];
  final PersonListViewModelContract viewModel = Injector().get<PersonListViewModelContract>();

  bool isLoading = false;
  bool availableData = true;

  @override
  void initState() {
    super.initState();
    viewModel.notification.listen((event) => _dispatch(event));
    viewModel.load(filter: widget.filter);
  }

  //==========================
  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
          itemBuilder: (BuildContext ctx, int index) => _itemBuild(ctx, index),
          shrinkWrap: true,
          itemCount: persons.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            maxCrossAxisExtent: 230,
          ),
        ),
        isLoading
            ? const Align(
                alignment: Alignment.topCenter,
                child: LinearProgressIndicator(color: Colors.redAccent),
              )
            : Container(),
      ],
    );
  }

  Widget _itemBuild(BuildContext context, int index) {
    if (index == persons.length - 1 && availableData && !isLoading) {
      viewModel.load();
    }
    return RawMaterialButton(
      onPressed: () => widget.filter == null
          ? Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PersonDetailScreen(
                  id: persons[index].id,
                  name: persons[index].name,
                ),
              ),
            )
          : Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => PersonDetailScreen(
                  id: persons[index].id,
                  name: persons[index].name,
                ),
              ),
            ),
      child: Card(
        elevation: 4,
        child: Stack(
          children: [
            Image(
              image: _getAvatar(index), // NetworkImage(persons[index].avatarUri),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildFooter(index),
            ),
          ],
        ),
      ),
    );
  }

  ImageProvider _getAvatar(int index) {
    //Future.delayed(Duration(milliseconds: index));
    return NetworkImage(persons[index].avatarUri);
  }

  Widget _buildFooter(int index) {
    return Container(
      color: const Color.fromARGB(205, 0, 0, 0),
      height: 40,
      alignment: Alignment.bottomCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            persons[index].name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          RichText(
            text: TextSpan(
              text: '${persons[index].species} ',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.normal,
              ),
              children: [
                TextSpan(
                  text: '[${persons[index].status}]',
                  style: TextStyle(
                    color: _getStatusColor(persons[index].status),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    if (status == 'Alive') {
      return Colors.green;
    }
    if (status == 'Dead') {
      return Colors.red;
    }
    return Colors.orange;
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
    if (notifier is PersonListStartLoadingNotifier) {
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
    if (notifier is PersonListErrorLoadingNotifier) {
      setState(() {
        isLoading = false;
      });
    }
  }
}
