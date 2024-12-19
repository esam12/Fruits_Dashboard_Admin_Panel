import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageFeild extends StatefulWidget {
  const ImageFeild({super.key, required this.onFileChanged});
  final ValueChanged<File?> onFileChanged;

  @override
  State<ImageFeild> createState() => _ImageFeildState();
}

class _ImageFeildState extends State<ImageFeild> {
  bool isLoading = false;
  File? fielIamge;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          isLoading = true;
          setState(() {});
          try {
            await buildImagePicker();
          } on Exception catch (_) {
            isLoading = false;
            setState(() {});
          }
          isLoading = false;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: fielIamge != null
                  ? Image.file(fielIamge!)
                  : const Icon(
                      Icons.image_outlined,
                      size: 160,
                    ),
            ),
            Visibility(
              visible: fielIamge != null,
              child: Positioned(
                left: 5,
                top: 5,
                child: IconButton.outlined(
                  onPressed: () {
                    fielIamge = null;
                    setState(() {});
                    widget.onFileChanged(null);
                  },
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> buildImagePicker() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    fielIamge = File(image!.path);

    widget.onFileChanged(fielIamge!);
  }
}
