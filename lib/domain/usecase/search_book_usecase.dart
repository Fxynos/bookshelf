import 'package:bookshelf/domain/boundary/book_repository.dart';
import 'package:bookshelf/domain/entity/book.dart';
import 'package:bookshelf/domain/usecase.dart';

abstract class SearchUseCase extends AsyncUseCase<String, List<Book>> {}

class SearchUseCaseImpl implements SearchUseCase {

  final BookRepository _repository;

  SearchUseCaseImpl({required BookRepository repository}) : _repository = repository;

  @override
  Future<List<Book>> invoke(String param) => _repository.search(param);
}