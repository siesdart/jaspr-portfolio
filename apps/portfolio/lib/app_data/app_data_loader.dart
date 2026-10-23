abstract interface class AppDataLoader<T> {
  Future<T> load();
}
