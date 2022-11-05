import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class TarefasDao {
  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory);
    return File('${directory.path}/data.json');
  }

  Future<File> saveData(list) async {
    String data = json.encode(list);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String?> readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
