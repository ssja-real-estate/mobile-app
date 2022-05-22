// // other imports
// import 'dart:typed_data';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:file/src/interface/file.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// // import 'package:flutter_cache_manager/src/web_helper.dart'; // ignore: implementation_imports
// import 'package:flutter_map/flutter_map.dart';
// import 'package:http/http.dart' as http;

// typedef ErrorResponseHandler = Future<http.Response> Function(Object error,
//     [StackTrace stack]);

// class MyTileProvider extends TileProvider {
//   MyTileProvider({required this.errorHandler});

//   final ErrorResponseHandler errorHandler;

//   @override
//   ImageProvider getImage(Coords<num> coords, TileLayerOptions options) {
//     final url = getTileUrl(coords, options);
//     final cacheManager = MyCacheManager.instance..errorHandler = errorHandler;
//     return CachedNetworkImageProvider(
//       url,
//       cacheManager: cacheManager,
//     );
//   }
// }

// class MyCacheManager extends BaseCacheManager {
//   static MyCacheManager _instance
//   static MyCacheManager get instance => _instance ??= MyCacheManager._();

//   MyCacheManager._() : super() {
//     webHelper = WebHelper(store, _fetch);
//   }

//   ErrorResponseHandler errorHandler;

//   @override
//    getFilePath(){

//   }

//   Future<FileFetcherResponse> _fetch(String url,
//       {required Map<String, String> headers}) async {
//     try {
//       final response = await http.get(Uri.parse(url), headers: headers);
//       return new HttpFileFetcherResponse(response);
//     } catch (e, stack) {
//       if (errorHandler != null) {
//         final response = await errorHandler(e, stack);
//         return new HttpFileFetcherResponse(response);
//       }
//       rethrow;
//     }
//   }

//   @override
//   Future<void> dispose() {
//     // TODO: implement dispose
//     throw UnimplementedError();
//   }

//   @override
//   Future<FileInfo> downloadFile(String url, {String? key, Map<String, String>? authHeaders, bool force = false}) {
//     // TODO: implement downloadFile
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> emptyCache() {
//     // TODO: implement emptyCache
//     throw UnimplementedError();
//   }

//   @override
//   Stream<FileInfo> getFile(String url, {String key, Map<String, String> headers}) {
//     // TODO: implement getFile
//     throw UnimplementedError();
//   }

//   @override
//   Future<FileInfo?> getFileFromCache(String key, {bool ignoreMemCache = false}) {
//     // TODO: implement getFileFromCache
//     throw UnimplementedError();
//   }

//   @override
//   Future<FileInfo?> getFileFromMemory(String key) {
//     // TODO: implement getFileFromMemory
//     throw UnimplementedError();
//   }

//   @override
//   Stream<FileResponse> getFileStream(String url, {String? key, Map<String, String>? headers, bool withProgress}) {
//     // TODO: implement getFileStream
//     throw UnimplementedError();
//   }

//   @override
//   Future<File> getSingleFile(String url, {String key, Map<String, String> headers}) {
//     // TODO: implement getSingleFile
//     throw UnimplementedError();
//   }

//   @override
//   Future<File> putFile(String url, Uint8List fileBytes, {String? key, String? eTag, Duration maxAge = const Duration(days: 30), String fileExtension = 'file'}) {
//     // TODO: implement putFile
//     throw UnimplementedError();
//   }

//   @override
//   Future<File> putFileStream(String url, Stream<List<int>> source, {String? key, String? eTag, Duration maxAge = const Duration(days: 30), String fileExtension = 'file'}) {
//     // TODO: implement putFileStream
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> removeFile(String key) {
//     // TODO: implement removeFile
//     throw UnimplementedError();
//   }
// }