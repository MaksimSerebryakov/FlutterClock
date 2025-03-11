import 'dart:convert';
import 'dart:io';

class AppFileStorage {
  static final AppFileStorage instance = AppFileStorage._init();

  AppFileStorage._init();

  static File? _file;

  File _initFile(String filePath) {
    return File(filePath);
  }

  File get file {
    if (_file != null) {
      return _file!;
    }

    _file = _initFile(
      "alarms.json",
    );

    return _file!;
  }

  Future<File> writeToFile(List<Map<String, dynamic>> json) {
    String jsonString = jsonEncode(json);

    return file.writeAsString(jsonString);
  }

  Future<dynamic> readFromFile() async {
    dynamic json;
    String fileContent = await file.readAsString();
    if (fileContent != "") {
      json = jsonDecode(fileContent);
    }

    return json;
  }
}
