
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';

String buildDocPath(String docUrl) {
  return docUrl.startsWith("http")
      ? docUrl
      : 'https://store.facto-solutions.com$docUrl';

}

// Future<List<File?>> compressImages(List<File> files) {
//   return Future.wait(_compress(files)).then((files) {
//     if (!(files.every((element) => element != null))) {
//       throw Exception();
//     }
//     return files.cast<File>();
//   });
// }

// Iterable<Future<File?>> _compress(List<File> files, {int quality = 60}) sync* {
//   for (File file in files) {
//     final String filePath = file.path;
//     final lastIndex = filePath.lastIndexOf('.');
//     final splitted = filePath.substring(0, lastIndex);
//     final outPath = "${splitted}_out.jpeg";
//     log(outPath);
//     File outFile = File(outPath);
//     yield FlutterImageCompress.compressAndGetFile(
//       file.path,
//       outFile.path,
//       quality: quality,
//     );
//   }
// }

// Future<File?> pickImage() async {
//   final pickedImage =
//       await ImagePicker().pickImage(source: ImageSource.gallery);
//   final imageFile = pickedImage != null ? File(pickedImage.path) : null;
//   if (imageFile != null) {
//     return _cropImage(imageFile);
//   }
//   return null;
// }

// Future<File?> _cropImage(File imageFile) async {
//   CroppedFile? croppedFile = await ImageCropper().cropImage(
//     sourcePath: imageFile.path,
//     aspectRatioPresets: [
//       CropAspectRatioPreset.square,
//       CropAspectRatioPreset.ratio3x2,
//       CropAspectRatioPreset.original,
//       CropAspectRatioPreset.ratio4x3,
//       CropAspectRatioPreset.ratio16x9
//     ],
//     uiSettings: [
//       AndroidUiSettings(
//           toolbarTitle: 'Cropper',
//           toolbarColor: Colors.deepOrange,
//           toolbarWidgetColor: Colors.white,
//           initAspectRatio: CropAspectRatioPreset.original,
//           lockAspectRatio: false),
//       IOSUiSettings(
//         title: 'Cropper',
//       ),
//     ],
//   );
//
//   if (croppedFile != null) {
//     return File(croppedFile.path);
//   }
//   return null;
// }
