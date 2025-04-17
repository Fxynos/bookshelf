import 'package:bookshelf/domain/boundary/book_repository.dart';
import 'package:bookshelf/domain/entity/book.dart';
import 'package:bookshelf/domain/usecase.dart';

abstract class SearchBookUseCase extends AsyncUseCase<String, List<Book>> {}

class SearchBookUseCaseImpl implements SearchBookUseCase {

  final BookRepository _repository;

  SearchBookUseCaseImpl({required BookRepository repository}) : _repository = repository;

  @override
  Future<List<Book>> invoke(String param) => _repository.search(param);
}