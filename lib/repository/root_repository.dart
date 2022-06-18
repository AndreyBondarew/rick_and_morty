import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/category_model.dart';

class RootRepository{
  final String rootUrl = 'https://rickandmortyapi.com/api';
  static RootRepository? _instance;
  RootRepository._();
  
  factory RootRepository.getInstance(){
    _instance ??=RootRepository._();
    return _instance!;
  }
  
  Future<List<CategoryModel>> load() async{
    List<CategoryModel> res = [];
    var response = await http.get(Uri.parse(rootUrl));
    if (response.statusCode == 200){
      List<dynamic> jsonRes = jsonDecode(response.body)['result'];
      for(var element in jsonRes){
        //res.add(CategoryModel(name: element., url: url))
      }
    }
    return res;
  } 
}