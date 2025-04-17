import 'package:bookshelf/domain/entity/book.dart';
import 'package:bookshelf/domain/usecase/search_book_usecase.dart';
import 'package:bookshelf/presentation/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
        final viewModel = context.read<SearchCubit>();
        return Column(children: [
          _buildHeader(context, (request) => viewModel.search(request)),
          Expanded(child: _buildBody(context, state))
        ]);
      });

  Widget _buildHeader(BuildContext context, Function(String) onSearch) => Padding(
    padding: const EdgeInsets.all(8),
    child: TextField(
      decoration: InputDecoration(
          hintText: "Введите запрос",
          hintStyle: AppTypography.bodyLarge.copyWith(color: Colors.grey),
          filled: false,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none
          )
      ),
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          onSearch(value.trim());
        }
      },
    )
  );

  Widget _buildBody(BuildContext context, SearchState state) {
    if (state is DefaultSearchState) {
      return const Center(child: Text(
          "Здесь отобразятся результаты",
          style: AppTypography.h2)
      );
    }

    if (state is LoadingSearchState) {
      return const Center(child: Text(
          "Подождите...",
          style: AppTypography.h2)
      );
    }

    if (state is ResultsSearchState) {
      if (state.results.isEmpty) {
        return const Center(child: Text(
            "По вашему запросу результатов не найдено",
            style: AppTypography.h2)
        );
      }
      return _buildResultsBody(context, state.results);
    }

    throw Exception(); // unreachable
  }

  Widget _buildResultsBody(BuildContext context, List<Book> books) => ListView.builder(
    itemCount: books.length,
    itemBuilder: (context, i) => _buildResultsItem(context, books[i])
  );

  Widget _buildResultsItem(BuildContext context, Book item) => Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Theme.of(context).cardColor,
          child: Row(children: [
            Image.network(item.thumbnail),
            const SizedBox(width: 16),
            Column(children: [
              Text(item.title, style: AppTypography.h2),
              Text(
                  item.description ?? "Нет описания",
                  style: AppTypography.bodySmall.copyWith(
                    color: item.description == null ? Colors.grey : Colors.black
                  )
              )
            ])
          ])
        )
      )
  );
}

class SearchCubit extends Cubit<SearchState> {

  final SearchBookUseCase _searchBookUseCase;

  SearchCubit(this._searchBookUseCase): super(DefaultSearchState());

  Future<void> search(String request) async {
    emit(ResultsSearchState(
        results: await _searchBookUseCase.invoke(request)
    ));
  }
}

/* UI State */

sealed class SearchState {}

class DefaultSearchState implements SearchState {}
class LoadingSearchState implements SearchState {}
class ResultsSearchState implements SearchState {
  final List<Book> results;
  ResultsSearchState({required this.results});
}