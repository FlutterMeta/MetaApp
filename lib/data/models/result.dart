// Represents result of an operation, with success and message.
class Result {
  final bool success;
  final String? message;

  Result({required this.success, this.message});

  factory Result.success() {
    return Result(success: true);
  }

  factory Result.failure({String? message}) {
    return Result(success: false, message: message);
  }
}
