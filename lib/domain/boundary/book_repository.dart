import '../entity/book.dart';

abstract class BookRepository {
  Future<Book> getById(String bookId);
  Future<List<Book>> search(String query);
  Future<List<Book>> getFavorites(String token);
  Future<void> addToFavoritesById(String token, String bookId);
}