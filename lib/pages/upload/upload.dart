import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';

import '../login/widgets/my_textfield.dart';
import 'widgets/appbar_upload.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (ctx, i) => [
                  CustomAppBarUpload(title: "Upload"),
                ],
            body: MainBodyUpload()),
      ),
    );
  }
}

class MainBodyUpload extends StatefulWidget {
  const MainBodyUpload({super.key});

  @override
  State<MainBodyUpload> createState() => _MainBodyUploadState();
}

class _MainBodyUploadState extends State<MainBodyUpload>
    with TickerProviderStateMixin {
  File? _image;
  AnimationController? controller;

  @override
  initState() {
    super.initState();
    controller = BottomSheet.createAnimationController(this);
    controller?.duration = const Duration(seconds: 1);
    controller?.reverseDuration = const Duration(seconds: 0);
    controller?.drive(CurveTween(curve: Curves.easeIn));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return Container(
      width: currentWidth,
      height: currentHeight,
      child: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                _selectImage();
              },
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Center(
                  child: _image != null
                      ? Image.file(
                          _image!,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        )
                      : Icon(LineIcons.camera),
                ),
              ),
            ),
            MyTextField(
              labelText: 'Username',
              obscureText: false,
              controller: null,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectImage() async {
    // Show a bottom sheet
    showModalBottomSheet(
      context: context,
      transitionAnimationController: controller,
      enableDrag: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Select Image from Gallery'),
              onTap: () async {
                var image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);

                // If the user didn't pick an image, return
                if (image == null) {
                  return;
                }

                // Set the image as the state
                setState(() {
                  _image = File(image.path);
                });

                // Close the bottom sheet
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Take a Photo'),
              onTap: () async {
                var image =
                    await ImagePicker().pickImage(source: ImageSource.camera);

                // If the user didn't pick an image, return
                if (image == null) {
                  return;
                }

                // Set the image as the state
                setState(() {
                  _image = File(image.path);
                });

                // Close the bottom sheet
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
