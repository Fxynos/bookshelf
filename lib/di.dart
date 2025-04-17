import 'package:bookshelf/config.dart';
import 'package:bookshelf/domain/boundary/book_repository.dart';
import 'package:bookshelf/domain/usecase/get_book_by_id_usecase.dart';
import 'package:bookshelf/domain/usecase/search_book_usecase.dart';
import 'package:bookshelf/presentation/book_screen.dart';
import 'package:bookshelf/presentation/search_screen.dart';
import 'package:get_it/get_it.dart';

import 'data/book_repository.dart';

final di = GetIt.instance;

void setupDi() => di
  // use case contracts
  ..registerSingleton<BookRepository>(RemoteBookRepository(baseUrl: Config.baseUrl))
  // use cases
  ..registerFactory<GetBookByIdUseCase>(() => GetBookByIdUseCaseImpl(repository: di<BookRepository>()))
  ..registerFactory<SearchBookUseCase>(() => SearchBookUseCaseImpl(repository: di<BookRepository>()))
  // view models
  ..registerFactory(() => SearchCubit(di<SearchBookUseCase>()))
  ..registerFactory(() => BookCubit(di<GetBookByIdUseCase>()));