import 'package:http/http.dart' as http;

class ApiHelper {
  static ApiHelper obj = ApiHelper._();
  final String _baseurl = "https://bhagavadgitaapi.in/";

  ApiHelper._();

  factory ApiHelper() {
    return obj;
  }

  Future<String> getApiEnd(String endPoint) async {
    var future = await http.get(
      Uri.parse("$_baseurl$endPoint"));
    return future.body;
  }

  Future<String> getApiData(String url) async {
    var future = await http.get(Uri.parse(url));
    print("uri $_baseurl ");

    return future.body;
  }
}
