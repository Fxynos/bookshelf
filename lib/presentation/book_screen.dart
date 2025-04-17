import 'package:bookshelf/domain/entity/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookScreen extends StatelessWidget {

  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<BookCubit, BookState>(builder: (context, state) {
        if (state is DefaultBookState) {
          return const Spacer();
        }

        if (state is ResultsBookState) {
          return const Spacer();
        }

        throw Exception(); // unreachable
      });
}

class BookCubit extends Cubit<BookState> {

  BookCubit(): super(DefaultBookState());

  Future<void> fetch() async {} // TODO
}

/* UI State */

sealed class BookState {}

class DefaultBookState implements BookState {}
class ResultsBookState implements BookState {
  final List<Book> results;
  ResultsBookState({required this.results});
}