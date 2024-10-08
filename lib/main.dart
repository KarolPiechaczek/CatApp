import 'package:first_flutter_app/cats_list_page/cats_list_page.dart';
import 'package:first_flutter_app/cats_list_page/cats_list_page_bloc.dart';
import 'package:first_flutter_app/detail_page/detail_page_bloc.dart';
import 'package:first_flutter_app/injection_container.dart';
import 'package:first_flutter_app/shared_preferences.dart';
import 'package:first_flutter_app/start-page/start_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StartPageBloc(),
        ),
        BlocProvider(
          create: (context) => CatsListPageBloc(),
        ),
        BlocProvider(
          create: (context) => DetailPageBloc(),
        ),
      ],
      child: MaterialApp(
              title: 'AppCat',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                    seedColor: const Color.fromARGB(255, 167, 220, 245)),
                useMaterial3: true,
              ),
              home: const CatsListPage(title: 'AppCat'),
            ),
    );
  }
}
