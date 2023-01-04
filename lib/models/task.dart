class Task {
  String id;
  String title;
  bool isDone = false;
  Task({
    required this.id,
    required this.title,
  });

  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "isDone": isDone};
  }

  Task.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        isDone = json["isDone"];
}
