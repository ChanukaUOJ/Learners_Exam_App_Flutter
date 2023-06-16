class RoadSignsCategoryModel {
  RoadSignsCategoryModel({
    required this.id,
    required this.title,
    required this.img,
  });

  String? id;
  String? title;
  String? img;

  RoadSignsCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    img = json['image'];
  }
}
