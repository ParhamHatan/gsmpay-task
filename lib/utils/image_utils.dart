import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

abstract class ImageUtils {
  static Future<XFile?> pickAndCropImage({
    double? ratioY,
    double? ratioX,
  }) async {
    final XFile? image = await _pickImageFromGallery();

    if (image == null) {
      return null; // User canceled the picker
    }

    final croppedImage = await _cropImage(image, ratioY, ratioX);
    if (croppedImage == null) {
      return null; // Cropping failed or was canceled
    }

    return croppedImage;
  }

  static Future<XFile?> _pickImageFromGallery() async {
    return ImagePicker().pickImage(
      source: ImageSource.gallery,
      requestFullMetadata: false,
      imageQuality: 100,
    );
  }

  static Future<XFile?> _cropImage(XFile image, [double? ratioY, double? rationX]) async {
    CropAspectRatio? aspectRatio;
    if (ratioY != null && rationX != null) {
      aspectRatio = CropAspectRatio(ratioY: ratioY, ratioX: rationX);
    }

    final croppedImage = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatio: aspectRatio,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          aspectRatioLockDimensionSwapEnabled: true,
        ),
      ],
    );
    if (croppedImage == null) {
      return null;
    }

    return XFile(croppedImage.path, name: image.name, mimeType: image.mimeType);
  }
}
