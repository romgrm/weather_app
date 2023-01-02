abstract class SecureStorageInterface {
  Future<String?> read(String key);
  Future<void> write(String key, String value);
  Future<void> deleteAll();
}
