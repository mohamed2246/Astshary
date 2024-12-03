import 'dart:ui' as ui;

import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:astshary/Feachers/ReviewsScreen/Presentation/views/widgets/reviews_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../Core/utils/colors.dart';
import '../../../Core/utils/constant.dart';
import '../../../Core/widgets/expandaple_text.dart';
import '../../BookingConfirmScreen/Presentation/booking_confirm_screen.dart';
import 'dart:ui' as ui;

class ReviewsScreen extends StatefulWidget {
  int id ;

  ReviewsScreen(this.id);

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  bool is_heart_active = false;

  Future<void> _refresh() async {
    // Your refresh logic here. For example, you could reload data from a network or database.
    await Future.delayed(Duration(seconds: 1)); // Simulate a delay
    // Call setState if needed to update the UI after refresh.
    SpecialtiesCubit.get(context).fetchAllReviews(widget.id);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SpecialtiesCubit.get(context).fetchAllReviews(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: AppBar(
            leading: IconButton(
                iconSize: 24,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: RotatedBox(
                  quarterTurns: context.locale.languageCode == 'ar' ? 2 : 0,
                  child: SvgPicture.asset(
                    'assets/images/back_arrow (2).svg',
                    color: HexColor('#23262F'),
                  ),
                )),
            backgroundColor: whiteColor,
            centerTitle: true,
            title: Text(
              'Reviews'.tr(),
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontSize: itArabic ? 24 : 20, color: HexColor('#1E252D')),
            ),
            elevation: 0,
            /*actions: [
              IconButton(
                iconSize: 48,
                onPressed: () {},
                icon: Container(
                    padding: EdgeInsets.only(
                      right: 6,
                    ),
                    width: 60,
                    height: 60,
                    child: Center(
                        child: SvgPicture.asset(
                      'assets/images/Sort.svg',
                      fit: BoxFit.cover,
                    ))),
              )
            ],*/
          ),
        ),
      ),
      body: BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
        builder: (context, state) {
          var cubit = SpecialtiesCubit.get(context);
          return cubit.isAllReviewsLoading ?
          Center(
            child: Container(
              width: 57,
              height: 57,
              child: LoadingIndicator(
                indicatorType: Indicator.ballSpinFadeLoader,

                /// Required, The loading type of the widget
                colors: [
                  Theme.of(context).brightness == Brightness.dark
                      ? textformColor.withOpacity(0.9)
                      : HexColor('#1F2A37').withOpacity(0.9),
                  Theme.of(context).brightness == Brightness.dark
                      ? textformColor.withOpacity(0.9)
                      : HexColor('#1F2A37').withOpacity(0.9),
                  Theme.of(context).brightness == Brightness.dark
                      ? textformColor.withOpacity(0.8)
                      : HexColor('#1F2A37').withOpacity(0.8),
                  Theme.of(context).brightness == Brightness.dark
                      ? textformColor.withOpacity(0.7)
                      : HexColor('#1F2A37').withOpacity(0.7),
                  Theme.of(context).brightness == Brightness.dark
                      ? textformColor.withOpacity(0.6)
                      : HexColor('#1F2A37').withOpacity(0.6),
                  Theme.of(context).brightness == Brightness.dark
                      ? textformColor.withOpacity(0.5)
                      : HexColor('#1F2A37').withOpacity(0.5),
                  Theme.of(context).brightness == Brightness.dark
                      ? textformColor.withOpacity(0.4)
                      : HexColor('#1F2A37').withOpacity(0.4),
                  Theme.of(context).brightness == Brightness.dark
                      ? textformColor.withOpacity(0.3)
                      : HexColor('#1F2A37').withOpacity(0.3),
                  Theme.of(context).brightness == Brightness.dark
                      ? textformColor.withOpacity(0.2)
                      : HexColor('#1F2A37').withOpacity(0.2),
                  Theme.of(context).brightness == Brightness.dark
                      ? textformColor.withOpacity(0.1)
                      : HexColor('#1F2A37').withOpacity(0.1),
                  Theme.of(context).brightness == Brightness.dark
                      ? textformColor.withOpacity(0.05)
                      : HexColor('#1F2A37').withOpacity(0.05),
                  Theme.of(context).brightness == Brightness.dark
                      ? textformColor.withOpacity(0.01)
                      : HexColor('#1F2A37').withOpacity(0.01),
                ],

                /// Optional, The color collections
                strokeWidth: 2,

                /// Optional, The stroke of the line, only applicable to widget which contains line
                /* backgroundColor: Colors.black,      /// Optional, Background of the widget
                        pathBackgroundColor: Colors.black   /// Optional, the stroke backgroundColor*/
              ),
            ),
          ):
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: RefreshIndicator(
                  onRefresh: _refresh,
                  color: HexColor('#1F2A37').withOpacity(0.9),
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .020,
                          ),
                          RatingBarChart(
                            ratings: {
                              5: double.parse(cubit.allReviewsModel!.starPercentages!.i5!.toString())/100,
                              4: double.parse(cubit.allReviewsModel!.starPercentages!.i4!.toString())/100,
                              3:double.parse(cubit.allReviewsModel!.starPercentages!.i3!.toString())/100,
                              2: double.parse(cubit.allReviewsModel!.starPercentages!.i2!.toString())/100,
                              1: double.parse(cubit.allReviewsModel!.starPercentages!.i1!.toString())/100,
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .03,
                          ),
                          /*ReviewsCard(
                            imageUrl: 'assets/images/reviewPerson.png',
                            text: 'Mahmodul Hasan'.tr(),
                            time: '2 mins ago'.tr(),
                            review: 'The app'.tr(),
                          ),
                          ReviewsCard(
                            imageUrl: 'assets/images/person2.png',
                            text: 'Zoey Mitchell'.tr(),
                            time: '5 mins ago'.tr(),
                            review:
                                'MedSync offers a wide range of features for health tracking. From medication reminders to symptom tracking'
                                    .tr(),
                          ),
                          ReviewsCard(
                            imageUrl: 'assets/images/person4.png',
                            text: 'Oliver Hale'.tr(),
                            time: '48 mins ago'.tr(),
                            review:
                                'I was initially skeptical about using a telemedicine app but this app has exceeded my expectations. The doctors are highly qualified and provide excellent care.'
                                    .tr(),
                          ),
                          ReviewsCard(
                            imageUrl: 'assets/images/person2.png',
                            text: 'Mahmodul Hasan'.tr(),
                            time: '20 mins ago'.tr(),
                            review:
                                'I was initially skeptical about using a telemedicine app but this app has exceeded my expectations. The doctors are highly qualified and provide excellent care.'
                                    .tr(),
                          ),*/


                          ListView.builder(
                            itemCount:cubit.allReviewsModel!.reviews!.length,
                            physics:
                            NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return  Padding(
                                padding:
                                const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    _buildReviewList(index)
                                  ],
                                ),
                              );
                            },
                          ),


                          SizedBox(
                            height: 80,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRect(
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(sigmaX: .6, sigmaY: .6),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: HexColor('#2563EB'),
                            borderRadius: BorderRadius.circular(
                                16), // Border radius for the button
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle Create an Account
                              // navigateTo(context, OtpView('create')); // Implement navigation as needed
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.53),
                                    topRight: Radius.circular(30.53),
                                  ),
                                ),
                                builder: (context) => RatingBottomSheet(),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              // Transparent background
                              onPrimary: Colors.white,
                              // Text color
                              shadowColor: Colors.transparent,
                              // Remove shadow if any
                              minimumSize: Size(double.infinity, 65.h),
                              // Button size, using ScreenUtil for responsive sizing
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    fontFamily: itArabic
                                        ? 'Somar-Bold'
                                        : 'Gilroy-Bold', // Font family
                                    fontSize:
                                        itArabic ? 22 : 18.sp, // Font size
                                    fontWeight: FontWeight.w400, // Font weight
                                    height: 1.25, // Line height
                                  ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    16), // Border radius for the button
                              ),
                            ),
                            child: Text('Write An Review'.tr()),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildReviewList(index){
    return BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
      builder: (context, state) {
        var cubit =
        SpecialtiesCubit.get(
            context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize:
              MainAxisSize.min,
              children: [
                CircleAvatar(
                    radius: 22,
                    backgroundImage:
                    NetworkImage(cubit.allReviewsModel!.reviews![index].staticImage!)),
                SizedBox(width: 16),
                Column(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceEvenly,
                  crossAxisAlignment:
                  CrossAxisAlignment
                      .start,
                  mainAxisSize:
                  MainAxisSize.min,
                  children: [
                    Text(
                      cubit.allReviewsModel!.reviews![index].userName!,
                      style: Theme.of(
                          context)
                          .textTheme
                          .headline5!
                          .copyWith(
                          fontSize:
                          itArabic
                              ? 20
                              : 16,
                          fontWeight:
                          FontWeight
                              .w400,
                          fontFamily: itArabic
                              ? 'Somar-Bold'
                              : 'Gilroy-Bold',
                          color: HexColor(
                              '#23262F')),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .center,
                      children: [
                        RatingBarIndicator(
                          rating:double.parse(cubit.allReviewsModel!.reviews![index].rating!) ,
                          itemBuilder: (context,
                              index) =>
                              Container(
                                child:
                                SvgPicture
                                    .asset(
                                  'assets/images/magic-star.svg',
                                  fit: BoxFit
                                      .cover,
                                  // Replace with your actual SVG asset for the star
                                ),
                              ),
                          itemCount: 5,
                          itemSize: 16.0,
                          itemPadding:
                          EdgeInsets.only(
                              left:
                              4),
                          direction: Axis
                              .horizontal,
                        ),
                        Text(
                          itArabic ? cubit.allReviewsModel!.reviews![index].timeAgo! :
                          cubit.allReviewsModel!.reviews![index].timeAgoEn! ,
                          style: Theme.of(
                              context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                            fontSize:
                            itArabic
                                ? 18
                                : 14,
                            color: HexColor(
                                '#7B7D82'),
                            fontFamily: itArabic
                                ? 'Somar-Medium'
                                : 'Gilroy-Medium',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    child:
                    SvgPicture.asset(
                      'assets/images/menue.svg',
                      height: 15,
                      width: 4,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            ExpandableText(
              numOfLetters: 150,
              readMoreSize: 14,
              textColor:
              HexColor('#757575'),
              fontSize:
              itArabic ? 16 : 12,
              fontHeight: 1.6,
              text:cubit.allReviewsModel!.reviews![index].comment ==null ? '' :
              '${cubit.allReviewsModel!.reviews![index].comment!}'
                  .tr(),
              screenWidth:
              MediaQuery.of(context)
                  .size
                  .width,
            ),
            SizedBox(
              height:
              MediaQuery.of(context)
                  .size
                  .height *
                  .02,
            ),
            Divider(
                color:
                HexColor('#A7A2A280')
                    .withOpacity(.30),
                thickness: 1),
          ],
        );
      },
    );
  }
}

class RatingBarChart extends StatelessWidget {
  final int maxRating;
  final Map<int, double> ratings;

  const RatingBarChart({
    Key? key,
    this.maxRating = 5, // Maximum rating value, like 5 stars
    required this.ratings, // A map containing the rating as the key and its value as the width factor for the bar
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: HexColor('#F9FBFF')),
      child: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(maxRating, (index) {
                  int ratingValue = maxRating - index;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Row(
                      children: [
                        Text('$ratingValue',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    fontSize: itArabic ? 18 : 14,
                                    color: Color(0xFF1E252D))),
                        SizedBox(width: 4),
                        // Star Icon - you can use your own SVG or Icons
                        SvgPicture.asset(
                          'assets/images/magic-star.svg',
                          // Replace with your star SVG asset path
                          height: 20,
                        ),
                        // Rating bar
                        Expanded(
                          child: LinearPercentIndicator(
                              alignment: MainAxisAlignment.start,
                              barRadius: Radius.circular(4),
                              fillColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              animation: true,
                              lineHeight: 6.0,
                              animationDuration: 2000,
                              percent: ratings[ratingValue] ?? 0,
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Color(0xFF2563EB)),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                SpecialtiesCubit.get(context).allReviewsModel!.doctor!.averageRating! ,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontSize: itArabic ? 44 : 40,
                          color: HexColor('#23262F')),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    RatingBarIndicator(
                      rating: double.parse(SpecialtiesCubit.get(context).allReviewsModel!.doctor!.averageRating!.toString()),
                      itemBuilder: (context, index) => Container(
                        child: SvgPicture.asset(
                          'assets/images/magic-star.svg',
                          fit: BoxFit.cover,
                          // Replace with your actual SVG asset for the star
                        ),
                      ),
                      itemCount: 5,
                      itemSize: 16.0,
                      unratedColor: HexColor('#E9E9EA'),
                      itemPadding: EdgeInsets.only(left: 4),
                      direction: Axis.horizontal,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .01,
                    ),
                    Text(
                      '${SpecialtiesCubit.get(context).allReviewsModel!.doctor!.reviewCount} ' + 'Reviews'.tr() ,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontSize: itArabic ? 18 : 14,
                          color: HexColor('#23262F')),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
