import 'package:first_flutter_app/cats_list_page/cats_list_page_bloc.dart';
import 'package:first_flutter_app/cats_list_page/cats_list_page_event.dart';
import 'package:first_flutter_app/cats_list_page/cats_list_page_state.dart';
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
    context.read<CatsListPageBloc>().add(FetchCatsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Center(child: Text(widget.title)),
        ),
        body: BlocBuilder<CatsListPageBloc, CatsListPageStates>(
                builder: (context, state) {
                  switch (state) {
                    
                    case InitialState():
                      return const Center(
                        child: CircularProgressIndicator(),
                      );

                    case DisplayDataState():
                      return switch (state.result) {
                        Success() => ListView.builder(
                            itemCount: (state.result as Success).result.length,
                            itemBuilder: (
                              context,
                              index,
                            ) =>
                                getMyRow(
                                    index, (state.result as Success), context),
                          ),
                        Failure() => Center(
                            child: Text((state.result as Failure).errorMessage),
                          ),
                      };

                    case NavigateToStartPageState():
                      return const StartPage();
                  }
                },
              )
    );
  }
}
