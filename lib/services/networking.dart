import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper({this.url});

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      int condition = jsonDecode(response.body)['weather'][0]['id'];
      double temperature = jsonDecode(response.body)['main']['temp'];
      String city = jsonDecode(response.body)['name'];
      print('Condition: $condition \nTemp: $temperature \nCity: $city');
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      //return null;
    }
  }
}
