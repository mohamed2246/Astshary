/*

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:suapp/Feachers/Chat/Presentation/views/widgets/single_chat_widgets/text_message_widget.dart';
import 'package:suapp/Feachers/Chat/Presentation/views/widgets/single_chat_widgets/vedio_message_widget.dart';
import 'package:suapp/Feachers/Chat/Presentation/views/widgets/single_chat_widgets/voice_message_widget.dart';


import '../../../../Data/Models/document_info.dart';
import 'DocumentMessageWidget.dart';
import 'enum_message_type.dart';
import 'image_message_widget.dart';

class MessageWidget extends StatelessWidget {
  final ChatMessage message;
   String? searchKeyword;
   String? time;
   bool isLastMesaage ;
  final bool isSelected;  // Add this flag to indicate whether the message is selected

   MessageWidget({
    Key? key, // Add key here
    required this.message,
     this.isSelected = false,  // Add default false

     required this.isLastMesaage,
    this.searchKeyword,
    required this.time
  }) : super(key: key); // Initialize the key in the constructor
  String formatTime(String dateString) {
    DateTime dateTime = DateTime.parse(dateString); // Parse the string into DateTime
    return DateFormat('h:mm a').format(dateTime); // Format time as "12:34 PM"
  }
  @override
  Widget build(BuildContext context) {


    switch (message.type) {
      case MessageType.text:
        return TextMessageWidget(
          time: formatTime(time!), // Format the time to show as "12:34 PM"
            message: message.content, isSender: message.isSender ,searchKeyword: searchKeyword, // The current search keyword, if any
          isLastMesaage: isLastMesaage,

        );
      // TODO: Add cases for other message types
      case MessageType.image:
        return ImageMessageWidget(
          time: formatTime(time!), // Format the time to show as "12:34 PM"

          isSender: message.isSender,
          imageUrls: message.content,
          fromCamera: message.ImageFromCamera!,
          isLastMesaage: isLastMesaage,
        );

      case MessageType.video:
        return VideoMessageWidget(
          time: formatTime(time!), // Format the time to show as "12:34 PM"

          videoUrls: message.content, isSender: message.isSender,
        isLastMesaage:isLastMesaage ,

        );

      case MessageType.voice:

        return VoiceMessageWidget(
          time: formatTime(time!), // Format the time to show as "12:34 PM"

          message: message,
          isSender: message.isSender,
          isLastMesaage: isLastMesaage,

        );

      case MessageType.document:
        return DocumentMessageWidget(
          time: formatTime(time!), // Format the time to show as "12:34 PM"

          document: message.content as DocumentInfo,
          // Ensure your message model supports this
          isSender: message.isSender,
          isLastMesaage: isLastMesaage,

        );

      default:
        return SizedBox.shrink(); // Placeholder for unsupported message types
    }
  }
}


*/



import 'package:astshary/Feachers/Chat/Presentation/views/widgets/single_chat_widgets/text_message_widget.dart';
import 'package:astshary/Feachers/Chat/Presentation/views/widgets/single_chat_widgets/vedio_message_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../Data/Models/document_info.dart';
import 'DocumentMessageWidget.dart';
import 'enum_message_type.dart';
import 'image_message_widget.dart';

class MessageWidget extends StatelessWidget {
  final ChatMessage message;
  String? searchKeyword;
  String? time;
  bool isLastMesaage;
  final bool isSelected; // Flag to indicate whether the message is selected

  MessageWidget({
    Key? key,
    required this.message,
    this.isSelected = false, // Default false
    required this.isLastMesaage,
    this.searchKeyword,
    required this.time,
  }) : super(key: key);

  // Format the time to show as "12:34 PM"
  String formatTime(String dateString) {
    DateTime dateTime = DateTime.parse(dateString); // Parse the string into DateTime
    return DateFormat('h:mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    // Define the background color based on the selection state

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10), // Optional: Add padding
      child: _buildMessageContent(), // Build message content based on the type
    );
  }

  // Build content based on message type
  Widget _buildMessageContent() {
    switch (message.type) {
      case MessageType.text:
        return TextMessageWidget(
          time: formatTime(time!), // Format the time to show as "12:34 PM"
          message: message.content,
          isSender: message.isSender,
          searchKeyword: searchKeyword, // Pass the current search keyword
          isLastMesaage: isLastMesaage,
        );

      case MessageType.image:
        return ImageMessageWidget(
          time: formatTime(time!), // Format the time to show as "12:34 PM"
          isSender: message.isSender,
          imageUrls: message.content,
          fromCamera: message.ImageFromCamera!,
          isLastMesaage: isLastMesaage,
        );

      case MessageType.video:
        return VideoMessageWidget(
          time: formatTime(time!), // Format the time to show as "12:34 PM"
          videoUrls: message.content,
          isSender: message.isSender,
          isLastMesaage: isLastMesaage,
        );



      case MessageType.document:
        return DocumentMessageWidget(
          time: formatTime(time!), // Format the time to show as "12:34 PM"
          document: message.content as DocumentInfo,
          isSender: message.isSender,
          isLastMesaage: isLastMesaage,
        );

      default:
        return SizedBox.shrink(); // Handle unsupported message types
    }
  }
}
