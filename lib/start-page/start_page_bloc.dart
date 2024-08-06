import 'package:first_flutter_app/shared_preferences.dart';
import 'package:first_flutter_app/start-page/start_page_event.dart';
import 'package:first_flutter_app/start-page/start_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../injection_container.dart';

class StartPageBloc extends Bloc<StartPageEvent, StartPageStates>{
  StartPageBloc() : super(InitialState() as StartPageStates){
    on<SignedInEvent>(onSignedIn);
    on<CheckIfPressedEvent>(onCheckIfPressed);
  }

  void onSignedIn(SignedInEvent event, Emitter<StartPageStates> emit) async{
    await locator<Helper>().saveIfPressedState(true);
    emit(ButtonPressedState(true) as StartPageStates);
  }

  void onCheckIfPressed(CheckIfPressedEvent event, Emitter<StartPageStates> emit) async{
    bool? isPressed = await locator<Helper>().getIfPressedState();
    emit(ButtonPressedState(isPressed) as StartPageStates);
  }
}