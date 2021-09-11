import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> checkPermission() async {
  PermissionStatus perm = await Permission.storage.status;
  if (perm.isGranted) return true;
  if (await Permission.storage.request().isGranted) return true;
  return false;
}

Future<bool> saveImage(String url, String path) async {
  if (Platform.isAndroid) {
    return _saveImageAndroid(url, path);
  } else {
    return false;
  }
}

Future<bool> _saveImageAndroid(String url, String path) async {
  final cache = DefaultCacheManager();
  var perm = await checkPermission();
  if (perm) {
    final file = await cache.getFileFromCache(url);
    final fileName = url.split('/').last;
    final newFile = File(path + fileName);
    newFile.createSync();
    newFile.writeAsBytes(file!.file.readAsBytesSync());
    return true;
  }
  return false;
}
