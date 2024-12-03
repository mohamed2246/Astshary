import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../view_models/chat_cubit.dart';
import '../../../view_models/chat_state.dart';

class WhileRecordingWidget extends StatefulWidget {

  var constrains ;

  WhileRecordingWidget(this.constrains);

  @override
  State<WhileRecordingWidget> createState() => _WhileRecordingWidgetState();
}

class _WhileRecordingWidgetState extends State<WhileRecordingWidget> {

  @override
  void initState() {
    super.initState();
/*
    ChatCubit.get(context).initSpeech();
*/
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        var cubit = ChatCubit.get(context);

        return Container(

          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment:
            MainAxisAlignment.start,
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 8,
              ),

              Expanded(
                flex: 3,
                child: Container(
                  height: 52.h,
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: /*Colors.grey[200]*/HexColor('#FFFFFF'),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(

                    children: [

                      Text(
                        '${(cubit.recordingDuration ~/ 60).toString().padLeft(
                            2, '0')}:${(cubit.recordingDuration % 60)
                            .toString()
                            .padLeft(2, '0')}',
                        style: TextStyle(
                            color: HexColor('#226CEB'),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      AnimatedSwitcher(
                          duration: const Duration(
                              milliseconds: 200),
                          child: AudioWaveforms(
                            enableGesture: true,
                            size: Size(
                                widget.constrains.maxWidth / 3.1, 50),
                            recorderController:
                            cubit.recorderController,
                            waveStyle:  WaveStyle(
                              waveColor: HexColor('#226CEB'),
                              extendWaveform: true,
                              showMiddleLine: false,
                            ),
                            padding:
                            const EdgeInsets.only(
                                left: 18),
                            margin: const EdgeInsets
                                .symmetric(
                                horizontal: 15),
                          )),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                width: 8,
              ),

              Expanded(
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        cubit.stopListening();

                        cubit.stopRecording(); // This stops the recording and adds it to the message list.
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

                            'assets/images/audio-record.svg',
                            height: 20.h,  // ScreenUtil usage
                            width: 20.w,  // ScreenUtil usage
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: (){
                        cubit.stopListening();

                        cubit.stopRecording(); // This stops the recording and adds it to the message list.
                        cubit.deleteRecording(); // This deletes the current recording.

                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: HexColor('#226CEB').withOpacity(.2),
                          borderRadius: BorderRadius.circular(16.r),  // ScreenUtil usage
                        ),
                        width: 48.w,  // ScreenUtil usage
                        height: 52.h,  // ScreenUtil usage
                        child: Center(
                          child:  Icon(
                            color: HexColor('#226CEB'),
                            Icons.cancel,
                            size: 24.w,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )






            ],
          ),
        );
      },
    );
  }
}
