
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

//https://medium.com/flutter-community/flutter-image-uploader-with-app-permissions-and-compression-using-getit-services-59ffea13f913
class Runtimepermissins extends StatefulWidget {
  Future<bool> permissionServiceCall() async {
    bool checkStatus = false;
    await permissionServices().then(
      (value) {
        if (value[Permission.storage]!.isGranted &&
            value[Permission.camera]!.isGranted) {
          checkStatus = true;
        } else {
          checkStatus = false;
        }
      },
    );
    return checkStatus;
  }

  Future<Map<Permission, PermissionStatus>> permissionServices() async {
    // You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.camera
      //add more permission to request here.
    ].request();

    if (statuses[Permission.storage]!.isPermanentlyDenied) {
      await openAppSettings().then(
        (value) async {
          if (value) {
            if (await Permission.storage.status.isPermanentlyDenied == true &&
                await Permission.storage.status.isGranted == false) {
              openAppSettings();
              // permissionServiceCall(); /* opens app settings until permission is granted */
            }
          }
        },
      );
    } else {
      if (statuses[Permission.storage]!.isDenied) {
        permissionServiceCall();
      }
    }
    if (statuses[Permission.camera]!.isPermanentlyDenied) {
      await openAppSettings().then(
        (value) async {
          if (value) {
            if (await Permission.camera.status.isPermanentlyDenied == true &&
                await Permission.camera.status.isGranted == false) {
              openAppSettings();
            }
          }
        },
      );
    } else {
      if (statuses[Permission.camera]!.isDenied) {
        permissionServiceCall();
      }
    }
    return statuses;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
//Run time permissions with example of image picker
// class _RuntimepermissiState extends State<Runtimepermissins> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
