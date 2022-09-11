import 'package:dio/dio.dart';
import 'package:getpostapi/users.dart';

abstract class Services {
  static Future<Users?> getUserId(int id) async {
    try {
      var requests = await Dio().get('https://reqres.in/api/users/$id');
      if (requests.statusCode == 200) {
        return Users(
            id: requests.data['data']['id'],
            urlphoto: requests.data['data']['avatar'],
            name: requests.data['data']['first_name'] +
                ' ' +
                requests.data['data']['last_name'],
            email: requests.data['data']['email']);
      }
      return null;
    } catch (errors) {
      throw Exception(errors.toString());
    }
  }

  static Future<Users?> postUser(
      String fName, String lName, String email) async {
    try {
      var requests = await Dio().post('https://reqres.in/api/users/', data: {
        'first_name': fName,
        'last_name': lName,
        'email': email,
      });
      if (requests.statusCode == 201) {
        return Users(
            id: int.tryParse(requests.data['id'].toString()) ?? 0,
            name:
                requests.data['first_name'] + ' ' + requests.data['last_name'],
            email: requests.data['email']);
      }
    } catch (errors) {
      throw Exception(errors.toString());
    }
    return null;
  }
}
