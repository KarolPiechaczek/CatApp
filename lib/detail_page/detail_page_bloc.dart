import 'package:first_flutter_app/api_result.dart';
import 'package:first_flutter_app/cat_service.dart';
import 'package:first_flutter_app/detail_page/detail_page_event.dart';
import 'package:first_flutter_app/detail_page/detail_page_state.dart';
import 'package:first_flutter_app/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPageBloc extends Bloc<DetailPageEvent, DetailStates> {
  DetailPageBloc() : super(InitialState() as DetailStates) {
    on<FetchCatDetailsEvent>(onFetchCatDetails);
  }

  void onFetchCatDetails(FetchCatDetailsEvent event, Emitter<DetailStates> emit) async {
    ApiResult result = await locator<CatService>().getCatDetails(event.catId);
    emit(UpdateState(result) as DetailStates);
  }
}
