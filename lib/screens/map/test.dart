import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart' ;
import 'package:http/http.dart';
import 'package:http/retry.dart';

class NetworkImageWithRetry extends ImageProvider<NetworkImageWithRetry> {
  /// The URL from which the image will be fetched.
  final String url;

  /// The scale to place in the [ImageInfo] object of the image.
  final double scale;

  /// The http RetryClient that is used for the requests
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
       final response = Image.asset("name");
       Asset assetBundle=Asset();
       File.fromUri(uri)
       Uriass
      //  Uint8List.sublistView(response.)
      //  FileImage file=FileImage(File.fromRawPath(rawPath));
    final codec = await decode(response.image.);
    final image = (await codec.getNextFrame()).image;
      return ImageInfo(image: image);
    }
  }
}
