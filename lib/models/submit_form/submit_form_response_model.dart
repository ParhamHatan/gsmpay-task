class SubmitFormResponseModel {
  SubmitFormResponseModel({required this.isSuccess});

  factory SubmitFormResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => SubmitFormResponseModel(
    isSuccess: json['isSuccess'] as bool,
  );

  final bool isSuccess;
}
