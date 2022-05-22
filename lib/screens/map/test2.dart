import 'package:flutter/material.dart';
import 'package:flutter/src/painting/image_provider.dart';
import 'package:flutter_map/flutter_map.dart';

class MyTile implements TileProvider {
  @override
  ImageProvider<Object> getImage(Coords<num> coords, TileLayerOptions options) {
    // TODO: implement getImage
    var x = AssetImage("assets/images/logo.png");
    try {
      return NetworkTileProvider().getImage(coords, options);
    } catch (e) {
      print("error");
      print(e);
      return x;
    }
    throw UnimplementedError();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  String getSubdomain(Coords<num> coords, TileLayerOptions options) {
    // TODO: implement getSubdomain
    throw UnimplementedError();
  }

  @override
  String getTileUrl(Coords<num> coords, TileLayerOptions options) {
    // TODO: implement getTileUrl
    throw UnimplementedError();
  }

  @override
  int invertY(int y, int z) {
    // TODO: implement invertY
    throw UnimplementedError();
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