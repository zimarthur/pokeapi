import 'dart:async';
import 'dart:io';
import 'package:fluttermon/Remote/url.dart';
import 'package:http/http.dart' as http;
import 'network_response.dart';

class NetworkApiService {
  Future<NetworkResponse> getResponse(
    String endPoint, {
    bool isCompleteUrl = false,
  }) async {
    try {
      String uri = isCompleteUrl ? endPoint : "$pokemonUrl$endPoint";
      final response = await http.get(Uri.parse(uri));
      return returnResponse(
        response,
      );
    } on SocketException catch (e) {
      return NetworkResponse(
        responseStatus: NetworkResponseStatus.error,
        responseBody: "Ops, you have no internet access",
      );
    }
  }

  NetworkResponse returnResponse(http.Response response) {
    if (response.statusCode.toString() == "200") {
      return NetworkResponse(
        responseStatus: NetworkResponseStatus.success,
        responseBody: response.body,
      );
    } else {
      return NetworkResponse(
          responseStatus: NetworkResponseStatus.error,
          responseBody: "Ops, there was a problem.\n Try again");
    }
  }
}
