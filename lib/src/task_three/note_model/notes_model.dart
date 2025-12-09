class NoteModel {
  int? id;
  String title;
  String body;
  String updatedAt;
  int isSynced;

  NoteModel({
    this.id,
    required this.title,
    required this.body,
    required this.updatedAt,
    this.isSynced = 0,
  });
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "body": body,
      "updatedAt": updatedAt,
      "isSynced": isSynced,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map["id"],
      title: map["title"],
      body: map["body"],
      updatedAt: map["updatedAt"],
      isSynced: map["isSynced"],
    );
  }
}
