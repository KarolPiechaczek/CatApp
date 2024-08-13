import 'package:first_flutter_app/api_result.dart';
import 'package:first_flutter_app/cat_service.dart';
import 'package:first_flutter_app/detail_page/detail_page_event.dart';
import 'package:first_flutter_app/detail_page/detail_page_state.dart';
import 'package:first_flutter_app/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPageBloc extends Bloc<DetailPageEvent, DetailStates> {
  DetailPageBloc() : super(Loading()) {
    on<OnInit>(onInitState);
  }

  void onInitState(OnInit event, Emitter<DetailStates> emit) async {
    emit(Loading());
    ApiResult result = await locator<CatService>().getCatDetails(event.catId);
    emit(CatDetails(result));
  }
}
