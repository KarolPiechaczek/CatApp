import 'package:first_flutter_app/api_result.dart';
import 'package:first_flutter_app/cat_service.dart';
import 'package:first_flutter_app/cats_list_page/cats_list_page_event.dart';
import 'package:first_flutter_app/cats_list_page/cats_list_page_state.dart';
import 'package:first_flutter_app/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatsListPageBloc extends Bloc<CatsListPageEvent, CatsListPageStates>{
  CatsListPageBloc() : super(InitialState()){
    on<FetchCatsEvent>(onFetchCats);
  }

  void onFetchCats(FetchCatsEvent event, Emitter<CatsListPageStates> emit) async{
    ApiResult result = await locator<CatService>().getCats();
    emit(UpdateState(result));
  }
}