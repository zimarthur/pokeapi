class NetworkResponse {
  NetworkResponseStatus responseStatus;
  String? responseBody;

  NetworkResponse({
    required this.responseStatus,
    this.responseBody,
  });
}

enum NetworkResponseStatus { success, error }
