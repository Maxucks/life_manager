import 'package:life_manager/app/core/storage/app_storage.dart';
import 'package:life_manager/app/core/storage/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsStorage implements AppStorage {
  const SharedPrefsStorage({
    required this.prefs,
  });

  final SharedPreferences prefs;

  @override
  String load(String key) {
    if (!prefs.containsKey(key)) {
      throw StorageException(
        "Passed key doesn't exist in the storage",
        "SharedPrefsStorage.load",
      );
    }

    final retrievedData = prefs.getString(key);

    if (retrievedData == null) {
      throw StorageNoDataException(
        "SharedPrefsStorage.load",
      );
    }

    return retrievedData;
  }

  @override
  Future<String> loadOrInit(String key, String initialValue) async {
    if (!prefs.containsKey(key)) {
      await save(key, initialValue);
    }

    final retrievedData = prefs.getString(key);

    if (retrievedData == null) {
      throw StorageNoDataException(
        "SharedPrefsStorage.loadOrInit",
      );
    }

    return retrievedData;
  }

  @override
  Future<void> save(String key, String value) async {
    final status = await prefs.setString(key, value);

    if (!status) {
      throw StorageSaveFailedException(
        "SharedPrefsStorage.save",
      );
    }
  }
}
