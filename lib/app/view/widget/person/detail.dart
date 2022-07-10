import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:rick_and_morty_test_restapi/app/viewmodel/person/contract/detail_contract.dart';

import '../../../core/common/model/person_detail_model.dart';

class PersonDetailWidget extends StatefulWidget {
  final int id;
  const PersonDetailWidget({Key? key, required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PersonDetailWidget> {
  final PersonDetailViewModelContract viewModel = Injector().get<PersonDetailViewModelContract>();
  bool _isLoading = true;
  PersonDetailModel? personModel;
  @override
  void initState() {
    super.initState();
    viewModel.notification.listen((event) => _dispatch(event));
    viewModel.load(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _isLoading
            ? const LinearProgressIndicator(
                color: Colors.redAccent,
              )
            : Container(),
        _buildForm(),
      ],
    );
  }

  Widget _buildForm() {
    if (personModel == null) {
      return Container();
    }
    return Column(
      children: [
        Image.network(personModel!.avatarUrl),
        Text(personModel!.name),
        Text(personModel!.originLocationName ?? ' '),
      ],
    );
  }

  _dispatch(PersonDetailNotifier event) {
    if (event is PersonDetailSuccessLoadNotifier) {
      setState(() {
        _isLoading = false;
        personModel = event.person;
      });
    }
  }
}
