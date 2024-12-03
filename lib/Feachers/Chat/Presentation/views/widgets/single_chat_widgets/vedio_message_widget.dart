import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';


import '../../../view_models/chat_cubit.dart';
import '../../../view_models/chat_state.dart';
import 'base_message_widget.dart';

// Other imports...

class VideoMessageWidget extends StatelessWidget {
  final List<String> videoUrls;
  final bool isSender;
  final String time;
  final bool  isLastMesaage;

  const VideoMessageWidget({
    Key? key,
    required this.videoUrls,
    required this.isSender,
    required this.time,
    required this.isLastMesaage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseMessageWidget(
      isLastMesaage: isLastMesaage,
      isSender: isSender,
      child:

      videoUrls.length == 1 ?
      GestureDetector(
        onTap: () {

/*
          navigateTo(context, VideoPlayerScreen(videoUrl: videoUrls[0],isNeedPostOwnerDetails: false, ));
*/

        },
        child: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            context.read<ChatCubit>().loadVideoThumbnail(videoUrls[0]);
            if (/*state is VideoThumbnailLoaded &&*/ ChatCubit.get(context).videoThumbnails.containsKey(videoUrls[0])) {
              String thumbnailPath = ChatCubit.get(context).videoThumbnails[videoUrls[0]]!;
              // Use Image.file to load the thumbnail from a local file

              return Stack(
                alignment: Alignment.center, // Center the icon on the thumbnail
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(thumbnailPath),
                      fit: BoxFit.cover,
                      height: 128,
                      width: double.infinity,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/images/play.svg', // Path to your play icon SVG
                    height: 36,
                    width: 36,
                  ),
                ],
              );
            }
            else {
              // Thumbnail is not yet loaded, show placeholder
              return buildVideoPlaceholder(context);
            }
          },
        ),
      )

          :

      GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: videoUrls.length,
        itemBuilder: (BuildContext context, int index) {
          String videoUrl = videoUrls[index];
          context.read<ChatCubit>().loadVideoThumbnail(videoUrl);

          return GestureDetector(
            onTap: () {
              print(videoUrl); // Handle tap on video

/*
              navigateTo(context, VideoPlayerScreen(videoUrl: videoUrl,isNeedPostOwnerDetails: false, ));
*/

            },
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                if (/*state is VideoThumbnailLoaded &&*/ ChatCubit.get(context).videoThumbnails.containsKey(videoUrl)) {
                  String thumbnailPath = ChatCubit.get(context).videoThumbnails[videoUrl]!;
                  // Use Image.file to load the thumbnail from a local file
                  return Stack(
                    alignment: Alignment.center, // Center the icon on the thumbnail
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          File(thumbnailPath),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/images/play_width_more.svg', // Path to your play icon SVG
                        height: 36,
                        width: 36,
                      ),
                    ],
                  );
                } else {
                  // Thumbnail is not yet loaded, show placeholder
                  return buildVideoPlaceholder(context);
                }
              },
            ),
          );
        },
      ),
    );
  }

  Widget buildVideoPlaceholder(BuildContext context) {
    return Container(
      height: videoUrls.length ==1 ?128 : double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Icon(Icons.play_circle_outline, color: Colors.white, size: 64),
      ),
    );
  }
}
