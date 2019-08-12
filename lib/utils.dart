import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Utils {
  static final Utils _utils = new Utils._internal();

  factory Utils() {
    return _utils;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/token.txt');
  }

  Future<String> readUserInfos() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      return ""; // if error return empty token
    }
  }

  Future<File> writeUserInfos(String token) async {
    final file = await _localFile;
    return file.writeAsString(token);
  }

  Future<bool> deleteUserInfo() async {
    try {
      final file = await _localFile;
      file.delete();
      return true;
    } catch (e) {
      return false; // if error return unsuccessful
    }
  }

  Utils._internal();
}
