
import 'dart:io';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

  // Future<Record> _getRecords() async { 
  //       var response = await http.get(Uri.encodeFull("url"),
  //       headers: {"Authorization": "**","Accept": "application/json"});
  //       if (response.statusCode == 200) {
          
  //         return recordFromJson(response.body);
  //         } else {
  //           print(response.statusCode);
  //           }
  //           } 
