import 'package:first_flutter_app/api_result.dart';
import 'package:http/http.dart' as http;
import 'package:first_flutter_app/cat.dart';

Future<ApiResult> getCats() async {
  Uri url = Uri.parse('https://api.thecatapi.com/v1/images/search?limit=10');
  var response = await http.get(url);
  List<Cat>cats = catsFromJson(response.body);

  if (response.statusCode == 200) {
    return Success(result: cats);
  } else {
    return Failure(errorMessage: '${response.statusCode}: ${response.body}');
  }
}


