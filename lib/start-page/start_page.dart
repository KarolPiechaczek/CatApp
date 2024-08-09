import 'package:first_flutter_app/cats_list_page/cats_list_page.dart';
import 'package:first_flutter_app/start-page/start_page_bloc.dart';
import 'package:first_flutter_app/start-page/start_page_event.dart';
import 'package:first_flutter_app/start-page/start_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  StartPageState createState() => StartPageState();
}

void navigateToCatsListPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => const CatsListPage(
              title: 'AppCat',
            )),
  );
}

class StartPageState extends State<StartPage> {
  @override
  void initState() {
    context.read<StartPageBloc>().add(CheckIfPressedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<StartPageBloc, StartPageStates>(builder: (context, state) {
      switch (state) {
        case InitialState():
          return initialCase();

        case ButtonPressedState():
          return buttonPressedCase();
      }
    }));
  }

  Widget initialCase() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buttonPressedCase() {
    return Center(
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
        ),
        onPressed: () {
          navigateToCatsListPage(context);
          context.read<StartPageBloc>().add(SignedInEvent());
        },
        child: const Text('Sign in'),
      ),
    );
  }
}
