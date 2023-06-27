class GuidanceSignModel {
  GuidanceSignModel({
    required this.id,
    required this.index,
    required this.guidanceTitle,
    required this.guidanceDescription,
    required this.guidanceImg,
  });

  String? id;
  String? index;
  String? guidanceTitle;
  String? guidanceDescription;
  String? guidanceImg;

  GuidanceSignModel.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    index = json['index'];
    guidanceTitle = json['guidanceTitle'];
    guidanceDescription = json['guidanceDescription'];
    guidanceImg = json['guidanceImg'];
  }
}
