import 'package:bookshelf/presentation/book_screen.dart';
import 'package:bookshelf/presentation/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di.dart';

class Navigation {
  static Map<String, WidgetBuilder> get routes => {
    "/search": (_) => BlocProvider(
        create: (_) => di<SearchCubit>(),
        child: const SearchScreen()
    ),
    "/book": (_) => BlocProvider(
        create: (_) => di<BookCubit>()..fetch(),
        child: const BookScreen()),
  };
}