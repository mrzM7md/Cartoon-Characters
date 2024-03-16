import 'dart:io';
import 'package:path/path.dart';

import 'package:http/http.dart' as http;

const String HTTP_SERVER_LINK = 'http://10.0.2.2/store';

const String HTTP_LINK_SIGNUP = '$HTTP_SERVER_LINK/signup.php';

Future<http.Response> postRequest({
  required String url,
  required Map<String, dynamic> data
}) async {
  return await http.post(
      Uri.parse(url), body: data
  );
}


Future<http.Response> getRequest({required String url}) async {
  http.Response response = await http.get(
    Uri.parse(url),
  );
  return response;
}
