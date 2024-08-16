import 'package:first_flutter_app/cats_list_page/cats_list_page_bloc.dart';
import 'package:first_flutter_app/cats_list_page/cats_list_page_event.dart';
import 'package:first_flutter_app/cats_list_page/cats_list_page_state.dart';
import 'package:first_flutter_app/shared_preferences.dart';
import 'package:first_flutter_app/start-page/start_page.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/api_result.dart';
import 'package:first_flutter_app/cats_list_page/get_my_row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatsListPage extends StatefulWidget {
  const CatsListPage({super.key, required this.title});

  final String title;

  @override
  State<CatsListPage> createState() => _CatsListPageState();
}

class _CatsListPageState extends State<CatsListPage> {
  @override
  void initState() {
    context.read<CatsListPageBloc>().add(OnInit());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocConsumer<CatsListPageBloc, CatsListPageState>(
        builder: (context, state) {
          if (state is Loading) {
            return loadingCase();
          }
          if (state is DisplayCatsList) {
            return displayCatsListCase(state.result);
          }
          return const CircularProgressIndicator();
        },
        listenWhen: (previous, current) => current is NavigationToStartPage,
        listener: (context, state) {
          navigationToStartPageCase();
        },
      ),
      drawer: _drawer(),
    );
  }

  Widget _drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 167, 220, 245)),
            child: Center(child: Text('Options')),
          ),
          ListTile(
            title: const Text('List'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: const Text('Log out'),
            onTap: () => {
              context.read<CatsListPageBloc>().add(LogOut()),
              Navigator.pop(context),
            },
          )
        ],
      ),
    );
  }

  Widget loadingCase() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget displayCatsListCase(ApiResult result) {
    return switch (result) {
      Success() => ListView.builder(
          itemCount: (result).result.length,
          itemBuilder: (context, index) => getMyRow(index, result, context),
        ),
      Failure() => Center(
          child: Text((result).errorMessage),
        )
    };
  }

  void navigationToStartPageCase() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const StartPage(),
      ),
    );
  }
}
