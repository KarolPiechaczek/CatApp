import 'package:first_flutter_app/cats_list_page/cats_list_page.dart';
import 'package:first_flutter_app/start-page/start_page_bloc.dart';
import 'package:first_flutter_app/start-page/start_page_event.dart';
import 'package:first_flutter_app/start-page/start_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget view() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                backgroundColor: WidgetStateProperty.all<Color>(
                    const Color.fromARGB(255, 102, 198, 242)),
              ),
              onPressed: () {
                context.read<StartPageBloc>().add(LogIn());
              },
              child: const Text('Log in'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                backgroundColor: WidgetStateProperty.all<Color>(
                    const Color.fromARGB(255, 102, 198, 242)),
              ),
              child: const Text('Info'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    title: Center(child: Text('APPCAT')),
                    content: Text(
                        'At AppCat you can not only look at pretty pictures of cats, but also learn interesting facts about them!'),
                  ),
                );
              },
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

    void loadingCase() {
      const CircularProgressIndicator();
    }

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Center(child: Text('AppCat')),
        ),
      body: BlocListener<StartPageBloc, StartPageStates>(
        listener: (context, state) {
          switch (state) {
            case Loading():
              loadingCase();
            case NavigationToCatsListPage():
              navigateToCatsListPage();
          }
        },
        child: view(),
      ),
    );
  }
}
