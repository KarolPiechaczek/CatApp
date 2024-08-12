import 'package:first_flutter_app/api_result.dart';

sealed class CatsListPageStates{}

class Loading extends CatsListPageStates{}

class DisplayCatsList extends CatsListPageStates{
  final ApiResult result;
  DisplayCatsList(this.result);
}

class NavigationToStartPage extends CatsListPageStates{}
