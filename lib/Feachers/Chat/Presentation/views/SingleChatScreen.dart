import 'dart:async';

import 'package:astshary/Core/utils/constant.dart';
import 'package:astshary/Feachers/Chat/Presentation/views/widgets/single_chat_widgets/Chat_bottom_feature_grid_widget.dart';
import 'package:astshary/Feachers/Chat/Presentation/views/widgets/single_chat_widgets/chat_bar.dart';
import 'package:astshary/Feachers/Chat/Presentation/views/widgets/single_chat_widgets/chat_list.dart';
import 'package:astshary/Feachers/Chat/Presentation/views/widgets/single_chat_widgets/chat_normal_appbar.dart';
import 'package:astshary/Feachers/Chat/Presentation/views/widgets/single_chat_widgets/chat_selection_appbar.dart';
import 'package:astshary/Feachers/Chat/Presentation/views/widgets/single_chat_widgets/while_recording_widget.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/highlight_style.dart';
import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as ui;

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../Core/utils/colors.dart';
import '../../../HomePageView/Presentation/views/HomePageView.dart';
import '../view_models/chat_cubit.dart';
import '../view_models/chat_state.dart';
import 'widgets/single_chat_widgets/minue/menu_item.dart';


class SingleChatScreen extends StatefulWidget {
  SingleChatScreen({Key? key}) : super(key: key);

  @override
  State<SingleChatScreen> createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ChatCubit.get(context).formfeildLineLength = 1 ;
    ChatCubit.get(context).listenForPermissions();
    if (!ChatCubit.get(context).speechEnabled) {
      ChatCubit.get(context).initSpeech();
    }
  }


  @override
  void dispose() {
    ChatCubit.get(context).chatTextFeildController.dispose();
/*
    ChatCubit.get(context).chatFocusNode.dispose();
*/
    super.dispose();
  }

  final Color colorSelect = const Color(0XFF246BFD);


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Place your custom logic here
        ChatCubit.get(context).handleBackAction(context);
        return false;
      },
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is SearchScrollToIndexState) {
            // Scroll to the message at `state.index`
            _scrollToIndex(state.index);
          }
        },
        builder: (context, state) {
          return LayoutBuilder(builder: (context, constrains) {
            var chatCubit = ChatCubit.get(context);
            return Scaffold(

              bottomNavigationBar: BlocBuilder<NavigationCubit, int>(
                builder: (context, visit) {
                  return BottomBarCreative(
                    titleStyle: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: HexColor('#2563EB'), fontSize: context.locale.languageCode == 'ar' ? 14 : 13),
                    iconSize: 24,
                    items: [
                      TabItem(
                        icon: visit == 0
                            ? SvgPicture.asset('assets/images/homeActive.svg', width: 20, height: 20)
                            : SvgPicture.asset('assets/images/home_inactive.svg', width: 20, height: 20),
                        title: 'Home'.tr(),
                      ),
                      TabItem(
                        icon: visit == 1
                            ? SvgPicture.asset('assets/images/booking_active.svg', width: 20, height: 20)
                            : SvgPicture.asset('assets/images/booking_inactive.svg', width: 20, height: 20),
                        title: 'Booking'.tr(),
                      ),
                      TabItem(
                        icon: SvgPicture.asset('assets/images/chat (1) 1.svg', width: 28, height: 28),
                        title: 'Wishlist'.tr(),
                      ),
                      TabItem(
                        icon: visit == 3
                            ? SvgPicture.asset('assets/images/windows_active.svg', width: 20, height: 20)
                            : SvgPicture.asset('assets/images/windows_inactive.svg', width: 20, height: 20),
                        title: 'Specialties'.tr(),
                      ),
                      TabItem(
                        icon: visit == 4
                            ? SvgPicture.asset('assets/images/profile_active.svg', width: 20, height: 20)
                            : SvgPicture.asset('assets/images/profile_inactive.svg', width: 20, height: 20),
                        title: 'Profile'.tr(),
                      ),
                    ],
                    backgroundColor: whiteColor,
                    color: HexColor('#9E9E9E'),
                    colorSelected: colorSelect,
                    indexSelected: visit,
                    isFloating: true,
                    highlightStyle: HighlightStyle(
                      sizeLarge: true,
                      isHexagon: true,
                      elevation: 10,
                      color: Colors.white,
                      background: Colors.white,
                    ),
                    onTap: (int index) {
                      context.read<NavigationCubit>().changeTabIndex(index);
                    },
                  );
                },
              ),
              body: BlocConsumer<ChatCubit, ChatState>(
                listener: (context, state) {
                  // TODO: implement listener

                  if (state is MessageLoadingState) {
                    // Show a loading indicator
                  } else if (state is MessageAddedState) {
                    // Display the new image message
                  } else if (state is MessageErrorStateState) {
                    // Show an error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  }
                },
                builder: (context, state) {
                  var cubit = ChatCubit.get(context);
                  return Column(
                    children: [

                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(height: 62.h,),
                             NormalChatAppBar(context),
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: ChatList(
                                        messages: cubit.messages,
                                      ),
                                    ),



                                    Container(
                                      width: double.infinity,
                                      color: Colors.transparent,
                                      child: IntrinsicHeight(
                                        // Use IntrinsicHeight to size height to content
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            // Spacing, adjust as needed
                                            cubit.isBottomAddFiles
                                                ? Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                                              child: Container(

                                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                                decoration: BoxDecoration(
                                                  color:Colors.transparent,
                                                  borderRadius: BorderRadius.circular(24.r),
                                                ),
                                                width: double.infinity,
                                                height:149.h,
                                                child: ChatBottomFeatureGridWidget(
                                                  height: 149.h,
                                                ),
                                              ),
                                            )
                                                : SizedBox(),
                                            SizedBox(height: 8),
                                            if (cubit.isRecording) ...[
                                              Padding(
                                                padding: EdgeInsets.only(left: 8.0.w , right: 24.w),
                                                child: Directionality(textDirection: ui.TextDirection.ltr, child: WhileRecordingWidget(constrains)),
                                              ),


                                            ],
                                            if (!cubit.isRecording) ...[
                                              Padding(
                                                padding: EdgeInsets.only(left: itArabic? 24.w :8.0.w , right: itArabic?8.0.w  : 24.w),
                                                child: ChatBar(cubit.chatTextFeildController),
                                              ),
                                            ],





                                          ],
                                        ),
                                      ),
                                    ),

                                    // Set a minimum height),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),


                      // here i need if the keyboad opened this size box be 0
                    ],
                  );
                },
              ),
            );
          });
        },
      ),
    );


  }
  void _scrollToIndex(int index) {
    // Get the BuildContext of the specific message widget using its GlobalKey
    final messageContext = ChatCubit.get(context).messages[index].key.currentContext;
    if (messageContext != null) {
      // Use the messageContext to scroll the specific message widget into view
      Scrollable.ensureVisible(messageContext, duration: Duration(milliseconds: 300));
    }
  }

}
