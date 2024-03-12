/// * Put customized error message here
class CacheException implements Exception {
  final String customMessage;

  CacheException({required this.customMessage});

  @override
  String toString() {
    return '$customMessage.';
    // return '$customMessage. [${ErrorCodes.c001.name}]';
  }
}
