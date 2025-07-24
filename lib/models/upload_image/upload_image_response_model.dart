class UploadImageResponseModel {
  UploadImageResponseModel({required this.imageId});

  factory UploadImageResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => UploadImageResponseModel(
    imageId: json['imageId'] as String,
  );

  final String imageId;
}
