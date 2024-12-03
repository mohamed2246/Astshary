import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../utils/constant.dart';

class ExpandableTextClinic extends StatefulWidget {
  @override
  _ExpandableTextClinicState createState() => _ExpandableTextClinicState();
}

class _ExpandableTextClinicState extends State<ExpandableTextClinic> {
  @override
  void initState() {
    super.initState();
    SpecialtiesCubit.get(context).assignAboutText();
    SpecialtiesCubit.get(context).atFirstExpandableText(context);
/*
    SpecialtiesCubit.get(context).ChangeTheStyleExpandable(context);
*/
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SpecialtiesCubit, SpecialtiesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = SpecialtiesCubit.get(context);
        cubit.defaultTextStyle = Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(
                fontSize: cubit.fontSize,
                color: cubit.textColor,
                height: cubit.fontHeight);
        cubit.linkTextStyle = Theme.of(context).textTheme.bodyText2!.copyWith(
            fontSize: cubit.readMoreSize,
            decoration: TextDecoration.underline,
            color: HexColor('#2563EB'));

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            !itArabic
                ? RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: cubit.isExpanded
                              ? cubit.textEn
                              : cubit.firstPartTextEn,
                          style: cubit.defaultTextStyle,
                        ),
                        if (cubit.isExpanded &&
                            cubit.textEn!.length > cubit.numOfLetters)
                          TextSpan(
                            text: '...',
                          ),
                        TextSpan(
                          text: cubit.isExpanded
                              ? "View Less".tr()
                              : cubit.secondPartTextEn.isEmpty
                                  ? ''
                                  : "Read more".tr(),
                          style: cubit.linkTextStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              cubit.refreshExpandable();
                            },
                        ),
                      ],
                    ),
                  )
                : RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: cubit.isExpanded
                              ? cubit.text
                              : cubit.firstPartText,
                          style: cubit.defaultTextStyle,
                        ),
                        if (cubit.isExpanded &&
                            cubit.text!.length > cubit.numOfLetters)
                          TextSpan(
                            text: '...',
                          ),
                        TextSpan(
                          text: cubit.isExpanded
                              ? "View Less".tr()
                              : cubit.secondPartText.isEmpty
                                  ? ''
                                  :"Read more".tr(),
                          style: cubit.linkTextStyle,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              cubit.refreshExpandable();
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
