import 'package:bookshelf/domain/boundary/book_repository.dart';
import 'package:bookshelf/domain/entity/book.dart';
import 'package:bookshelf/domain/usecase.dart';

abstract class GetBookByIdUseCase extends AsyncUseCase<String, Book> {}

class GetBookByIdUseCaseImpl implements GetBookByIdUseCase {

  final BookRepository _repository;

  GetBookByIdUseCaseImpl({required BookRepository repository}) : _repository = repository;

  @override
  Future<Book> invoke(String param) => _repository.getById(param);
}