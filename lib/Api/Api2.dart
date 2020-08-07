import 'package:http/http.dart' as http;
class Api2 {

Future<String> getJson() async {
final url = 'ur';
var response = await http.get(url);

return"ok";
}


Future<String> posttJson() async {
final url = 'ur';
var response = await http.post(url,body: {'name': 'doodle', 'color': 'blue'});//classe.toJson

return"ok";
}
  
}