import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../utils/constant.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final double screenWidth;
  double fontSize = itArabic ? 18 : 14;
  double readMoreSize = itArabic ? 18 : 14;
  int numOfLetters = 100;
  double fontHeight = 14;
  Color textColor = Colors.black;

  ExpandableText(
      {Key? key,
      required this.text,
      required this.screenWidth,
      required this.fontHeight,
      required this.fontSize,
      required this.numOfLetters,
      required this.readMoreSize,
      required this.textColor})
      : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;
  late final String firstPartText;
  late final String secondPartText;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > widget.numOfLetters) {
      firstPartText = widget.text.substring(0, widget.numOfLetters);
      secondPartText = widget.text.substring(widget.numOfLetters);
    } else {
      firstPartText = widget.text;
      secondPartText = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle defaultTextStyle = Theme.of(context)
        .textTheme
        .bodyText2!
        .copyWith(
            fontSize: widget.fontSize,
            color: widget.textColor,
            height: widget.fontHeight);
    final TextStyle linkTextStyle = Theme.of(context)
        .textTheme
        .bodyText2!
        .copyWith(
            fontSize: widget.readMoreSize,
            decoration: TextDecoration.underline,
            color: HexColor('#2563EB'));

    return BlocConsumer<SpecialtiesCubit, SpecialtiesState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is chooseBranchState) {
          setState(() {});
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: isExpanded ? widget.text : firstPartText,
                    style: defaultTextStyle,
                  ),
                  if (!isExpanded && widget.text.length > widget.numOfLetters)
                    TextSpan(
                      text: '...',
                    ),
                  TextSpan(
                    text: isExpanded
                        ? 'View Less'.tr()
                        : secondPartText.isEmpty
                            ? ''
                            : 'Read more'.tr(),
                    style: linkTextStyle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
