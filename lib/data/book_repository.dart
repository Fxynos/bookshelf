import 'dart:convert';
import 'package:http/http.dart';

import '../domain/boundary/book_repository.dart';
import '../domain/entity/book.dart';
import 'dto/book_dto.dart';
import 'dto_mapper.dart';

/// Implementation of Google Books API
/// https://developers.google.com/books/docs/overview
class RemoteBookRepository implements BookRepository {

  final Client _client = Client();
  final String _baseUrl;

  /// [baseUrl] MUST NOT end with `/`
  RemoteBookRepository({required String baseUrl}) : _baseUrl = baseUrl;

  @override
  Future<void> addToFavoritesById(String token, String bookId) =>
      _client.post(Uri.parse(
          "$_baseUrl/mylibrary/bookshelves/0/addVolume?volumeId=$bookId"
      ), headers: {
        "Authorization": toAuthHeader(token)
      });

  @override
  Future<Book> getById(String bookId) =>
      _client.get(Uri.parse(
          "$_baseUrl/volumes/$bookId"
      )).then((response) => jsonDecode(response.body))
          .then((json) => DtoMapper.toDomain(BookDto.fromJson(json)));

  @override
  Future<List<Book>> getFavorites(String token) =>
      _client.get(Uri.parse(
          "$_baseUrl/bookshelves/0/volumes"
      ), headers: {
        "Authorization": toAuthHeader(token)
      }).then((response) => jsonDecode(response.body))
          .then((json) =>
          (json.items as List<dynamic>)
              .map((item) => DtoMapper.toDomain(BookDto.fromJson(json)))
              .toList()
      );

  @override
  Future<List<Book>> search(String query) =>
      _client.get(Uri.parse(
          "$_baseUrl/volumes?q=${Uri.encodeFull(query)}"
      )).then((response) => jsonDecode(response.body))
          .then((json) =>
          (json["items"] as List<dynamic>)
              .map((item) => DtoMapper.toDomain(BookDto.fromJson(item)))
              .toList()
      );

  String toAuthHeader(String token) => "Bearer $token";
}