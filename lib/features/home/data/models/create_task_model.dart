class CreateTaskModel {
  final String image;
  final String title;
  final String desc;
  final String priority;
  final String dueDate;

  CreateTaskModel(
      {required this.image,
      required this.title,
      required this.desc,
      required this.priority,
      required this.dueDate});
  factory CreateTaskModel.fromJson(json) {
    return CreateTaskModel(
      image: json['image'],
      title: json['title'],
      desc: json['desc'],
      priority: json['priority'],
      dueDate: json['dueDate'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'desc': desc,
      'priority': priority,
      'dueDate': dueDate,
    };
  }

  CreateTaskModel copyWith({String? image}) {
    return CreateTaskModel(
      priority: priority,
      title: title,
      desc: desc,
      dueDate: dueDate,
      image: image ?? this.image,
    );
  }
}
