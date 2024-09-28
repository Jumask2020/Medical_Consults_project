import 'package:get_storage/get_storage.dart';

class StorgeHelper {
  StorgeHelper._();
  static StorgeHelper? _storgeHelper;
  static StorgeHelper get instance {
    _storgeHelper ??= StorgeHelper._();
    return _storgeHelper!;
  }

  final GetStorage _box = GetStorage();
  readKey(String key) {
    return _box.read(key);
  }

  void writeKey(String key, dynamic value) {
    _box.write(key, value);
  }

  void deletKey(String key) {
    _box.remove(key);
  }

  void deleteAllKey() {
    _box.erase();
  }
}
