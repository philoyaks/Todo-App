class Task {
  Task({
    required this.createdAt,
    required this.description,
    required this.developerId,
    required this.id,
    required this.isCompleted,
    required this.title,
    required this.updatedAt,
  });
  late final DateTime createdAt;
  late final String description;
  late final String developerId;
  late final String id;
  late final bool isCompleted;
  late final String title;
  late final DateTime updatedAt;

  Task.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    description = json['description'];
    developerId = json['developer_id'];
    id = json['id'];
    isCompleted = json['isCompleted'];
    title = json['title'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['created_at'] = createdAt;
    _data['description'] = description;
    _data['developer_id'] = developerId;
    _data['id'] = id;
    _data['isCompleted'] = isCompleted;
    _data['title'] = title;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
