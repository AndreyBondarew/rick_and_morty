import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:rick_and_morty_test_restapi/app/core/common/model/location_detail.dart';
import 'package:rick_and_morty_test_restapi/app/viewmodel/location/contract/detail_contract.dart';

import '../../../core/entities/person/filter/multiple_list.dart';
import '../person/build_in_list.dart';

class LocationDetailWidget extends StatefulWidget {
  final int id;

  const LocationDetailWidget({Key? key, required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<LocationDetailWidget> {
  final LocationDetailViewModelContract _viewModel = Injector().get<LocationDetailViewModelContract>();
  bool isLoading = true;
  LocationDetailModel? locationDetailModel;

  @override
  void initState() {
    super.initState();
    _viewModel.notifier.listen((event) => _dispatch(event));
    _viewModel.load(widget.id);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (locationDetailModel == null) {
      return Container(
        alignment: Alignment.topCenter,
        child: const LinearProgressIndicator(),
      );
    }
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.topCenter,
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: 'Location name ',
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  width: 1,
                                  height: 15,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: ' ${locationDetailModel!.name}',
                              style: const TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.w900,
                                letterSpacing: .5,
                              ),
                            ),
                          ]),
                    ),
                    /*locationDetailModel!.name),*/
                    RichText(
                      text: TextSpan(
                        text: 'Type ',
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                        children: [
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                width: .8,
                                height: 12,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: ' ${locationDetailModel!.type}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.blueAccent,
                              letterSpacing: .5,
                            ),
                          ),
                          const TextSpan(
                            text: ',   Dimension ',
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                width: .8,
                                height: 12,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: ' ${locationDetailModel!.dimension}',
                            style: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w900,
                              letterSpacing: .5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Container(
                        height: .8,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      locationDetailModel!.residentsIds.isNotEmpty
                          ? '${locationDetailModel!.residentsIds.length} person(s) found on this location:'
                          : 'No persons found in this location',
                      style: TextStyle(
                        fontWeight: Theme.of(context).textTheme.subtitle1?.fontWeight ?? FontWeight.w400,
                        color: Theme.of(context).textTheme.subtitle1?.color ?? Colors.grey,
                        fontSize: Theme.of(context).textTheme.subtitle1?.height,
                      ),
                    ),
                    PersonBuildInListWidget(
                      filter: MultiplePersonListFilter(filter: locationDetailModel!.residentsIds),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _dispatch(LocationDetailNotifier event) {
    if (event is LocationDetailSuccessLoadNotifier) {
      setState(() {
        locationDetailModel = event.data;
      });
    }
    if (event is LocationDetailLoadingErrorNotifier) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${event.message}')));
      Navigator.maybePop(context);
    }
  }
}
