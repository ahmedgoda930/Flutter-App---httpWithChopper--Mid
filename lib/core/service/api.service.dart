import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:network_operation/core/service/fiexedservice.dart';

class APIService {
  Future<http.Response> postData(
      String controller, Map<String, dynamic> data) async {
    final http.Response response = await http.post(
      Uri.parse('${FixedService.baseUrl}/$controller'),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8'
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      print('OK');
    } else {
      print(response.body);
      print(response.statusCode);
    }
    return response;
  }

  Future<http.Response> putData(
      String controller, Map<String, dynamic> data, int? id) async {
    final http.Response response = await http.put(
      Uri.parse('${FixedService.baseUrl}/$controller/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8'
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('OK');
    } else {
      print(response.body);
      print(response.statusCode);
    }
    return response;
  }

  Future<http.Response> deleteData(String controller, int? id) async {
    final http.Response response = await http.delete(
      Uri.parse('${FixedService.baseUrl}/$controller/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8'
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('OK');
    } else {
      print(response.body);
      print(response.statusCode);
    }
    return response;
  }

  Future<http.Response> getAll(String controller) async {
    final http.Response response = await http.get(
      Uri.parse('${FixedService.baseUrl}/$controller'),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8'
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('OK');
    } else {
      print(response.body);
      print(response.statusCode);
    }
    return response;
  }
}
