import 'package:first_flutter_app/start-page/start_page_event.dart';
import 'package:first_flutter_app/start-page/start_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartPageBloc extends Bloc<StartPageEvent, StartPageStates>{
  StartPageBloc() : super(InitialState() as StartPageStates){
    on<SignedInEvent>(onSignedIn);
  }

  void onSignedIn(SignedInEvent event, Emitter<StartPageStates> emit) async{
    emit(UpdateState(true) as StartPageStates);
  }
}