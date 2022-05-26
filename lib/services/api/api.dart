import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:saja/services/api/connectivity.dart';
import '../../resources/api.dart';

class Api {
  static Map<String, String> headeroption = {
    "Content-Type": "application/json;charset=utf-8"
  };
  // todo post
  static Future post(
      {required String json,
      required String unicode,
      String queryNotMap: '',
      Map<String, dynamic> params: const {}}) async {
    // unicode :

    try {
      if (await CheckInternet.hasInternet()) {
        var uri = Uri(
            host: ApiStrings.siteNameWithoutPort,
            scheme: "https",
            path: unicode + queryNotMap,
            queryParameters: params);
        print(uri);
        http.Response response = await http
            .post(uri, body: json, headers: Api.headeroption)
            .then((value) {
          return value;
        }).catchError((error) {
          //! when get error in Posting
          throw error!;
        });
        var result;
        try {
          result = jsonDecode(utf8.decode(response.bodyBytes));
        } catch (e) {
          result = response.body;
        }
        if (response.statusCode == 200) {
          print(result);

          return result;
        } else {
          throw result['error'];
        }
      } else {
        throw ApiStrings.noInternet;
      }
    } catch (e) {
      if (e.toString().contains("exception") ||
          e.toString().contains("SocketException") ||
          e.toString().contains("Exception") ||
          e.toString().contains("Failed host lookup")) {
        throw ApiStrings.noInternet;
      } else {
        // print(e);
        rethrow;
      }
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
