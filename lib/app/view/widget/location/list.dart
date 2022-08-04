import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:rick_and_morty_test_restapi/app/core/common/model/location_list.dart';
import 'package:rick_and_morty_test_restapi/app/view/screen/location/detail.dart';
import 'package:rick_and_morty_test_restapi/app/viewmodel/location/contract/list_contract.dart';

class LocationListWidget extends StatefulWidget {
  const LocationListWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<LocationListWidget> {
  final LocationListViewModelContract _viewModel = Injector().get<LocationListViewModelContract>();
  final ScrollController _scrollController = ScrollController();
  final List<LocationListModel> _locations = [];
  bool _isLoading = false;
  bool _availableData = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
          itemBuilder: (ctx, index) => _itemBuild(index),
          itemCount: _locations.length,
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            maxCrossAxisExtent: 330,
            mainAxisExtent: 120,
          ),
        ),
        _isLoading ? const LinearProgressIndicator() : Container(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _viewModel.notifier.listen((event) => _dispatch(event));
    _viewModel.load();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Widget _itemBuild(int index) {
    if (!_isLoading && _availableData && index == _locations.length - 1) {
      _viewModel.load();
    }
    return Card(
      elevation: 4,
      child: RawMaterialButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LocationDetailScreen(
              id: _locations[index].id,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RichText(
                text: TextSpan(
                  //text: //'Name:    ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  children: [
                    TextSpan(
                      text: _locations[index].name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.indigo,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.black26,
                height: .5,
              ),
              RichText(
                text: TextSpan(
                  text: 'Type:              ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  children: [
                    TextSpan(
                      text: _locations[index].type,
                      style: const TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Dimension:   ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  children: [
                    TextSpan(
                      text: _locations[index].dimension,
                      style: const TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              //Text('Dimension: ${_locations[index].dimension}'),
            ],
          ),
        ),
      ),
    );
  }

  void _dispatch(LocationListNotifier event) {
    if (event is LocationListSuccessLoadNotifier) {
      _locations.clear();
      setState(() {
        _isLoading = false;
        _locations.addAll(event.locations);
      });
    }
    if (event is LocationListStartLoadingNotifier) {
      setState(() => _isLoading = true);
    }
    if (event is LocationListNothingLoadingNotifier) {
      _availableData = false;
      setState(() => _isLoading = false);
    }
  }
}
