class BookModel {
  String? id;
  String? title;
  String? description;
  String? rating;
  int? pages;
  String? language;
  String? audioLen;
  String? author;
  String? aboutAuthor;
  String? bookurl;
  String? audioUrl;
  String? category;
  String? coverUrl;
  int? price;
  String? numberofRating;
  bool isLiked;

  BookModel({
    this.id,
    this.title,
    this.description,
    this.rating,
    this.pages,
    this.language,
    this.audioLen,
    this.author,
    this.aboutAuthor,
    this.bookurl,
    this.audioUrl,
    this.category,
    this.price,
    this.coverUrl,
    this.numberofRating,
    this.isLiked = false,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      rating: json["rating"],
      pages: json["pages"],
      language: json["language"],
      audioLen: json["audioLen"],
      author: json["author"],
      aboutAuthor: json["aboutAuthor"],
      bookurl: json["bookurl"],
      audioUrl: json["audioUrl"],
      category: json["category"],
      coverUrl: json["coverUrl"],
      price: json["price"],
      numberofRating: json["numberofRating"],
      isLiked: json["isLiked"] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "rating": rating,
      "pages": pages,
      "language": language,
      "audioLen": audioLen,
      "author": author,
      "aboutAuthor": aboutAuthor,
      "bookurl": bookurl,
      "audioUrl": audioUrl,
      "category": category,
      "coverUrl": coverUrl,
      "price": price,
      "numberofRating": numberofRating,
      "isLiked": isLiked,
    };
  }
}
