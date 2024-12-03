import 'package:astshary/Core/utils/component.dart';
import 'package:astshary/Core/utils/constant.dart';
import 'package:astshary/Feachers/FindDoctorView/Presentation/find_dector_search_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart'; // Add this import for date formatting

import '../../../view_models/chat_cubit.dart';
import '../../../view_models/chat_state.dart';
import '../../search_doctors_ai.dart';
import 'date_header.dart';
import 'enum_message_type.dart';
import 'message_widget.dart';

/*
class ChatList extends StatefulWidget {
  final List<ChatMessage> messages;

  ChatList({Key? key, required this.messages}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final ScrollController _scrollController = ScrollController();
  String _currentDate = '';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  // Helper function to format the date
  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    final messageDate = DateTime(date.year, date.month, date.day);

    if (messageDate == today) {
      return 'Today';
    } else if (messageDate == yesterday) {
      return 'Yesterday';
    } else {
      return DateFormat('d/M/yyyy').format(date); // Format the date as '24/2/1999'
    }
  }

  void _onScroll() {
    if (_scrollController.hasClients) {
      // Loop through the messages and check when the date should change
      for (int i = 0; i < widget.messages.length; i++) {
        double messageOffset = i * 100.0; // Example offset, depends on your message height
        if (_scrollController.offset >= messageOffset && _scrollController.offset < messageOffset + 100.0) {
          setState(() {
            // Parse the message date and format it
            DateTime messageTime = DateTime.parse(widget.messages[i].time!); // Assuming time is in a parsable format
            _currentDate = _formatDate(messageTime);
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          controller: _scrollController,
          itemCount: widget.messages.length,
          reverse: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MessageWidget(
                  message: widget.messages[index],
                  time: widget.messages[index].time,
                  isLastMesaage: widget.messages[index].isLastMesaage,
                  searchKeyword: ChatCubit.get(context).isSearchBarVisible
                      ? ChatCubit.get(context).searchKeyword
                      : null,
                ),
              ],
            );
          },
        ),
        // Date header that appears at the top
        if (_currentDate.isNotEmpty)
          Positioned(
            top: 10.0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: HexColor('#F4F6F9').withOpacity(.7),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  _currentDate,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: HexColor('#435946'),
                    fontFamily: 'Inter-Regular',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
*/




class ChatList extends StatefulWidget {
  final List<ChatMessage> messages;

  ChatList({Key? key, required this.messages}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final ScrollController _scrollController = ScrollController();
  String _currentDate = '';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    final messageDate = DateTime(date.year, date.month, date.day);

    if (messageDate == today) {
      return 'Today';
    } else if (messageDate == yesterday) {
      return 'Yesterday';
    } else {
      return DateFormat('d/M/yyyy').format(date); // Format the date as '24/2/1999'
    }
  }

  void _onScroll() {
    if (_scrollController.hasClients) {
      // Loop through the messages and check when the date should change
      for (int i = 0; i < widget.messages.length; i++) {
        double messageOffset = i * 100.0; // Example offset, depends on your message height
        if (_scrollController.offset >= messageOffset && _scrollController.offset < messageOffset + 100.0) {
          setState(() {
            // Parse the message date and format it
            DateTime messageTime = DateTime.parse(widget.messages[i].time!); // Assuming time is in a parsable format
            _currentDate = _formatDate(messageTime);
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            var chatCubit = ChatCubit.get(context);

            return ListView.builder(
              controller: _scrollController,
              itemCount: widget.messages.length,
              reverse: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final isSelected = chatCubit.selectedMessageIndices.contains(index);  // Check if the message is selected

                return Column(
                  children: [
                    GestureDetector(
                      onLongPress: () {
                        chatCubit.toggleMessageSelection(index);  // Toggle selection on long press
                      },
                      onTap: () {
                        if (chatCubit.isSelectionMode) {
                          chatCubit.toggleMessageSelection(index);  // Handle selection when in selection mode
                        }
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: isSelected ? Colors.blue.withOpacity(0.5) : Colors.transparent,  // Change background color if selected
                            child: MessageWidget(
                              message: widget.messages[index],
                              time: widget.messages[index].time,
                              isLastMesaage: widget.messages[index].isLastMesaage,
                              searchKeyword: ChatCubit.get(context).isSearchBarVisible
                                  ? ChatCubit.get(context).searchKeyword
                                  : null,
                              isSelected: isSelected,  // Pass the selected state
                            ),
                          ),
                        ],
                      ),
                    ),
                    if(index == 0 && chatCubit.BootTyping )
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                      child: Row(
                        children: [
                          itArabic ? Spacer():SizedBox(),
                          Image.asset('assets/images/typing.gif' , height: 70.h,width: 70.w,),
                        ],
                      ),
                    ),

                    index == 0 && chatCubit.area_id!=null ?
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Spacer(),
                        InkWell(

                          child: Container(

                            child: Row(
                              children: [
                                Text('Show All Doctors'.tr() ,  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: HexColor('#226CEB'),
                                  fontFamily: 'Inter-Medium',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                )),
                                SizedBox(width: 4,),
                                RotatedBox(
                                  quarterTurns: context.locale.languageCode == 'ar' ? 0 : 2,
                                  child: SvgPicture.asset(
                                    width: 16,
                                    height: 16,

                                    'assets/images/back_arrow (2).svg',
                                    color: HexColor('#226CEB'),
                                  ),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(    color: HexColor('#226CEB').withOpacity(.2),
                            borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onTap: (){
                            var cubit = ChatCubit.get(context);
                            navigateTo(context, AiFindDoctorDoctorView());
                          },
                        ),
                        Spacer(),

                      ],
                    ):SizedBox(),
                  ],
                );
              },
            );
          },
        ),
        if (_currentDate.isNotEmpty)
          Positioned(
            top: 10.0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: HexColor('#F4F6F9').withOpacity(.7),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  _currentDate,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: HexColor('#226CEB'),
                    fontFamily: 'Inter-Regular',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}