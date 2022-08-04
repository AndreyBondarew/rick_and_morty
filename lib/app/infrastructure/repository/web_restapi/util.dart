List<String> createIdListFromUrls(List<dynamic> url) {
  final List<String> idList = [];
  for (var element in url) {
    idList.add(element.substring(element.lastIndexOf('/') + 1));
  }
  return idList;
}
