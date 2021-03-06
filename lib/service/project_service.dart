import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:quanly_app/models/project.model.dart';

import 'api.dart';

class ProjectService {
  static String _url = '${baseApi}/api/v1/project/getAll/';
   Future<List<Project>> browse() async {
    List collection;
    List<Project> _project;
    var response = await http.get(_url);
    if (response.statusCode == 200) {
      collection = convert.jsonDecode(response.body);
      print(collection);
      _project = collection.map((json) => Project.fromJson(json)).toList();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return _project;
  }
}
