import 'package:bookshelf/domain/usecase/search_book_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
        if (state is DefaultSearchState) {
          return const Spacer();
        }

        if (state is ResultsSearchState) {
          return const Spacer();
        }

        throw Exception(); // unreachable
      });
}

class SearchCubit extends Cubit<SearchState> {

  final SearchBookUseCase _searchBookUseCase;

  SearchCubit(this._searchBookUseCase): super(DefaultSearchState());

  Future<void> search(String request) async {} // TODO
}

/* UI State */

sealed class SearchState {}

class DefaultSearchState implements SearchState {}
class ResultsSearchState implements SearchState {
  // TODO results
}