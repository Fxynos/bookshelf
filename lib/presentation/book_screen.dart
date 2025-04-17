import 'package:bookshelf/domain/entity/book.dart';
import 'package:bookshelf/domain/usecase/get_book_by_id_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookScreen extends StatelessWidget {

  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<BookCubit, BookState>(builder: (context, state) {
        if (state is LoadingBookState) {
          return const Spacer();
        }

        if (state is LoadedBookState) {
          return const Spacer();
        }

        throw Exception(); // unreachable
      });
}

class BookCubit extends Cubit<BookState> {

  final BookArgs _args;
  final GetBookByIdUseCase _getBookByIdUseCase;

  BookCubit({
    required BookArgs args,
    required GetBookByIdUseCase getBookByIdUseCase
  }): _args = args, _getBookByIdUseCase = getBookByIdUseCase, super(LoadingBookState());

  Future<void> fetch() async {
    emit(LoadedBookState(
        book: await _getBookByIdUseCase.invoke(_args.bookId)
    ));
  }
}

class BookArgs {
  final String bookId;
  BookArgs({required this.bookId});
}

/* UI State */

sealed class BookState {}

class LoadingBookState implements BookState {}
class LoadedBookState implements BookState {
  final Book book;
  LoadedBookState({required this.book});
}