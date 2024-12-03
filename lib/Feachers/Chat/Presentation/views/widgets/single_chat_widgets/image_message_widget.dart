import 'dart:io';

import 'package:flutter/material.dart';

import 'base_message_widget.dart';

class ImageMessageWidget extends StatelessWidget {
  final List<String> imageUrls; // Expect a list of image URLs now
  final bool isSender;
  late bool fromCamera;
  late bool isLastMesaage;
  final String time ;

  ImageMessageWidget(
      {Key? key,
      required this.imageUrls,
      required this.isSender,
      required this.isLastMesaage,
        required this.time,
      this.fromCamera = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageUrls.length == 1) {
      ImageProvider imageProvider;
      if (fromCamera) {
        print('Its a local file image');
        String filePath = imageUrls[0].replaceFirst('file://', '');
        imageProvider = FileImage(File(filePath));
      } else {
        print('Its a network image');
        // It's a network image
        imageProvider = NetworkImage(imageUrls[0]);
      }
      return BaseMessageWidget(

        isLastMesaage: isLastMesaage,
        isSender: isSender,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          // Set the border radius to 8
          child: Image(
            height: 128,
            width: double.infinity,
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return BaseMessageWidget(
        isLastMesaage: isLastMesaage,
        isSender: isSender,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: imageUrls.length,
          itemBuilder: (BuildContext context, int index) {
            ImageProvider imageProvider;
            if (fromCamera) {
              // It's a local file image
              // Correctly remove 'file://' scheme to get the proper file path
              print('Its a local file image');
              String filePath = imageUrls[index].replaceFirst('file://', '');
              imageProvider = FileImage(File(filePath));
            } else {
              print('Its a network image');

              // It's a network image
              imageProvider = NetworkImage(imageUrls[index]);
            }

            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              // Set the border radius to 8
              child: Image(
                height: 128,
                width: 128,
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      );
    }
  }
}
