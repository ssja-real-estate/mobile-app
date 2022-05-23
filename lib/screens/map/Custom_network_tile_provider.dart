import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'package:saja/resources/api.dart';
import 'package:saja/resources/asset_addresses.dart';
import 'package:saja/resources/strings.dart';
import 'package:saja/services/snackbar/custom_snack_bar.dart';

class NetworkTileProvider extends TileProvider {
  @override
  ImageProvider getImage(Coords<num> coords, TileLayerOptions options) {
    return NetworkImageWithRetry(getTileUrl(coords, options));
  }
}

class NetworkImageWithRetry extends ImageProvider<NetworkImageWithRetry> {
  final String url;
  final double scale;
  final RetryClient retryClient = RetryClient(Client());
  NetworkImageWithRetry(this.url, {this.scale = 1.0});

  @override
  ImageStreamCompleter load(NetworkImageWithRetry key, decode) {
    return OneFrameImageStreamCompleter(_loadWithRetry(key, decode),
        informationCollector: () sync* {
      yield ErrorDescription('Image provider: $this');
      yield ErrorDescription('Image key: $key');
    });
  }

  @override
  Future<NetworkImageWithRetry> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<NetworkImageWithRetry>(this);
  }

  Future<ImageInfo> _loadWithRetry(
      NetworkImageWithRetry key, DecoderCallback decode) async {
    assert(key == this);
    try {
      final uri = Uri.parse(url);
      final response = await retryClient.get(uri);
      final codec = await decode(response.bodyBytes);
      final image = (await codec.getNextFrame()).image;
      return ImageInfo(
        image: image,
        scale: key.scale,
      );
    } catch (e) {
      CustomSnackBar.showSnackbar(
          title: AppStrings.error, message: ApiStrings.noInternet);
      print("error Custom_network.dart");
      print(e);
      Uint8List data = (await rootBundle.load(AppAssetAddress.logoAddress))
          .buffer
          .asUint8List();
      //  Uint8List.sublistView(response.)
      //  FileImage file=FileImage(File.fromRawPath(rawPath));
      final codec = await decode(data);
      final image = (await codec.getNextFrame()).image;
      return ImageInfo(image: image);
    }
  }
}
