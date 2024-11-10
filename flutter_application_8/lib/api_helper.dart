import 'package:http/http.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {
  //FUNCTION that reurns data bta3ty in any endpoint(API)
  //reurn a MAP!!!
  static Future<Map<String, dynamic>> GetData(String endpointUrl) async {
    Uri url = Uri.parse(endpointUrl);
    http.Response response =
        await http //response dih btgblk baa el map bta3t el api dah
            .get(
                url); // btakhod future value response fa lazem tkon asyn w await
    //print(response.body); // hna 34an a-print el data bta3yt lazem tkon .body mn gherha mafish
    Map<String, dynamic> Data = jsonDecode(response
        .body); //el hagat ely httla3 mn hna htkon map string dynamic baa msh string kda ana 3mlt convert
    return Data;
  }
}
