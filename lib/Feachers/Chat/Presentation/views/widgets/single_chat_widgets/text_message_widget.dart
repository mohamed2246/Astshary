import 'package:astshary/Feachers/Chat/Presentation/view_models/chat_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../../Core/utils/colors.dart';
import '../../../view_models/chat_cubit.dart';
import 'base_message_widget.dart';

class TextMessageWidget extends StatelessWidget {
  final String message;
  final bool isSender;
  final String? searchKeyword; // Optional search keyword
  final bool isLastMesaage;

  final String time;

  const TextMessageWidget({
    Key? key,
    required this.message,
    required this.time,
    required this.isSender,
    required this.isLastMesaage,
    this.searchKeyword, // Initialize the searchKeyword
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = HexColor(isSender ? '#000000' : '#226CEB');
    List<TextSpan> spans = [];

    if (searchKeyword != null && searchKeyword!.isNotEmpty) {
      final String lowerCaseMessage = message.toLowerCase();
      final String lowerCaseKeyword = searchKeyword!.toLowerCase();
      int start = 0;
      while (start < message.length) {
        final startIndex = lowerCaseMessage.indexOf(lowerCaseKeyword, start);
        if (startIndex == -1) {
          spans.add(TextSpan(text: message.substring(start)));
          break; // No more occurrences
        }
        if (startIndex > start) {
          spans.add(TextSpan(text: message.substring(start, startIndex)));
        }

        final endIndex = startIndex + searchKeyword!.length;
        spans.add(TextSpan(
          text: message.substring(startIndex, endIndex),
          style: TextStyle(backgroundColor: Colors.yellow),
        ));

        start = endIndex; // Update the start position
      }
    } else {
      spans.add(
          TextSpan(text: message)); // No search active, display regular text
    }

    print('BaseMessageWidget ${spans.toString() + isLastMesaage.toString()}');

    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        var cubit = ChatCubit.get(context);
        return BaseMessageWidget(
          isLastMesaage: isLastMesaage,
          istext: true,
          isSender: isSender,
          time: time,
          child: RichText(
            text: TextSpan(
              children: spans,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: color,
                    fontFamily: 'Inter-Medium',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        );
      },
    );
  }
}
