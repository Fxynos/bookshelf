import 'package:bookshelf/presentation/book_screen.dart';
import 'package:bookshelf/presentation/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
      MaterialApp(
        title: 'Bookshelf',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "/search",
        routes: {
          "/search": (_) => BlocProvider(
            create: (_) => SearchCubit(),
            child: const SearchScreen()
          ),
          "/book": (_) => BlocProvider(
              create: (_) {
                final cubit = BookCubit();
                cubit.fetch();
                return cubit;
              },
              child: const BookScreen()
          ),
        },
      )
  );
}