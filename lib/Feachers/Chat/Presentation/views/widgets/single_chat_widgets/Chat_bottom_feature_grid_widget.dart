/*
import 'package:contacts_service/contacts_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';


import '../../../../Data/Models/document_info.dart';
import '../../../view_models/chat_cubit.dart';
import '../../../view_models/chat_state.dart';
import 'FeatureBottonTileIcon.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ChatBottomFeatureGridWidget extends StatelessWidget {
  final double height; // Add height parameter

  ChatBottomFeatureGridWidget({required this.height});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),

            ),
            height: height,
            child: Column(
              children: [

                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 19.0.w),
                    child: Container(
                      child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        mainAxisSpacing: 4,
                        children: <Widget>[
                          FeatureChatBottomTile(
                              iconPath: 'assets/images/camera_chat.svg',
                              label: 'Camera',
                              onTap: () {
                                ChatCubit.get(context).CloseBottomAddFiles();
                                ChatCubit.get(context).pickImageFromCamera();
                              }),
                          FeatureChatBottomTile(
                            iconPath: 'assets/images/file2.svg',
                            label: 'Documents',
                            onTap: () {
                              _pickDocument(context);
                            }
                          ),
                          FeatureChatBottomTile(
                            iconPath: 'assets/images/image-v.svg',
                            label: 'Media',
                            onTap: () {
                              _pickMedia(context);
                            }
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _pickMedia(BuildContext context) async {
    final List<AssetEntity>? assets = await AssetPicker.pickAssets(
      context,

      pickerConfig: AssetPickerConfig(
        requestType: RequestType.all,
        maxAssets: 10, // Set maximum number of assets to pick
      ),

    );

    List<String> imagePaths = [];
    List<String> videoPaths = [];

    if (assets != null) {
      for (final asset in assets) {
        final file = await asset.file;
        if (file != null) {
          if (asset.type == AssetType.image) {
            imagePaths.add(file.path);
          } else if (asset.type == AssetType.video) {
            videoPaths.add(file.path);
          }
        }
      }

      final chatCubit = ChatCubit.get(context);

      // Add image messages if any images were selected
      if (imagePaths.isNotEmpty) {
        chatCubit.addImageMessage(imagePaths);
      }

      // Add video messages if any videos were selected
      if (videoPaths.isNotEmpty) {
        chatCubit.addVideoMessage(videoPaths);
      }
    }else{
      ChatCubit.get(context).CloseBottomAddFiles();
    }
  }


  void _pickDocument(BuildContext context) async {
    final permissionStatus = await Permission.storage.request();

    if (permissionStatus.isGranted) {
      // Permission is granted, proceed with file picking
      _pickFile(context);
    } else if (permissionStatus.isPermanentlyDenied) {
      // Permission is permanently denied, show a dialog to direct the user to app settings
      _showPermissionDeniedDialog(context);
      ChatCubit.get(context).CloseBottomAddFiles();

    } else {
      // Handle other cases such as denied, restricted, or limited permissions
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
            Text('Storage permission is required to access documents.')),

      );
      ChatCubit.get(context).CloseBottomAddFiles();

    }
  }

  void _pickFile(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx'],
    );

    if (result != null) {
      final file = result.files.first;
      final chatCubit = ChatCubit.get(context);
      chatCubit.addDocumentMessage(
        DocumentInfo(
          name: file.name,
          type: file.extension ?? 'unknown',
          url: file.path ?? '',
        ),
      );
    } else {
      // User canceled the picker
      print('File selection was canceled by the user.');
    }
  }

  void _showPermissionDeniedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          AlertDialog(
            title: Text('Storage Permission'),
            content: Text(
                'This app requires storage access to select documents. Please enable storage permission in the app settings.'),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text('Settings'),
                onPressed: () {
                  openAppSettings(); // Open app settings to let the user change permission settings
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
    );
  }


}
*/



import 'dart:io'; // To check if the platform is Android or iOS
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../view_models/chat_cubit.dart';
import '../../../view_models/chat_state.dart';
import '../../../../Data/Models/document_info.dart';
import 'FeatureBottonTileIcon.dart';

class ChatBottomFeatureGridWidget extends StatelessWidget {
  final double height;

  ChatBottomFeatureGridWidget({required this.height});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(

            decoration: BoxDecoration(
              color:HexColor('#F4F6F9'),
              borderRadius: BorderRadius.circular(24),
            ),
            height: height,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 19.0),
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      mainAxisSpacing: 4,
                      children: <Widget>[
                        FeatureChatBottomTile(
                          iconPath: 'assets/images/camera_chat.svg',
                          label: 'Camera',
                          onTap: () {
                            _handleCameraPermission(context);
                          },
                        ),
                        FeatureChatBottomTile(
                          iconPath: 'assets/images/file2.svg',
                          label: 'Documents',
                          onTap: () {
                            _handleDocumentPermission(context);
                          },
                        ),
                        FeatureChatBottomTile(
                          iconPath: 'assets/images/image-v.svg',
                          label: 'Media',
                          onTap: () {
                            _handleMediaPermission(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Handle Camera Permission
  void _handleCameraPermission(BuildContext context) async {
    PermissionStatus status;

    if (Platform.isAndroid) {
      status = await Permission.camera.request();
    } else if (Platform.isIOS) {
      status = await Permission.camera.request();
    } else {
      return; // Unsupported platform
    }

    if (status.isGranted) {
      ChatCubit.get(context).pickImageFromCamera();
    } else if (status.isPermanentlyDenied) {
      _showPermissionDeniedDialog(context, 'Camera');
    }
  }

  // Handle Document Permission (including storage for old and new Android versions)
/*
  void _handleDocumentPermission(BuildContext context) async {
    if (Platform.isAndroid) {
      // Android 10+ requires Scoped Storage or MANAGE_EXTERNAL_STORAGE for full access
      if (await Permission.storage.isGranted ||
          (await Permission.manageExternalStorage.isGranted && Platform.isAndroid && await _checkAndroidVersion(30))) {
        _pickFile(context);
      } else {
        final permissionStatus = await _requestStoragePermission();
        if (permissionStatus.isGranted) {
          _pickFile(context);
        } else if (permissionStatus.isPermanentlyDenied) {
          _showPermissionDeniedDialog(context, 'Storage');
        }
      }
    } else if (Platform.isIOS) {
      // iOS doesn't need MANAGE_EXTERNAL_STORAGE but checks for file system permission
      final permissionStatus = await Permission.photos.request();
      if (permissionStatus.isGranted) {
        _pickFile(context);
      } else if (permissionStatus.isPermanentlyDenied) {
        _showPermissionDeniedDialog(context, 'File Access');
      }
    }
  }
*/
  void _handleDocumentPermission(BuildContext context) async {
    if (Platform.isAndroid) {
      final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      final AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;

      // For Android 13 (SDK 33) and above, skip permission checks
      if ((androidInfo.version.sdkInt ?? 0) >= 33) {
        _pickFile(context);
      }
      // For Android 10-12 (SDK 29-32), check storage permissions or MANAGE_EXTERNAL_STORAGE
      else if ((androidInfo.version.sdkInt ?? 0) >= 30) {
        if (await Permission.manageExternalStorage.isGranted) {
          _pickFile(context);
        } else {
          final permissionStatus = await Permission.manageExternalStorage.request();
          if (permissionStatus.isGranted) {
            _pickFile(context);
          } else if (permissionStatus.isPermanentlyDenied) {
            _showPermissionDeniedDialog(context, 'Storage');
          }
        }
      }
      // For Android 9 (SDK 28) and below, check regular storage permissions
      else {
        if (await Permission.storage.isGranted) {
          _pickFile(context);
        } else {
          final permissionStatus = await Permission.storage.request();
          if (permissionStatus.isGranted) {
            _pickFile(context);
          } else if (permissionStatus.isPermanentlyDenied) {
            _showPermissionDeniedDialog(context, 'Storage');
          }
        }
      }
    }
    // For iOS, check photos or file access permissions
    else if (Platform.isIOS) {
      final permissionStatus = await Permission.photos.request();
      if (permissionStatus.isGranted) {
        _pickFile(context);
      } else if (permissionStatus.isPermanentlyDenied) {
        _showPermissionDeniedDialog(context, 'File Access');
      }
    }
  }

  // Handle Media Permission (Images, Videos)
  void _handleMediaPermission(BuildContext context) async {
    if (Platform.isAndroid) {
      if (await Permission.photos.isGranted || await Permission.mediaLibrary.isGranted) {
        _pickMedia(context);
      } else {
        PermissionStatus permissionStatus;
        if (await _checkAndroidVersion(30)) {
          permissionStatus = await Permission.manageExternalStorage.request();
        } else {
          permissionStatus = await Permission.storage.request();
        }

        if (permissionStatus.isGranted) {
          _pickMedia(context);
        } else if (permissionStatus.isPermanentlyDenied) {
          _showPermissionDeniedDialog(context, 'Media Access');
        }
      }
    } else if (Platform.isIOS) {
      final permissionStatus = await Permission.photos.request();
      if (permissionStatus.isGranted) {
        _pickMedia(context);
      } else if (permissionStatus.isPermanentlyDenied) {
        _showPermissionDeniedDialog(context, 'Photos Access');
      }
    }
  }

  // General Permission Request for Storage on Android (Scoped Storage and Manage External Storage for Android 11+)
  Future<PermissionStatus> _requestStoragePermission() async {
    if (await _checkAndroidVersion(30)) {
      return Permission.manageExternalStorage.request();
    } else {
      return Permission.storage.request();
    }
  }

  // Pick File method
/*
  void _pickFile(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx'],
    );

    if (result != null) {
      final file = result.files.first;
      final chatCubit = ChatCubit.get(context);
      chatCubit.addDocumentMessage(
        DocumentInfo(
          name: file.name,
          type: file.extension ?? 'unknown',
          url: file.path ?? '',
        ),
      );

      File documentFile = File(result.files.single.path!);
      ChatCubit.get(context).uploadMedia(documentFile, 'document');
    } else {
      print('File selection was canceled.');
    }
  }
*/


  void _pickFile(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx'],
    );

    if (result != null) {
      final file = result.files.first;
      final chatCubit = ChatCubit.get(context);
      chatCubit.addDocumentMessage(
        DocumentInfo(
          name: file.name,
          type: file.extension ?? 'unknown',
          url: file.path ?? '',
        ),
      );

      // Upload the picked document
      File documentFile = File(result.files.single.path!);
      ChatCubit.get(context).uploadMedia(documentFile, 'document');
    } else {
      print('File selection was canceled.');
    }
  }


  // Pick Media Method
/*
  void _pickMedia(BuildContext context) async {
    final List<AssetEntity>? assets = await AssetPicker.pickAssets(
      context,
      pickerConfig: AssetPickerConfig(
        requestType: RequestType.image,
        maxAssets: 1,
      ),
    );

    List<String> imagePaths = [];
    File? file ;
    if (assets != null) {
      for (final asset in assets) {
        file = await asset.file;
        if (file != null) {
          if (asset.type == AssetType.image) {
            imagePaths.add(file.path);
          }
        }
      }

      final chatCubit = ChatCubit.get(context);
      if (imagePaths.isNotEmpty){
        chatCubit.addImageMessage(imagePaths);
        print("this is uploaded file ${file}");
        chatCubit.uploadMedia(file!, 'image');
      }
    } else {
      ChatCubit.get(context).CloseBottomAddFiles();
    }
  }
*/

  void _pickMedia(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    // Pick an image from the gallery
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Convert the picked file to a File object
      final File imageFile = File(pickedFile.path);

      final chatCubit = ChatCubit.get(context);

      // Add the image to the chat message and upload it
      chatCubit.addImageMessage([imageFile.path]);
      print("This is the uploaded file: $imageFile");
      chatCubit.uploadMedia(imageFile, 'image');
    } else {
      // Handle case when no image is selected
      ChatCubit.get(context).CloseBottomAddFiles();
      debugPrint('No image selected.');
    }
  }

  // Show a dialog when permission is denied
  void _showPermissionDeniedDialog(BuildContext context, String permissionType) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('$permissionType Permission'),
        content: Text('This app requires $permissionType access to function properly. Please enable it in the app settings.'),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text('Settings'),
            onPressed: () {
              openAppSettings();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  // Helper method to check Android version
  Future<bool> _checkAndroidVersion(int version) async {
    if (Platform.isAndroid) {
      return (await (DeviceInfoPlugin().androidInfo)).version.sdkInt >= version;
    }
    return false;
  }
}
