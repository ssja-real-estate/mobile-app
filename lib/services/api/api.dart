import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:saja/services/api/connectivity.dart';
import '../../resources/api.dart';

class Api {
  static Map<String, String> headeroption = {
    "Content-Type": "application/json;charset=utf-8"
  };
  // todo post
  static Future post({required String json, required String unicode}) async {
    // unicode :
<<<<<<< HEAD
    if (await CheckInternet.hasInternet()) {
      if (await CheckInternet.usingVpn()) {
        throw ApiStrings.vpnOff;
=======
    try {
      print("post in api started");
      print(ApiStrings.siteName);
      Uri uri = Uri.http(ApiStrings.siteName, unicode);

      print("json is :" + json);
      var response = await http
          .post(uri, body: json, headers: Api.headeroption)
          .onError((error, stackTrace) {
        //! when get error in posting
        print("error");
        print(error);
        throw error!;
      });

      print(utf8.decode(response.bodyBytes));
      print(response.statusCode);
      var result = jsonDecode(utf8.decode(response.bodyBytes));
      if (response.statusCode == 200) {
        print("status is 200");
        return result;
>>>>>>> add-database
      } else {
        try {
          print("post in api started");
          print(ApiStrings.siteName);
          var uri = Uri.http(ApiStrings.siteName, unicode);
          print("json is :" + json);
          var response = await http
              .post(uri, body: json, headers: Api.headeroption)
              .onError((error, stackTrace) {
            //! when get error in posting
            print("error");
            print(error);
            throw error!;
          });
          print(utf8.decode(response.bodyBytes));
          print(response.statusCode);
          var result = jsonDecode(utf8.decode(response.bodyBytes));
          if (response.statusCode == 200) {
            print("status is 200");
            return result;
          } else {
            print("post in api ended2");
            throw result['error'];
          }
        } catch (e) {
          print(e.toString());
          throw ApiStrings.apiError;
        }
      }
<<<<<<< HEAD
    } else {
      throw ApiStrings.noInternet;
=======
    } catch (e) {
      print(e.toString());
      throw e;
>>>>>>> add-database
    }
  }

  // todo verify user
  static Future getVerify(
      {required Map<String, dynamic> val, required String unicode}) async {
    Uri uri = Uri.http(ApiStrings.siteName, unicode, val);
    var response = await http.get(uri).onError((error, stackTrace) {
      //! when get error in get
      print("error");
      print(error);
      throw error!;
    });
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return result;
    } else {
      throw response.statusCode;
    }
  }
}
