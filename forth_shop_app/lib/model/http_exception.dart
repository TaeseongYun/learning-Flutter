class HttpException implements Exception {
  final String errorString;

  HttpException({this.errorString});

  @override
  String toString() {
    return errorString;
  }
}
