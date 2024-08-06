import 'package:first_flutter_app/api_result.dart';

sealed class CatsListPageStates{}

class InitialState extends CatsListPageStates{}

class DisplayDataState extends CatsListPageStates{
  final ApiResult result;
  DisplayDataState(this.result);
}

class NavigateToStartPageState extends CatsListPageStates{}
