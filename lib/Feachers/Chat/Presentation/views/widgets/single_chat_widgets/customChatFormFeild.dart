import 'dart:async';
import 'dart:io';

import 'package:astshary/Core/utils/constant.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../../Core/utils/colors.dart';
import '../../../view_models/chat_cubit.dart';
import '../../../view_models/chat_state.dart';
import 'dart:async';
import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../view_models/chat_cubit.dart';
import '../../../view_models/chat_state.dart';

class CustomChatFormField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onEmojiPressed;

  const CustomChatFormField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.onEmojiPressed, // Constructor parameter for emoji button callback
  }) : super(key: key);

  @override
  State<CustomChatFormField> createState() => _CustomChatFormFieldState();
}

class _CustomChatFormFieldState extends State<CustomChatFormField> {
  Timer? _checkTypingTimer;

  // Starts the timer to check if the user has stopped typing
  void startTimer() {
    _checkTypingTimer = Timer(const Duration(milliseconds: 600), () {
      // Your logic here
    });
  }

  // Resets the timer when the user types something
  void resetTimer() {
    _checkTypingTimer?.cancel(); // Cancel the previous timer if any
    startTimer(); // Start a new timer
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatCubit, ChatState>(

      listener: (context, state) {
/*
        if (state is SpeechRecognitionResult) {
          print('Received SpeechRecognitionResult state.');
          // Update the text field controller with the transcription
          widget.controller.text = ChatCubit.get(context).transcription;
          print('Updated text field with transcription: ${widget.controller.text}');
          widget.controller.selection = TextSelection.fromPosition(
            TextPosition(offset: widget.controller.text.length),
          );
          ChatCubit.get(context).ChatTyping(widget.controller.text.isNotEmpty);
        }
*/
      },
      child: BlocBuilder<ChatCubit, ChatState>(

        builder: (context, state) {
          var cubit = ChatCubit.get(context);
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    padding: EdgeInsets.only(left: itArabic ? 0:20 , right: itArabic ? 20:0),
                    decoration: BoxDecoration(
                      border: Border.all(color: HexColor('#DADEE3')),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      minLines: 1,
                      maxLines: 5,
                      onChanged: (String str) {
                        int lines = ChatCubit.get(context).calculateTextLines(str, context);
                        print('lines ${lines}');
                        ChatCubit.get(context).ChatTyping(/*str.isNotEmpty*/true);
                        resetTimer(); // Reset timer when user types something
                      },
                      onSubmitted: (String text) {
                        if (cubit.chatTextFeildController.text.trim().isNotEmpty) {
                          ChatCubit.get(context).sendTextMessage(cubit.chatTextFeildController.text.trim());
                          cubit.chatTextFeildController.clear(); // Clear the text field after sending the message
                        }
                        ChatCubit.get(context).formfeildLineLength = 1;
                      },
                      onTap: () {
                        print('TextField');
                        ChatCubit.get(context).CloseBottomAddFiles();
                        ChatCubit.get(context).closeEmojiPicker();
                      },
                      controller: cubit.chatTextFeildController,
                      focusNode: widget.focusNode,
                      // Use the provided FocusNode
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: HexColor('#226CEB'),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter-Regular',
                      ),
                      decoration: InputDecoration(
                        prefixIconConstraints: BoxConstraints(
                          minHeight: 24.h,
                          minWidth: 24.w,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 12.sp,
                          color: HexColor('#226CEB'),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter-Regular',
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              child: SvgPicture.asset('assets/images/attach.svg', height: 24.h, width: 24.w),
                              onTap: () {
                                ChatCubit.get(context).toggleBottomAddFiles();
                              },
                            ),
                            SizedBox(width: 12.w),
                            InkWell(
                              child: SvgPicture.asset('assets/images/camera3.svg', height: 24.h, width: 24.w),
                              onTap: () {
                                _handleCameraPermission(context);
                              },
                            ),
                            SizedBox(width: 12.w),
                          ],
                        ),
                        hintText: 'writeAsrad'.tr(),
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
}


/*
class CustomChatFormField extends StatefulWidget {

  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onEmojiPressed;

  const CustomChatFormField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.onEmojiPressed, // Constructor parameter for emoji button callback
  }) : super(key: key);

  @override
  State<CustomChatFormField> createState() => _CustomChatFormFieldState();


}

class _CustomChatFormFieldState extends State<CustomChatFormField> {
  Timer? _checkTypingTimer;
  // Starts the timer to check if the user has stopped typing
  void startTimer() {
    _checkTypingTimer = Timer(const Duration(milliseconds: 600), () {


    });
  }

  // Resets the timer when the user types something
  void resetTimer() {
    _checkTypingTimer?.cancel(); // Cancel the previous timer if any
    startTimer(); // Start a new timer
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Container(
*/
/*
          height: 52.h,
*//*

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: HexColor('#DADEE3')),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Container(
                    child: TextField(

                      minLines: 1,
                      maxLines: 5,
                      onChanged: (String str) {
                        int lines = ChatCubit.get(context).calculateTextLines(str , context);
                        print('lines ${lines}');
                        ChatCubit.get(context).ChatTyping(!str.isEmpty);
                        resetTimer(); // Reset timer when user types something

                      },


                      onSubmitted: (String text) {
                        if (widget.controller.text
                            .trim()
                            .isNotEmpty) {
                          ChatCubit.get(context).sendTextMessage(
                              widget.controller.text.trim());
                          widget.controller.text = '';
                          widget.controller
                              .clear(); // Clear the text field after sending the message
                        }
                        ChatCubit.get(context).formfeildLineLength = 1 ;

                      },
                      onTap: () {
                        print('TextField');
                        ChatCubit.get(context).CloseBottomAddFiles();
                        ChatCubit.get(context).closeEmojiPicker();
                      },
                      controller: widget.controller,
                      focusNode: widget.focusNode,
                      // Use the provided FocusNode
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: HexColor('#226CEB'),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter-Regular'

                      ),
                      decoration: InputDecoration(
                        prefixIconConstraints: BoxConstraints(
                            minHeight: 24.h,
                            minWidth: 24.w
                        ),
                        hintStyle: TextStyle(
                            fontSize: 16.sp,
                            color: HexColor('#226CEB'),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter-Regular'

                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 14.h),
                        border: InputBorder.none,
                        // Remove the default border
                        enabledBorder: InputBorder.none,
                        // Remove the border when enabled
                        focusedBorder: InputBorder.none,
                        // Remove the border when focused
                        errorBorder: InputBorder.none,
                        // Remove the border when there's an error
                        disabledBorder: InputBorder.none,
                        // Remove the border when disabled

                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          // Ensures the row doesn't take up too much space
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            InkWell(
                              child: SvgPicture.asset(
                                  'assets/images/attach.svg', height: 24.h,
                                  width: 24.w),
                              onTap: () {
                                */
/* if (widget.controller.text.trim().isNotEmpty) {
                                  ChatCubit.get(context).sendTextMessage(widget.controller.text.trim());
                                  widget.controller.clear(); // Clear the text field after sending the message
                                }*//*


                                ChatCubit.get(context).toggleBottomAddFiles();
                              },

                            ),
                            SizedBox(width: 12.w,),
                            InkWell(
                              child: SvgPicture.asset(
                                  'assets/images/camera3.svg', height: 24.h,
                                  width: 24.w),
                              onTap: () {

                                _handleCameraPermission(context);
                                */
/* if (widget.controller.text.trim().isNotEmpty) {
                                  ChatCubit.get(context).sendTextMessage(widget.controller.text.trim());
                                  widget.controller.clear(); // Clear the text field after sending the message
                                }*//*


                              },
                            ),
                            SizedBox(width: 12.w,),

                          ],
                        ),
                        hintText: 'Type message ...',
                      ),
                    ),
                  ),
                ),

              ),

            ],
          ),
        );
      },
    );
  }

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

}*/


