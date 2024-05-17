class Failure implements Exception {
  final String statusMessage;

  Failure(this.statusMessage);

  @override
  String toString() {
    return 'statusMessage: $statusMessage';
  }
}
