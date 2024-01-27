class SignModel {
  SignModel({
    required this.id,
    required this.index,
    required this.title,
    required this.description,
    required this.img,
  });

  String? id;
  String? index;
  String? title;
  String? description;
  String? img;

  SignModel.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    index = json['index'];
    title = json['title'];
    description = json['description'];
    img = json['img'];
  }
}
