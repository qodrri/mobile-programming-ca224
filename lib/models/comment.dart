import 'dart:convert';

class Comment {
  final String id;
  final String momentId;
  final String creator;
  final String content;
  final DateTime createdAt;

  Comment({
    required this.id,
    required this.momentId,
    required this.creator,
    required this.content,
    required this.createdAt,
  });

  Comment copyWith({
    String? id,
    String? momentId,
    String? creator,
    String? content,
    DateTime? createdAt,
  }) =>
      Comment(
        id: id ?? this.id,
        momentId: momentId ?? this.momentId,
        creator: creator ?? this.creator,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Comment.fromMap(Map<String, dynamic> map) => Comment(
        id: map['id'],
        momentId: map['momentId'],
        creator: map['creator'],
        content: map['content'],
        createdAt: DateTime.parse(map['createdAt']),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'momentId': momentId,
        'creator': creator,
        'content': content,
        'createdAt': createdAt.toIso8601String(),
      };

  factory Comment.fromJson(String json) => Comment.fromMap(jsonDecode(json));

  String toJson() => jsonEncode(toMap());
}
