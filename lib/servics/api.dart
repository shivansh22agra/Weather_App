import 'dart:convert';


import 'package:http/http.dart' as http;

const apikey = "42fd844028b7613e92d09c0ea33018ef";

class Network {
  Network({required this.url});
  String url;

  Future GetData() async {
    http.Response response = await http.get(Uri.parse(url));

    String data = response.body;
    var DecodeJson = jsonDecode(data);
    return DecodeJson;
    //print(DecodeJson["coord"]["lon"]);
  //  print(data);
  }
}
