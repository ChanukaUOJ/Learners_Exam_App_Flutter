class RegulatorySignModel {
  RegulatorySignModel({
    required this.regulatoryId,
    required this.regulatoryIndex,
    required this.regulatoryTitle,
    required this.regulatoryDescription,
    required this.regulatoryImg,
  });

  String? regulatoryId;
  String? regulatoryIndex;
  String? regulatoryTitle;
  String? regulatoryDescription;
  String? regulatoryImg;

  RegulatorySignModel.fromJSON(Map<String, dynamic> json) {
    regulatoryId = json['regulatoryId'];
    regulatoryIndex = json['regulatoryIndex'];
    regulatoryTitle = json['regulatoryTitle'];
    regulatoryDescription = json['regulatoryDescription'];
    regulatoryImg = json['regulatoryImg'];
  }
}
