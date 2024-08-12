import 'package:first_flutter_app/api_result.dart';

sealed class DetailStates{}

class Loading extends DetailStates{}

class CatDetails extends DetailStates{
  final ApiResult result;
  CatDetails(this.result);
}