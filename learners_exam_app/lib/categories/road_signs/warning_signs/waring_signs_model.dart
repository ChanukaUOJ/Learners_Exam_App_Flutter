class WarningSignModel {
  WarningSignModel({
    required this.id,
    required this.index,
    required this.warningTitle,
    required this.warningDescription,
    required this.warningImg,
  });

  String? id;
  String? index;
  String? title;
  String? warningTitle;
  String? warningDescription;
  String? warningImg;

  WarningSignModel.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    index = json['index'];
    warningTitle = json['warningTitle'];
    warningDescription = json['warningDescription'];
    warningImg = json['warningImg'];
  }
}
