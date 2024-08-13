import 'package:first_flutter_app/cats_list_page/cats_list_page.dart';
import 'package:first_flutter_app/components/button.dart';
import 'package:first_flutter_app/start-page/start_page_bloc.dart';
import 'package:first_flutter_app/start-page/start_page_event.dart';
import 'package:first_flutter_app/start-page/start_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic showDialogStyle() {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Center(child: Text('APPCAT')),
          content: Text(
              'At AppCat you can not only look at pretty pictures of cats, but also learn interesting facts about them!'),
        ),
      );
    }

    Widget view() {
      Button loginButton = Button(function: showDialogStyle(), text: 'Log in'); //context.read<StartPageBloc>().add(LogIn())
      Button infoButton = Button(function: showDialogStyle(), text: 'Info');
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: loginButton.foregroundColor,
                backgroundColor: loginButton.backgroundColor,
              ),
              onPressed: () {
                context.read<StartPageBloc>().add(LogIn());
              },
              child: const Text('Log in'),
            ),

            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: infoButton.foregroundColor,
                backgroundColor: infoButton.backgroundColor
              ),
              onPressed: () {
                showDialogStyle();
              },
              child: const Text('Info'),
            ),
          ],
        ),
      );
    }

    void navigateToCatsListPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CatsListPage(
            title: 'AppCat',
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: Text('AppCat')),
      ),
      body: BlocListener<StartPageBloc, StartPageStates>(
        listenWhen: (previous, current) => current is NavigationToCatsListPage,
        listener: (context, state) {
          navigateToCatsListPage();
        },
        child: view(),
      ),
    );
  }
}
