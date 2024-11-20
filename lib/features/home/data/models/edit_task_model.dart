class EditTaskModel {
  final String image;
  final String title;
  final String desc;
  final String priority;
  final String status;
  final String user;

  EditTaskModel(
      {required this.image,
      required this.title,
      required this.desc,
      required this.priority,
      required this.status,
      required this.user});
  factory EditTaskModel.fromJson(json) {
    return EditTaskModel(
      image: json['image'],
      title: json['title'],
      desc: json['desc'],
      priority: json['priority'],
      status: json['status'],
      user: json['user'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'desc': desc,
      'priority': priority,
      'status': status,
      'user': user,
    };
  }
}
