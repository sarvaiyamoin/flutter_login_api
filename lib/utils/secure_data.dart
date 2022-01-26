import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureData {
  final _storage = const FlutterSecureStorage();

  Future writeSecureData(String key, String value) async {
    var writeData = await _storage.write(key: key, value: value);
    return writeData;
  }

  Future readData(String key) async {
    var readData = await _storage.read(key: key);
    return readData;
  }

  Future deleteData(String key) async {
    var deletedData = await _storage.delete(key: key);
    return deletedData;
  }
}
