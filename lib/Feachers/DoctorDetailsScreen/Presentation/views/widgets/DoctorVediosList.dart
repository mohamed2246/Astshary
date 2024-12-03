import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoListScreen extends StatefulWidget {
  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  // List of YouTube video IDs


  // Initialize YouTube Player Controller for the selected video
  YoutubePlayerController? _controller;

  // Index of the currently playing video
  int? _selectedVideoIndex;

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {
        var cubit = SpecialtiesCubit.get(context);

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              // Display the YouTube Player only if a video is selected
              if (_selectedVideoIndex != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r), // Rounded corners
                  child: Container(
                    height: 190.h, // Height of the currently playing video
                    child: YoutubePlayer(
                      controller: _controller!,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.blueAccent,
                      onReady: () {
                        print('Player is ready.');
                      },
                    ),
                  ),
                ),
              cubit.doctorDetailsModel?.videos != null &&
                  (cubit.doctorDetailsModel!.videos!.video_1 != null ||
                      cubit.doctorDetailsModel!.videos!.video_2 != null ||
                      cubit.doctorDetailsModel!.videos!.video_3 != null)?
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedVideoIndex = index;

                        // Initialize YouTube Player Controller with the selected video
                        _controller = YoutubePlayerController(
                          initialVideoId:index ==0 ? cubit.doctorDetailsModel!.videos!.video_1 :index ==1 ?cubit.doctorDetailsModel!.videos!.video_2 :cubit.doctorDetailsModel!.videos!.video_3 ,
                          flags: YoutubePlayerFlags(
                            autoPlay: true,
                            mute: false,
                          ),
                        );
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      // Rounded corners for each video
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8.h),
                        // Vertical margin between videos
                        height: 190.h,
                        // Set height of each video
                        child: YoutubePlayerBuilder(
                          player: YoutubePlayer(
                            controller: YoutubePlayerController(
                              initialVideoId: index ==0 ? cubit.doctorDetailsModel!.videos!.video_1 :index ==1 ?cubit.doctorDetailsModel!.videos!.video_2 :cubit.doctorDetailsModel!.videos!.video_3 ,
                              flags: YoutubePlayerFlags(
                                autoPlay: false,
                                mute: false,
                              ),
                            ),
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.white,
                          ),
                          builder: (context, player) {
                            return Container(
                              child: player,
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ):SizedBox(),

              SizedBox(height: 60.h,),
            ],
          ),
        );
      },
    );
  }
}
