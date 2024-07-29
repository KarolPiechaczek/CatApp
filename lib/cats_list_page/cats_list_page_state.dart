import 'package:first_flutter_app/api_result.dart';

sealed class CatsListPageStates{}

class InitialState extends CatsListPageStates{}

class UpdateState extends CatsListPageStates{
  final ApiResult result;
  UpdateState(this.result);
}