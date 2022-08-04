import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:rick_and_morty_test_restapi/app/view/screen/episode/list.dart';
import 'package:rick_and_morty_test_restapi/app/view/screen/location/detail.dart';
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
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _isLoading ? const LinearProgressIndicator(color: Colors.redAccent) : Container(),
        _buildForm(),
      ],
    );
  }

  Widget _buildForm() {
    if (personModel == null) {
      return Container();
    }
    return SingleChildScrollView(
      child: Center(
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(personModel!.avatarUrl),
                Text('Name: ${personModel!.name}'),
                Text('Gender: ${personModel!.gender}'),
                Text('Status: ${personModel!.status}'),
                Text('Species: ${personModel!.species}'),
                Visibility(
                  visible: personModel!.type.isNotEmpty,
                  child: Text('Type: ${personModel!.type}'),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.info_outline),
                  label: Text('Origin location: ${personModel!.originLocation?.name} >'),
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LocationDetailScreen(id: personModel!.originLocation?.id ?? -1),
                    ),
                  ),
                ),
                TextButton(
                  child: Text('Endpoint location: ${personModel!.endpointLocation?.name}'),
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LocationDetailScreen(id: personModel!.endpointLocation?.id ?? -1),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EpisodeListScreen(
                          /*filter: BaseFilter(
                          filterName: 'from person',
                          filterCriteria: personModel!.name,
                          filter: personModel!.episodesId.join(','),
                        ),*/
                          ),
                    ),
                  ),
                  child: Text('Episode: found in ${personModel!.episodesId.length} episode. See all.'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _dispatch(PersonDetailNotifier event) {
    if (event is PersonDetailSuccessLoadNotifier) {
      setState(() {
        _isLoading = false;
        personModel = event.person;
      });
    }
    if (event is PersonDetailErrorLoadingNotification) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(event.message ?? 'ERROR!'),
        ),
      );
    }
  }
}
