import 'dart:convert';
import 'package:http/http.dart ' as http;

class ApiHelper {
  Future<dynamic> getAPI({required String url}) async {
    var uri = Uri.parse(url);
    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var mData = jsonDecode(response.body);
        print("API Response: $mData"); // Add this for debugging
        return mData;
      } else {
        print(
            "API Error: ${response.statusCode} - ${response.body}"); // Debugging
        return null;
      }
    } catch (e) {
      print("API Exception: $e"); // Catch network issues
      return null;
    }
  }

  Future<dynamic> postAPI({
    required String url,
    required Map<String, dynamic>
        body, // Data to be sent in the POST request body
    Map<String, String>? headers, // Optional headers for the request
  }) async {
    var uri = Uri.parse(url);
    try {
      var response = await http.post(
        uri,
        body: jsonEncode(body), // Convert the body map to JSON
        headers: headers ??
            {
              "Content-Type": "application/json", // Default content type
            },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var mData = jsonDecode(response.body);
        print("POST API Response: $mData"); // Add this for debugging
        return mData;
      } else {
        print(
            "POST API Error: ${response.statusCode} - ${response.body}"); // Debugging
        return null;
      }
    } catch (e) {
      print("POST API Exception: $e"); // Catch network issues
      return null;
    }
  }
}
