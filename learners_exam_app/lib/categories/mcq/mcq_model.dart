class McqModel {
  McqModel({
    required this.mcqIndex,
    required this.mcqTitle,
    required this.mcqAnswer,
  });

  String? mcqIndex;
  String? mcqTitle;
  String? mcqAnswer;

  McqModel.fromJSON(Map<String, dynamic> json) {
    mcqIndex = json['mcqIndex'];
    mcqTitle = json['mcqTitle'];
    mcqAnswer = json['mcqAnswer'];
  }
}
