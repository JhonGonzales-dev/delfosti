/* class PublicationModel {
  PublicationModel({
    required this.publications,
  });

  final List<Publication> publications;

  factory PublicationModel.fromJson(Map<String, dynamic> json) =>
      PublicationModel(
        publications: List<Publication>.from(
            json["publications"].map((x) => Publication.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "publications": List<dynamic>.from(publications.map((x) => x.toJson())),
      };
}

class Publication {
  Publication(
      {required this.id,
      required this.title,
      required this.description,
      this.isFavorite});

  final int id;
  final String title;
  final String description;
  bool? isFavorite;

  factory Publication.fromJson(Map<String, dynamic> json) => Publication(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        isFavorite: json["isFavorite"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
      };
}
 */

class PublicationModel {
  PublicationModel({
    required this.publications,
  });

  final List<Publication> publications;

  factory PublicationModel.fromJson(Map<String, dynamic> json) =>
      PublicationModel(
        publications: List<Publication>.from(
            json["publications"].map((x) => Publication.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "publications": List<dynamic>.from(publications.map((x) => x.toJson())),
      };
}

class Publication {
  Publication({
    required this.id,
    required this.title,
    required this.description,
    required this.isFavorite,
  });

  final int id;
  final String title;
  final String description;
  bool isFavorite;

  factory Publication.fromJson(Map<String, dynamic> json) => Publication(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        isFavorite: json["isFavorite"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "isFavorite": isFavorite,
      };
}
