class AppException implements Exception {
  AppException(this.message, [this.tag]);

  final String? tag;
  final String? message;

  @override
  String toString() => "[$tag] $message";
}
