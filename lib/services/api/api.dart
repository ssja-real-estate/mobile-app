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
    if (await CheckInternet.hasInternet()) {
          var uri = Uri.http(ApiStrings.siteName, unicode);
          var response = await http
              .post(uri, body: json, headers: Api.headeroption)
              .onError((error, stackTrace) {
            //! when get error in posting
            throw error!;
          });
          var result = jsonDecode(utf8.decode(response.bodyBytes));
          if (response.statusCode == 200) {
            return result;
          } else {
            throw result['error'];
          }
        
      
    } else {
      throw ApiStrings.noInternet;
    }
  }

  // todo verify user
  static Future getVerify(
      {required Map<String, dynamic> val, required String unicode}) async {
    Uri uri = Uri.http(ApiStrings.siteName, unicode, val);
    var response = await http.get(uri).onError((error, stackTrace) {
      //! when get error in get
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
