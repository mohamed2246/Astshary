import 'package:flutter/cupertino.dart';

enum MessageType {
  text,
  image,
  video,
  document,
  poll,
  contact,
  location,
}

class ChatMessage {
  final MessageType type;
  final dynamic content; // Can be String for text or List<String> for images
  final String? duration;  // Add this line for voice message duration
  final String? time;  // Add this line for voice message duration
  final String? location;  // Add this line for voice message duration
  GlobalKey key = GlobalKey(); // Add this line for dynamic height messages

  final bool isSender;
  final bool isLastMesaage;
    bool? isPlaying; // New field to indicate if the voice message is playing
    bool? ImageFromCamera; // New field to indicate if the voice message is playing


  ChatMessage({
    required this.type,
    required this.content,
    required this.isSender,
    required this.time,
    required this.isLastMesaage ,
    this.duration,
    this.location,
    this.isPlaying = false,
    this.ImageFromCamera = false,
  }): key = GlobalKey();
}
