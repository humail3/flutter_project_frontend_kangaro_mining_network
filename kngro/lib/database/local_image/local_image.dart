import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class LocalImage {
  File? storedImage;

  Future<File?> saveImage({required File? image, required String imageName}) async {
    try {
      if (image == null) {
        print("Image is null, cannot save.");
        return null;
      }

      final directory = await getApplicationDocumentsDirectory();
      final String path = directory.path;
      final String imagePath = '$path/app_images'; // Create your app's folder
      final Directory appDir = Directory(imagePath);

      if (!(await appDir.exists())) {
        await appDir.create(recursive: true);
      }

      final File localImage = await image.copy('$imagePath/$imageName.jpg');
      return localImage;
    } catch (e) {
      print("Error saving image: $e");
      return null;
    }
  }

  // Future<File> downloadImage({required String? imageUrl}) async {
  //   // Fetch the image data
  //   final response = await http.get(Uri.parse(imageUrl!));
  //
  //   // Get the temporary directory
  //   final directory = await getTemporaryDirectory();
  //
  //   // Create a file path for the image
  //   final filePath = '${directory.path}/temp_image.jpg';
  //
  //   // Write the image data to the file
  //   final file = File(filePath);
  //   await file.writeAsBytes(response.bodyBytes);
  //
  //   return file;
  // }

  Future<File?> downloadImage({required String? imageUrl}) async {
    try {
      if (imageUrl == null || imageUrl.isEmpty) {
        print("Image URL is null or empty, cannot download.");
        return null;
      }

      final response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode != 200) {
        print("Error downloading image: ${response.statusCode}");
        return null;
      }

      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/temp_image.jpg';
      final file = File(filePath);

      await file.writeAsBytes(response.bodyBytes);

      return file;
    } catch (e) {
      print("Error downloading image: $e");
      return null;
    }
  }

  Future<File?> loadImage({required String imageName}) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final String path = directory.path;
      final String imagePath = '$path/app_images/$imageName.jpg';
      final File localImage = File(imagePath);

      if (await localImage.exists()) {
        storedImage = localImage;
      } else {
        storedImage = null;
      }

      return storedImage;
    } catch (e) {
      print("Error loading image: $e");
      return null;
    }
  }

  Future<void> deleteImage({required String imageName}) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final String path = directory.path;
      final String imagePath = '$path/app_images/$imageName.jpg';
      final File localImage = File(imagePath);

      if (await localImage.exists()) {
        await localImage.delete();
      }
    } catch (e) {
      print("Error deleting image: $e");
    }
  }
}













// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:http/http.dart' as http;
//
//
// class LocalImage {
//   File? storedImage;
//
//   Future<File?> saveImage({required File? image,required String imageName}) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final String path = directory.path;
//     final String imagePath = '$path/app_images'; // Create your app's folder
//     final Directory appDir = Directory(imagePath);
//
//     if (!(await appDir.exists())) {
//       await appDir.create(recursive: true);
//     }
//
//     final File localImage = await image!.copy('$imagePath/$imageName.jpg');
//     return localImage;
//   }
//
//   Future<File> downloadImage({required String? imageUrl}) async {
//     // Fetch the image data
//     final response = await http.get(Uri.parse(imageUrl!));
//
//     // Get the temporary directory
//     final directory = await getTemporaryDirectory();
//
//     // Create a file path for the image
//     final filePath = '${directory.path}/temp_image.jpg';
//
//     // Write the image data to the file
//     final file = File(filePath);
//     await file.writeAsBytes(response.bodyBytes);
//
//     return file;
//   }
//
//
//   Future<File?> loadImage({required String imageName}) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final String path = directory.path;
//     final String imagePath = '$path/app_images/$imageName.png';
//     final File localImage = File(imagePath);
//     if (await localImage.exists()) {
//       storedImage = localImage;
//     } else {
//       storedImage = null;
//     }
//     return storedImage;
//   }
//
//   Future<void> deleteImage({required String imageName}) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final String path = directory.path;
//     final String imagePath = '$path/app_images/$imageName.png';
//     final File localImage = File(imagePath);
//
//     if (await localImage.exists()) {
//       await localImage.delete();
//     }
//   }
// }
