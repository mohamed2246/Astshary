import 'package:astshary/Core/utils/constant.dart';
import 'package:astshary/Feachers/Chat/Presentation/view_models/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../view_models/chat_cubit.dart';
import 'customChatFormFeild.dart';

/*
class ChatBar extends StatelessWidget {
  final TextEditingController chatTextFeildController;

  ChatBar(this.chatTextFeildController);

  @override
  Widget build(BuildContext context) {
    var cubit = ChatCubit.get(context);

    return Row(
      mainAxisAlignment:
      MainAxisAlignment.start,
      crossAxisAlignment:
      CrossAxisAlignment.end,
      children: [
        Expanded(
            child: CustomChatFormField(
              controller: chatTextFeildController,
              onEmojiPressed:
              cubit.toggleEmojiPicker,
              focusNode: cubit
                  .chatFocusNode, // Pass the toggle function
            )),



        InkWell(
          onTap: (){
            if( cubit.isChatTyping){

              if (chatTextFeildController.text.trim().isNotEmpty) {
                ChatCubit.get(context).sendTextMessage(chatTextFeildController.text.trim());
                ChatCubit.get(context).ChatTyping(false);
                chatTextFeildController.clear(); // Clear the text field after sending the message
                ChatCubit.get(context).formfeildLineLength = 1 ;

              }
            }else{
              cubit.toggleRecording();
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: HexColor('#226CEB').withOpacity(.2),
              borderRadius: BorderRadius.circular(16.r),  // ScreenUtil usage
            ),
            width: 48.w,  // ScreenUtil usage
            height: 52.h,  // ScreenUtil usage
            child: Center(
              child: SvgPicture.asset(
                color: HexColor('#226CEB'),
               cubit. isChatTyping ? 'assets/images/send 1.svg' : 'assets/images/audio-record.svg',
                height: 20.h,  // ScreenUtil usage
                width: 20.w,  // ScreenUtil usage
              ),
            ),
          ),
        ),
       */
/* Material(
          color: Colors.transparent,
          child: IconButton(
            onPressed: () {
              cubit.toggleRecording();
            },
            icon: SvgPicture.asset(
              'Images/Assets/microphone-2.svg',
              height: 24,
              width: 24,
              color: Theme.of(context)
                  .brightness ==
                  Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),*//*

      ],
    );
  }

}
*/


class ChatBar extends StatefulWidget {
  final TextEditingController chatTextFeildController;

  ChatBar(this.chatTextFeildController);

  @override
  State<ChatBar> createState() => _ChatBarState();
}

class _ChatBarState extends State<ChatBar> {

  /*@override
  void initState() {
    super.initState();
    ChatCubit.get(context).listenForPermissions();
    if (!ChatCubit.get(context).speechEnabled) {
      ChatCubit.get(context).initSpeech();
    }
  }*/

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ChatCubit, ChatState>(
  builder: (context, state) {
    var cubit = ChatCubit.get(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: CustomChatFormField(
            controller: cubit.chatTextFeildController,
            onEmojiPressed: cubit.toggleEmojiPicker,
            focusNode: cubit.chatFocusNode,
          ),
        ),
        InkWell(
          onTap: () {
            if (cubit.isChatTyping) {
              if (cubit.chatTextFeildController.text.trim().isNotEmpty) {
                ChatCubit.get(context).sendTextMessage(cubit.chatTextFeildController.text.trim());
                ChatCubit.get(context).ChatTyping(false);
                cubit.chatTextFeildController.clear();
              }
            } else {
              cubit.toggleRecording(cubit.chatTextFeildController); // Pass controller here
              cubit.startListening();
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: HexColor('#226CEB').withOpacity(.2),
              borderRadius: BorderRadius.circular(16.r),
            ),
            width: 48.w,
            height: 52.h,
            child: Center(
              child: RotatedBox(
                quarterTurns:  cubit.isChatTyping  ?  itArabic ? 2 : 0 : 0,
                child: SvgPicture.asset(
                  color: HexColor('#226CEB'),
                 /* cubit.isChatTyping  ?*/ 'assets/images/send 1.svg'/* : 'assets/images/audio-record.svg'*/,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  },
);
  }
}
