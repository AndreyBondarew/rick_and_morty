import 'package:rick_and_morty_test_restapi/app/core/common/model/location_list.dart';

class LocationListDto {
  final List<LocationListModel> locations;
  final int currentPage;
  final int totalPages;
  final String? nextUrl;

  LocationListDto({
    required this.locations,
    required this.currentPage,
    required this.totalPages,
    this.nextUrl,
  });
}
