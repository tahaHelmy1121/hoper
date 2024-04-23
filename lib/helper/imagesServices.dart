// // ignore_for_file: use_build_context_synchronously
//
// import 'dart:developer';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// import 'massage.dart';
// class ImageServices {
//   static pickSingleImage({required BuildContext context}) async {
//     ImagePicker picker = ImagePicker();
//     File? selectedImage;
//     final pickedFile =
//     await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
//     XFile? filePick = pickedFile;
//     if (filePick != null) {
//       selectedImage = File(filePick.path);
//       return selectedImage;
//     } else {
//       MassageApp.snackBar("No Image Selected", context);
//     }
//   }
//
//   // static uploadImagesToFirebaseStorageNGetURL(
//   //     {required List<File> images, required BuildContext context}) async {
//   //   List<String> imagesURL = [];
//   //   String sellerUID = auth.currentUser!.uid;
//   //   await Future.forEach(images, (image) async {
//   //     String imageName = '$sellerUID${uuid.v1().toString()}';
//   //     Reference ref =
//   //     storage.ref().child('ResturantBannerImages').child(imageName);
//   //     await ref.putFile(File(image.path));
//   //     String imageURL = await ref.getDownloadURL();
//   //     imagesURL.add(imageURL);
//   //   });
//   //   return imagesURL;
//   // }
//
//   // static pickSingleImage({required BuildContext context}) async {
//   //   File? selectedImage;
//   //   final pickedFile =
//   //   await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
//   //   XFile? filePick = pickedFile;
//   //   if (filePick != null) {
//   //     selectedImage = File(filePick.path);
//   //     return selectedImage;
//   //   } else {
//   //    MassageApp.toastMassage("No Image Selected");
//   //   }
//   // }
//
//
// }
