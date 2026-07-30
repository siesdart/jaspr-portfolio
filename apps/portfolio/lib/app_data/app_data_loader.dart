// This one-method contract is the intentional seam for application data loaders.
// ignore_for_file: one_member_abstracts

abstract interface class AppDataLoader<T> {
  Future<T> load();
}
