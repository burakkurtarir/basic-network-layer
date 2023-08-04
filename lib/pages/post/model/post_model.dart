class PostModel {
  final int? id;
  final String? title;

  const PostModel({
    this.id,
    this.title,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json["id"] as int?,
      title: json["title"] as String?,
    );
  }
}
