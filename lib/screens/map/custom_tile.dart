import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:saja/resources/api.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/screens/map/Custom_network_tile_provider.dart'
    as networkProvider;
import 'package:saja/services/snackbar/custom_snack_bar.dart';

class MyCustomTile extends TileProvider {
  MyCustomTile({required this.image});
  AssetImage image;
  @override
  ImageProvider<Object> getImage(Coords<num> coords, TileLayerOptions options) {
    try {
      return networkProvider.NetworkTileProvider().getImage(coords, options);
    } catch (e) {
       CustomSnackBar.showSnackbar(
          title: AppStrings.error, message: ApiStrings.noInternet);
      print("error");
      print(e);
      return image;
    }
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
