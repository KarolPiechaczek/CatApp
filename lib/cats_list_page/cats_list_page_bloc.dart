import 'package:first_flutter_app/api_result.dart';
import 'package:first_flutter_app/cat_service.dart';
import 'package:first_flutter_app/cats_list_page/cats_list_page_event.dart';
import 'package:first_flutter_app/cats_list_page/cats_list_page_state.dart';
import 'package:first_flutter_app/injection_container.dart';
import 'package:first_flutter_app/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CatsListPageBloc extends Bloc<CatsListPageEvent, CatsListPageStates>{
  CatsListPageBloc() : super(InitialState()){
    on<FetchCatsEvent>(onFetchCats);
  }

  void onFetchCats(FetchCatsEvent event, Emitter<CatsListPageStates> emit) async{
    bool isSignedIn = await GetIt.instance<Helper>().getIfPressedState();
    if(isSignedIn) {
      ApiResult result = await locator<CatService>().getCats();
       emit(DisplayDataState(result));
    }else{
     emit(NavigateToStartPageState());
    }
    
   
  }
}