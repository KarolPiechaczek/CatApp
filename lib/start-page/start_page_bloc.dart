import 'package:first_flutter_app/shared_preferences.dart';
import 'package:first_flutter_app/start-page/start_page_event.dart';
import 'package:first_flutter_app/start-page/start_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../injection_container.dart';

class StartPageBloc extends Bloc<StartPageEvent, StartPageStates>{
  StartPageBloc() : super(Loading()){
    on<LogIn>(onLogIn);
  }

  void onLogIn(LogIn event, Emitter<StartPageStates> emit) async{
    await locator<Helper>().saveIfPressedState(true);
    emit(NavigationToCatsListPage());
  }

}