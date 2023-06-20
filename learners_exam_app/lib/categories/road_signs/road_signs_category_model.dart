class RoadSignsCategoryModel {
  RoadSignsCategoryModel(
      {required this.id,
      required this.title,
      required this.img,
      required this.navigating});

  String? id;
  String? title;
  String? img;
  String? navigating;

  RoadSignsCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    img = json['image'];
  }
}
