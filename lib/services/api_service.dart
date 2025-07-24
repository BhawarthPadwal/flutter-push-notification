import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

/// A service class for handling API requests.
class ApiService {
  static final logger = Logger();

  /// Sends a POST request to the specified endpoint.
  ///
  /// [endpoint] The API endpoint to send the request to.
  /// [body] The request body to be sent in JSON format.
  ///
  /// Returns a [Future] that completes with a [Map] containing the response status and data.
  /// Throws an [Exception] if the request fails.
  static Future<Map<String, dynamic>> post(
    String endpoint,
    Map<String, dynamic>? body,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(endpoint),
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );

      final parsedBody = jsonDecode(response.body);

      final result = {'status': response.statusCode, 'data': parsedBody};

      if (response.statusCode == 200 || response.statusCode == 201) {
        logger.d(result);
      } else {
        logger.e(result);
      }

      return result;
    } catch (e) {
      logger.e(e);
      throw Exception(e.toString());
    }
  }
}
