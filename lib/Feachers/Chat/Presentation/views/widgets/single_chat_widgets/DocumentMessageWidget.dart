import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../Core/utils/colors.dart';
import '../../../../Data/Models/document_info.dart';
import 'base_message_widget.dart';

class DocumentMessageWidget extends StatelessWidget {
  final DocumentInfo document;
  final bool isSender;
  final bool isLastMesaage;
  final String time;

  const DocumentMessageWidget({
    Key? key,
    required this.document,
    required this.time,
    required this.isSender,
    required this.isLastMesaage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData _getIconForType(String type) {
      switch (type.toLowerCase()) {
        case 'pdf':
          return Icons.picture_as_pdf;
        case 'doc':
        case 'docx':
          return Icons.description;
        case 'xlsx':
        case 'xls':
          return Icons.table_chart;
        case 'ppt':
        case 'pptx':
          return Icons.present_to_all;
        case 'txt':
          return Icons.text_snippet;
        case 'apk':
          return Icons.android;
        case 'zip':
        case 'rar':
          return Icons.archive;
        case 'html':
        case 'htm':
          return Icons.web;
        default:
          return Icons.insert_drive_file;
      }
    }


    return BaseMessageWidget(
      isSender: isSender,
      isLastMesaage: isLastMesaage,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_getIconForType(document.type), size: 40 , color: isSender ? blackColor : receiverTextColor),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  document.name,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: isSender ? blackColor : receiverTextColor,
                    fontFamily: 'Inter-Medium',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5),
                Text(
                  document.type.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: isSender ? blackColor : receiverTextColor,
                    fontFamily: 'Inter-Medium',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
/*
          IconButton(
            icon: Icon(Icons.download , color:isSender ? blackColor : receiverTextColor,
            ),
            onPressed: () => _downloadDocument(document.url),
          ),
*/
        ],
      ),
    );
  }

  void _downloadDocument(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle the error or show a message indicating that the URL could not be opened.
      print('Could not launch $url');
    }
  }







}
