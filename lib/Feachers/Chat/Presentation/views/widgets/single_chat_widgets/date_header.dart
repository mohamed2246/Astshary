import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:intl/intl.dart'; // Import the intl package

class DateHeader extends StatelessWidget {
  final String date;

  const DateHeader({Key? key, required this.date}) : super(key: key);

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString); // Parse the string into a DateTime object
    return DateFormat('MMMM d, yyyy').format(dateTime); // Format the date as "September 17, 2024"
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      color: HexColor('#F4F6F9'),
      child: Text(
        formatDate(date), // Call the formatDate function
        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
      ),
    );
  }
}
