abstract class AppStorage {
  String load(String key);
  Future<String> loadOrInit(String key, String initialValue);
  Future<void> save(String key, String value);
}
