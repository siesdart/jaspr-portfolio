/// Thrown when a required application source cannot be read or decoded.
class AppDataSourceException implements Exception {
  const AppDataSourceException(this.path, this.cause, [this.stackTrace]);

  final String path;
  final Object cause;
  final StackTrace? stackTrace;

  @override
  String toString() => 'Failed to load source $path: $cause';
}
