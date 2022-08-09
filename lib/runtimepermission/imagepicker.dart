import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/customewidget/custom_button.dart';
import 'package:untitled1/runtimepermission/runtimepermissions.dart';
import 'package:untitled1/values/strings_name.dart';
import '../customewidget/custom_text.dart';

//https://educity.app/flutter/how-to-pick-an-image-from-gallery-and-display-it-in-flutter
//https://blog.logrocket.com/building-an-image-picker-in-flutter/

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ImagePickers(),
  ));
}

class ImagePickers extends StatefulWidget {
  const ImagePickers({Key? key}) : super(key: key);

  @override
  State<ImagePickers> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePickers> {
  String imageFile = "";
  Runtimepermissins runPermissions = Runtimepermissins();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(strings_name.str_image_picker),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              CustomButton(
                click: () {
                  Future<bool> status = runPermissions.permissionServiceCall();
                  status.then((val) {
                    if (val) {
                      _getFromGallery();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(strings_name.str_permission_require),
                      ));
                    }
                  });
                },
                text: strings_name.str_pick_from_gallery,
              ),
              CustomButton(
                click: () {
                  Future<bool> status = runPermissions.permissionServiceCall();
                  status.then((val) {
                    if (val) {
                      _getFromCamera();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(strings_name.str_permission_require),
                      ));
                    }
                  });
                },
                text: strings_name.str_pick_from_camera,
              ),
              custom_text(
                  text: imageFile,
                  size: 14,
                  fontWeight: FontWeight.w700,
                  alignment: Alignment.center),
              const SizedBox(width: 20, height: 20),
              Image.file(
                File(imageFile),
                fit: BoxFit.cover,
                width: 150,
                height: 150,
              )
            ],
          ),
        ),
      ),
    );
  }

  _getFromGallery() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = pickedFile.path;
      });
    }
  }

  _getFromCamera() async {
    XFile? image = await ImagePicker().pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
    if (image != null) {
      setState(() {
        imageFile = image.path;
      });
    }
  }
}
