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

void popCatsListPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => const CatsListPage(
              title: 'CatApp',
            )),
  );
}

class StartPageState extends State<StartPage> {
  @override
  void initState() {
    context.read<StartPageBloc>().add(SignedInEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<StartPageBloc, StartPageStates>(builder: (context, state) {
      switch (state) {
        case InitialState():
          return const Center(
            child: CircularProgressIndicator(),
          );

        case UpdateState():
          return Center(
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                popCatsListPage(context);
              },
              child: const Text('Sign in'),
            ),
          );
      }
    }));
  }
}
