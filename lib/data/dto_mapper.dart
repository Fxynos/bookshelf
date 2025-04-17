import 'package:bookshelf/domain/entity/book.dart';

import 'dto/book_dto.dart';

class DtoMapper {
  static Book toDomain(BookDto dto) => Book(
      id: dto.id!,
      title: dto.volumeInfo!.title!,
      subtitle: dto.volumeInfo!.subtitle,
      publisher: dto.volumeInfo!.publisher,
      publishedYear: dto.volumeInfo!.publishedDate == null ? null :
        int.parse(dto.volumeInfo!.publishedDate!.split("-").first),
      authors: dto.volumeInfo!.authors ?? List.empty(),
      description: dto.volumeInfo!.description,
      thumbnail: dto.volumeInfo!.imageLinks!.thumbnail!
          .replaceFirst("http://", "https://")
  );
}