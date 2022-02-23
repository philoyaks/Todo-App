import 'dart:convert';

class Task {
  final String createdAt;
  final String description;
  final String developerId;
  final String id;
  final bool isCompleted;
  final String title;
  final String updatedAt;
  Task({
    required this.createdAt,
    required this.description,
    required this.developerId,
    required this.id,
    required this.isCompleted,
    required this.title,
    required this.updatedAt,
  });

  Task copyWith({
    String? createdAt,
    String? description,
    String? developerId,
    String? id,
    bool? isCompleted,
    String? title,
    String? updatedAt,
  }) {
    return Task(
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      developerId: developerId ?? this.developerId,
      id: id ?? this.id,
      isCompleted: isCompleted ?? this.isCompleted,
      title: title ?? this.title,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'createdAt': createdAt,
      'description': description,
      'developerId': developerId,
      'id': id,
      'isCompleted': isCompleted,
      'title': title,
      'updatedAt': updatedAt,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      createdAt: map['createdAt'] ?? '',
      description: map['description'] ?? '',
      developerId: map['developerId'] ?? '',
      id: map['id'] ?? '',
      isCompleted: map['isCompleted'] ?? false,
      title: map['title'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Task(createdAt: $createdAt, description: $description, developerId: $developerId, id: $id, isCompleted: $isCompleted, title: $title, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.createdAt == createdAt &&
        other.description == description &&
        other.developerId == developerId &&
        other.id == id &&
        other.isCompleted == isCompleted &&
        other.title == title &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return createdAt.hashCode ^
        description.hashCode ^
        developerId.hashCode ^
        id.hashCode ^
        isCompleted.hashCode ^
        title.hashCode ^
        updatedAt.hashCode;
  }
}
