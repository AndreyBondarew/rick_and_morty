import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:rick_and_morty_test_restapi/app/core/entities/episode/filter/multiple_list.dart';
import 'package:rick_and_morty_test_restapi/app/view/screen/episode/list.dart';
import 'package:rick_and_morty_test_restapi/app/view/screen/location/detail.dart';
import 'package:rick_and_morty_test_restapi/app/view/theme/custom_colors.dart';
import 'package:rick_and_morty_test_restapi/app/view/theme/custom_text_style.dart';
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
  late ThemeData theme;

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
    theme = Theme.of(context);
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
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 16,
                  ),
                  Image.network(personModel!.avatarUrl),
                  Container(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      height: 1,
                      color: theme.extension<CustomThemeColors>()!.separateLine,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: _buildGeneralInfo(personModel!),
                    ),
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.info_outline),
                    label: Text('Origin location: ${personModel!.originLocation?.name} >'),
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LocationDetailScreen(
                          id: personModel!.originLocation?.id ?? -1,
                        ),
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
                          filter: MultipleEpisodeFilter(filter: personModel!.episodesId),
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
      ),
    );
  }

  Widget _buildGeneralInfo(PersonDetailModel person) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: person.name,
            style: theme.extension<CustomThemeTextStyle>()!.primaryName,
          ),
        ),
        RichText(
          text: TextSpan(
            text: ('Species: '),
            style: theme.extension<CustomThemeTextStyle>()!.fieldName,
            children: [
              TextSpan(
                text: person.species,
                style: theme.extension<CustomThemeTextStyle>()!.fieldData,
              ),
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                  child: Container(
                    width: 1,
                    height: 14,
                    color: theme.extension<CustomThemeColors>()!.separateLine,
                  ),
                ),
              ),
              TextSpan(
                text: ('Gender: '),
                style: theme.extension<CustomThemeTextStyle>()!.fieldName,
              ),
              TextSpan(
                text: person.gender,
                style: theme.extension<CustomThemeTextStyle>()!.fieldData,
              ),
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                  child: Container(
                    width: 1,
                    height: 14,
                    color: theme.extension<CustomThemeColors>()!.separateLine,
                  ),
                ),
              ),
              TextSpan(
                text: ('Status: '),
                style: theme.extension<CustomThemeTextStyle>()!.fieldName,
              ),
              TextSpan(
                text: person.status,
                style: theme.extension<CustomThemeTextStyle>()!.fieldData!.copyWith(
                      color: theme.extension<CustomThemeColors>()!.getStatusColor(person.status),
                    ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: person.type.isNotEmpty,
          child: RichText(
            text: TextSpan(
              text: 'Type: ',
              style: theme.extension<CustomThemeTextStyle>()!.secondaryFieldName,
              children: [
                TextSpan(
                  text: person.type,
                  style: theme.extension<CustomThemeTextStyle>()!.secondaryFieldData,
                ),
              ],
            ),
          ),
        ),
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
