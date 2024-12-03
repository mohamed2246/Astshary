  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../../../Core/utils/colors.dart';
  
  class BaseMessageWidget extends StatelessWidget {
    final Widget child;
    final bool isSender;
     bool? isRecord = false;
     bool? ispoll = false;
     bool? istext = false;
     final bool isLastMesaage ;
     final String time ;

     BaseMessageWidget({Key? key,this.time = '' , required this.isLastMesaage, required this.child, required this.isSender , this.isRecord = false, this.ispoll = false , this.istext = false}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      var alignment = isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start;
      var color = isSender ? HexColor('#E3E2E2') :HexColor('#F4F6F9');
      BoxDecoration boxDecoration(){
  
       if(isSender)
        return  BoxDecoration(
        color: color,
          borderRadius: BorderRadius.only( topRight: Radius.circular(12),bottomRight: Radius.circular(12),bottomLeft: Radius.circular(12),topLeft: isLastMesaage? Radius.circular(12) : Radius.circular(0)),
        );
       return BoxDecoration(
        color: color,
         borderRadius: BorderRadius.only( topRight: Radius.circular(12),bottomRight: Radius.circular(12),bottomLeft: Radius.circular(12),topLeft: isLastMesaage? Radius.circular(12) : Radius.circular(0)),
        );
      }
  
      return Align(
        alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
        child: ConstrainedBox(
          constraints:  istext! ? BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.85)  :     !isRecord! && !ispoll!  ? BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6) : ispoll! ?BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8) : BoxConstraints(maxWidth: MediaQuery.of(context).size.width ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: isRecord! ?  0  : 15, horizontal: 15),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: !isRecord! ? boxDecoration() :null,
            child: istext! ?Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(child: child),
                SizedBox(width: 20.w,),
                istext! ? Text(
                  time,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: HexColor(isSender ?'#000000' :'#226CEB'),
                    fontFamily: 'Inter-Regular',
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ):SizedBox(),

              ],
            ) : child,
          ),
        ),
      );
    }
  }