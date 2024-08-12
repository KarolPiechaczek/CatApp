import 'package:first_flutter_app/api_result.dart';
import 'package:first_flutter_app/cat_service.dart';
import 'package:first_flutter_app/cats_list_page/cats_list_page_event.dart';
import 'package:first_flutter_app/cats_list_page/cats_list_page_state.dart';
import 'package:first_flutter_app/injection_container.dart';
import 'package:first_flutter_app/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CatsListPageBloc extends Bloc<CatsListPageEvent, CatsListPageStates> {
  CatsListPageBloc() : super(Loading()) {
    on<FetchCats>(onFetchCats);
    on<OnInit>(onInitState);
  }

  void onFetchCats(FetchCats event, Emitter<CatsListPageStates> emit) async {}

  void onInitState(OnInit event, Emitter<CatsListPageStates> emit) async{
    emit(Loading());

    bool isSignedIn = await GetIt.instance<Helper>().getIfPressedState();
    if (isSignedIn) {
      ApiResult result = await locator<CatService>().getCats();
      emit(DisplayCatsList(result));
    } else {
      emit(NavigationToStartPage());
    }
  }
}
