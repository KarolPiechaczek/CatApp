import 'package:first_flutter_app/api_result.dart';

sealed class CatsListPageState{}

class Loading extends CatsListPageState{}

class DisplayCatsList extends CatsListPageState{
  final ApiResult result;
  DisplayCatsList(this.result);
}

class NavigationToStartPage extends CatsListPageState{}
