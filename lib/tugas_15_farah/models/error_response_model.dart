class ErrorResponse {
  final String message;
  final Map<String, List<String>>?
  errors; // Nullable because errors might not always be present

  ErrorResponse({required this.message, this.errors});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    Map<String, List<String>>? parsedErrors;
    if (json['errors'] != null) {
      parsedErrors = {};
      json['errors'].forEach((key, value) {
        if (value is List) {
          parsedErrors![key] = List<String>.from(value);
        }
      });
    }

    return ErrorResponse(message: json['message'], errors: parsedErrors);
  }
}