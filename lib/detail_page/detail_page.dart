import 'package:first_flutter_app/api_result.dart';
import 'package:first_flutter_app/detail_page/detail_page_bloc.dart';
import 'package:first_flutter_app/detail_page/detail_page_event.dart';
import 'package:first_flutter_app/detail_page/detail_page_state.dart';
import 'package:first_flutter_app/detail_page/display_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.catId});

  final String catId;

  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  late ApiResult result;

  @override
  void initState() {
    super.initState();
    context.read<DetailPageBloc>().add(FetchCatDetailsEvent(widget.catId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Details'),
      ),
      body: BlocBuilder<DetailPageBloc, DetailStates>(
        builder: (context, state) {
          switch (state) {
            case InitialState():
              return initialCase();
            case UpdateState():
              return updateCase(state.result);
          }
        },
      ),
    );
  }

  Widget initialCase() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget updateCase(ApiResult result) {
    return switch (result) {
      Success success => displayInfo(success),
      Failure failure => Center(
          child: Text(failure.errorMessage),
        )
    };
  }
}
