import 'package:first_flutter_app/api_result.dart';

sealed class DetailStates{}

class InitialState extends DetailStates{}

class UpdateState extends DetailStates{
  final ApiResult result;
  UpdateState(this.result);
}

class ResetState extends DetailStates{}