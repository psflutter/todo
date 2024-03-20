class Task {
  String? title;
  String? status;

  Task({this.title, this.status});

  Task.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['status'] = status;
    return data;
  }
}
