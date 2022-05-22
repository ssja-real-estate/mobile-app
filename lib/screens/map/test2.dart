import 'package:flutter/material.dart';
import 'package:flutter/src/painting/image_provider.dart';
import 'package:flutter_map/flutter_map.dart';

class MyTile extends TileProvider {
  @override
   getImage(Coords<num> coords, TileLayerOptions options)async {
    // TODO: implement getImage
    
    var x = AssetImage("assets/images/logo.png");
    return x;
  }
}

// class name extends StatelessWidget {
//   const name({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ErrorWidget.builder((x){
//       FlutterErrorDetails;
//     });
//   }
// }