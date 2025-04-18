import 'package:bookshelf/domain/entity/book.dart';
import 'package:bookshelf/domain/usecase/get_book_by_id_usecase.dart';
import 'package:bookshelf/presentation/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookScreen extends StatelessWidget {

  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<BookCubit, BookState>(builder: (context, state) {
        if (state is LoadingBookState) {
          return Expanded(child: Center(child: Wrap(children: [Column(children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text("Подождите...", style: AppTypography.h2.copyWith(color: Colors.grey))
          ])])));
        }

        if (state is LoadedBookState) {
          final book = state.book;
          return Padding(
            padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(book.title, style: AppTypography.h1),
                if (book.subtitle != null)
                  Text(book.subtitle!, style: AppTypography.h2),
                const SizedBox(height: 16),
                Row(children: [
                  SizedBox(height: 240, width: 180, child: Image.network(book.thumbnail, fit: BoxFit.fill)),
                  const SizedBox(width: 24),
                  SizedBox(height: 240, child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Text(
                          book.authors.isEmpty ? "Автор неизвестен" : book.authors.join(",\n"),
                          style: AppTypography.bodySmall.copyWith(
                              color: book.authors.isEmpty ? Colors.grey : Colors.black
                          )
                      ),
                      const SizedBox(height: 8),
                      Text(
                          book.publishedYear?.toString() ?? "Год публикации неизвестен",
                          style: AppTypography.bodySmall.copyWith(
                              color: book.publishedYear == null ? Colors.grey : Colors.black
                          )
                      )
                    ]
                  ))
                ]),
                Expanded(child: SingleChildScrollView(child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                      book.description ?? "Описание отсутствует",
                      style: AppTypography.bodySmall.copyWith(
                          color: book.description == null ? Colors.grey : Colors.black
                      )
                  )
                )))
              ]
            )
          );
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