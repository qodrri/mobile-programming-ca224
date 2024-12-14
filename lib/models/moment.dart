import 'dart:convert';

class Moment {
  String id;
  String creator;
  String location;
  DateTime momentDate;
  String caption;
  String imageUrl;
  int likesCount;
  int commentsCount;
  int bookmarksCount;

  Moment({
    required this.id,
    required this.creator,
    required this.location,
    required this.momentDate,
    required this.caption,
    required this.imageUrl,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.bookmarksCount = 0,
  });

  Moment copyWith({
    String? id,
    String? creator,
    String? location,
    DateTime? momentDate,
    String? caption,
    String? imageUrl,
    int? likesCount,
    int? commentsCount,
    int? bookmarksCount,
  }) {
    return Moment(
      id: id ?? this.id,
      creator: creator ?? this.creator,
      location: location ?? this.location,
      momentDate: momentDate ?? this.momentDate,
      caption: caption ?? this.caption,
      imageUrl: imageUrl ?? this.imageUrl,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      bookmarksCount: bookmarksCount ?? this.bookmarksCount,
    );
  }

  factory Moment.fromMap(Map<String, dynamic> json) {
    return Moment(
      id: json['id'],
      creator: json['creator'],
      location: json['location'],
      momentDate: DateTime.parse(json['momentDate']),
      caption: json['caption'],
      imageUrl: json['imageUrl'],
      likesCount: json['likesCount'],
      commentsCount: json['commentsCount'],
      bookmarksCount: json['bookmarksCount'],
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'creator': creator,
        'location': location,
        'momentDate': momentDate.toIso8601String(),
        'caption': caption,
        'imageUrl': imageUrl,
        'likesCount': likesCount,
        'commentsCount': commentsCount,
        'bookmarksCount': bookmarksCount,
      };

  factory Moment.fromJson(String json) => Moment.fromMap(jsonDecode(json));

  String toJson() => jsonEncode(toMap());
}
