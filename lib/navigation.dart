import 'package:bookshelf/presentation/book_screen.dart';
import 'package:bookshelf/presentation/search_screen.dart';
import 'package:bookshelf/presentation/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di.dart';

class Navigation {
  static Map<String, WidgetBuilder> get routes => {
    "/search": (_) => BlocProvider(
        create: (_) => di<SearchCubit>(),
        child: const _ScreenWrapper(headline: "Поиск книг", body: SearchScreen())
    ),
    "/book": (context) => BlocProvider(
        create: (_) => di<BookCubit>(
            param1: _getArgs<BookArgs>(context)
        )..fetch(),
        child: const _ScreenWrapper(headline: "Книга", body: BookScreen())),
  };
}

T _getArgs<T>(BuildContext context) =>
    ModalRoute.of(context)!.settings.arguments as T;

class _ScreenWrapper extends StatelessWidget {

  final String headline;
  final Widget body;

  const _ScreenWrapper({super.key, required this.headline, required this.body});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(headline, style: AppTypography.h1)),
    body: body
  );
}