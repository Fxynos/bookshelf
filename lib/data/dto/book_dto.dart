class BookDto {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfoDto? volumeInfo;
  SaleInfoDto? saleInfo;
  AccessInfoDto? accessInfo;
  SearchInfoDto? searchInfo;

  BookDto(
      {this.kind,
        this.id,
        this.etag,
        this.selfLink,
        this.volumeInfo,
        this.saleInfo,
        this.accessInfo,
        this.searchInfo});

  BookDto.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    id = json['id'];
    etag = json['etag'];
    selfLink = json['selfLink'];
    volumeInfo = json['volumeInfo'] != null
        ? new VolumeInfoDto.fromJson(json['volumeInfo'])
        : null;
    saleInfo = json['saleInfo'] != null
        ? new SaleInfoDto.fromJson(json['saleInfo'])
        : null;
    accessInfo = json['accessInfo'] != null
        ? new AccessInfoDto.fromJson(json['accessInfo'])
        : null;
    searchInfo = json['searchInfo'] != null
        ? new SearchInfoDto.fromJson(json['searchInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['id'] = this.id;
    data['etag'] = this.etag;
    data['selfLink'] = this.selfLink;
    if (this.volumeInfo != null) {
      data['volumeInfo'] = this.volumeInfo!.toJson();
    }
    if (this.saleInfo != null) {
      data['saleInfo'] = this.saleInfo!.toJson();
    }
    if (this.accessInfo != null) {
      data['accessInfo'] = this.accessInfo!.toJson();
    }
    if (this.searchInfo != null) {
      data['searchInfo'] = this.searchInfo!.toJson();
    }
    return data;
  }
}

class VolumeInfoDto {
  String? title;
  String? subtitle;
  String? description;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  List<IndustryIdentifiersDto>? industryIdentifiers;
  ReadingModesDto? readingModes;
  int? pageCount;
  String? printType;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinksDto? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;

  VolumeInfoDto(
      {this.title,
        this.subtitle,
        this.description,
        this.authors,
        this.publisher,
        this.publishedDate,
        this.industryIdentifiers,
        this.readingModes,
        this.pageCount,
        this.printType,
        this.maturityRating,
        this.allowAnonLogging,
        this.contentVersion,
        this.panelizationSummary,
        this.imageLinks,
        this.language,
        this.previewLink,
        this.infoLink,
        this.canonicalVolumeLink});

  VolumeInfoDto.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    description = json['description'];
    publisher = json['publisher'];
    authors = json['authors'] == null ? null : List.of(json['authors']);
    publishedDate = json['publishedDate'];
    if (json['industryIdentifiers'] != null) {
      industryIdentifiers = <IndustryIdentifiersDto>[];
      json['industryIdentifiers'].forEach((v) {
        industryIdentifiers!.add(new IndustryIdentifiersDto.fromJson(v));
      });
    }
    readingModes = json['readingModes'] != null
        ? new ReadingModesDto.fromJson(json['readingModes'])
        : null;
    pageCount = json['pageCount'];
    printType = json['printType'];
    maturityRating = json['maturityRating'];
    allowAnonLogging = json['allowAnonLogging'];
    contentVersion = json['contentVersion'];
    panelizationSummary = json['panelizationSummary'] != null
        ? new PanelizationSummary.fromJson(json['panelizationSummary'])
        : null;
    imageLinks = json['imageLinks'] != null
        ? new ImageLinksDto.fromJson(json['imageLinks'])
        : null;
    language = json['language'];
    previewLink = json['previewLink'];
    infoLink = json['infoLink'];
    canonicalVolumeLink = json['canonicalVolumeLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['publishedDate'] = this.publishedDate;
    if (this.industryIdentifiers != null) {
      data['industryIdentifiers'] =
          this.industryIdentifiers!.map((v) => v.toJson()).toList();
    }
    if (this.readingModes != null) {
      data['readingModes'] = this.readingModes!.toJson();
    }
    data['pageCount'] = this.pageCount;
    data['printType'] = this.printType;
    data['maturityRating'] = this.maturityRating;
    data['allowAnonLogging'] = this.allowAnonLogging;
    data['contentVersion'] = this.contentVersion;
    if (this.panelizationSummary != null) {
      data['panelizationSummary'] = this.panelizationSummary!.toJson();
    }
    if (this.imageLinks != null) {
      data['imageLinks'] = this.imageLinks!.toJson();
    }
    data['language'] = this.language;
    data['previewLink'] = this.previewLink;
    data['infoLink'] = this.infoLink;
    data['canonicalVolumeLink'] = this.canonicalVolumeLink;
    return data;
  }
}

class IndustryIdentifiersDto {
  String? type;
  String? identifier;

  IndustryIdentifiersDto({this.type, this.identifier});

  IndustryIdentifiersDto.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    identifier = json['identifier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['identifier'] = this.identifier;
    return data;
  }
}

class ReadingModesDto {
  bool? text;
  bool? image;

  ReadingModesDto({this.text, this.image});

  ReadingModesDto.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['image'] = this.image;
    return data;
  }
}

class PanelizationSummary {
  bool? containsEpubBubbles;
  bool? containsImageBubbles;

  PanelizationSummary({this.containsEpubBubbles, this.containsImageBubbles});

  PanelizationSummary.fromJson(Map<String, dynamic> json) {
    containsEpubBubbles = json['containsEpubBubbles'];
    containsImageBubbles = json['containsImageBubbles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['containsEpubBubbles'] = this.containsEpubBubbles;
    data['containsImageBubbles'] = this.containsImageBubbles;
    return data;
  }
}

class ImageLinksDto {
  String? smallThumbnail;
  String? thumbnail;

  ImageLinksDto({this.smallThumbnail, this.thumbnail});

  ImageLinksDto.fromJson(Map<String, dynamic> json) {
    smallThumbnail = json['smallThumbnail'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['smallThumbnail'] = this.smallThumbnail;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class SaleInfoDto {
  String? country;
  String? saleability;
  bool? isEbook;
  String? buyLink;

  SaleInfoDto({this.country, this.saleability, this.isEbook, this.buyLink});

  SaleInfoDto.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    saleability = json['saleability'];
    isEbook = json['isEbook'];
    buyLink = json['buyLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['saleability'] = this.saleability;
    data['isEbook'] = this.isEbook;
    data['buyLink'] = this.buyLink;
    return data;
  }
}

class AccessInfoDto {
  String? country;
  String? viewability;
  bool? embeddable;
  bool? publicDomain;
  String? textToSpeechPermission;
  EpubDto? epub;
  PdfDto? pdf;
  String? webReaderLink;
  String? accessViewStatus;
  bool? quoteSharingAllowed;

  AccessInfoDto(
      {this.country,
        this.viewability,
        this.embeddable,
        this.publicDomain,
        this.textToSpeechPermission,
        this.epub,
        this.pdf,
        this.webReaderLink,
        this.accessViewStatus,
        this.quoteSharingAllowed});

  AccessInfoDto.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    viewability = json['viewability'];
    embeddable = json['embeddable'];
    publicDomain = json['publicDomain'];
    textToSpeechPermission = json['textToSpeechPermission'];
    epub = json['epub'] != null ? new EpubDto.fromJson(json['epub']) : null;
    pdf = json['pdf'] != null ? new PdfDto.fromJson(json['pdf']) : null;
    webReaderLink = json['webReaderLink'];
    accessViewStatus = json['accessViewStatus'];
    quoteSharingAllowed = json['quoteSharingAllowed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['viewability'] = this.viewability;
    data['embeddable'] = this.embeddable;
    data['publicDomain'] = this.publicDomain;
    data['textToSpeechPermission'] = this.textToSpeechPermission;
    if (this.epub != null) {
      data['epub'] = this.epub!.toJson();
    }
    if (this.pdf != null) {
      data['pdf'] = this.pdf!.toJson();
    }
    data['webReaderLink'] = this.webReaderLink;
    data['accessViewStatus'] = this.accessViewStatus;
    data['quoteSharingAllowed'] = this.quoteSharingAllowed;
    return data;
  }
}

class EpubDto {
  bool? isAvailable;
  String? downloadLink;

  EpubDto({this.isAvailable, this.downloadLink});

  EpubDto.fromJson(Map<String, dynamic> json) {
    isAvailable = json['isAvailable'];
    downloadLink = json['downloadLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isAvailable'] = this.isAvailable;
    data['downloadLink'] = this.downloadLink;
    return data;
  }
}

class PdfDto {
  bool? isAvailable;

  PdfDto({this.isAvailable});

  PdfDto.fromJson(Map<String, dynamic> json) {
    isAvailable = json['isAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isAvailable'] = this.isAvailable;
    return data;
  }
}

class SearchInfoDto {
  String? textSnippet;

  SearchInfoDto({this.textSnippet});

  SearchInfoDto.fromJson(Map<String, dynamic> json) {
    textSnippet = json['textSnippet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['textSnippet'] = this.textSnippet;
    return data;
  }
}