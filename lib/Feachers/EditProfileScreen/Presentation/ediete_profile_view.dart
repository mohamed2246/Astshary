import 'dart:convert';
import 'dart:io';

import 'package:astshary/Core/utils/remote/local.dart';
import 'package:astshary/Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';
import 'package:astshary/Feachers/DoctorDetailsScreen/Presentation/views/widgets/doctor_details_card.dart';
import 'package:astshary/Feachers/ReviewsScreen/Presentation/reviews_screen.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:ui' as ui;

import '../../../../Core/utils/colors.dart';
import '../../../../Core/utils/component.dart';
import '../../../../Core/widgets/appbar.dart';
import '../../../../Core/widgets/expandaple_text.dart';
import '../../../Core/utils/constant.dart';
import '../../RescheduleScreen/Presentation/views/rescadual_view.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {


  @override
  void initState() {
    // TODO: implement initState
    getImageFromShared();
    super.initState();

  }
  String? imageUrlFromSHARED ;


  void getImageFromShared() async {
    var shared = await SharedPreferencesService();
    String? imageFromSHARED = await shared.getImage();
    setState(() {
      imageUrlFromSHARED = imageFromSHARED;
      if (imageUrlFromSHARED != null && imageUrlFromSHARED != 'null'&&imageUrlFromSHARED != '') {
        _profileImage = NetworkImage(imageUrlFromSHARED!);
      } else {
        _profileImage = AssetImage('assets/images/profile_image.png');
      }
    });
  }


  Future<void> _refresh() async {
    // Your refresh logic here. For example, you could reload data from a network or database.
    await Future.delayed(Duration(seconds: 1)); // Simulate a delay
    SpecialtiesCubit.get(context).postLoginProfileApiFromSharedPref(context);
    SpecialtiesCubit.get(context).loadDataSharePref();

    // Call setState if needed to update the UI after refresh.
  }
  ImageProvider<Object> _profileImage = AssetImage('assets/images/profile_image.png');
  Future<void> pickImageFromGallery(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      String base64Image = await convertImageToBase64(pickedFile);
      await SpecialtiesCubit.get(context).updateImageClient(base64Image); // Upload the image
      setState(() {
        _profileImage = FileImage(File(pickedFile.path)); // Update the displayed image
        SpecialtiesCubit.get(context).postLoginProfileApiFromSharedPref(context);
        SpecialtiesCubit.get(context).loadDataSharePref();
      });
    } else {
      debugPrint('No image selected.');
    }
  }

  Future<bool> checkAndRequestPermissions() async {
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      int sdkInt = androidInfo.version.sdkInt;

      if (sdkInt >= 33) {
        // For Android 13 and above, request READ_MEDIA_IMAGES
        PermissionStatus mediaImagesPermission = await Permission.photos.request();
        return mediaImagesPermission.isGranted;
      } else {
        // For Android versions below 13, request READ_EXTERNAL_STORAGE
        PermissionStatus storagePermission = await Permission.storage.request();
        return storagePermission.isGranted;
      }
    } else {
      // Handle permissions for other platforms if needed
      return false;
    }
  }

  Future<String> convertImageToBase64(XFile imageFile) async {
    final bytes = await File(imageFile.path).readAsBytes();
    String base64Image = base64Encode(bytes);
    return 'data:image/jpeg;base64,$base64Image'; // Add the prefix here
  }

  void showPermissionDeniedSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Permission Denied')),
    );
  }



  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * .1;
    var hieght = MediaQuery.of(context).size.height * .1;
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
                  quarterTurns: context.locale.languageCode == 'ar'
                      ?2:0,
                  child: SvgPicture.asset(
                    'assets/images/back_arrow (2).svg',
                    color: HexColor('#23262F'),
                  ),
                )),
            backgroundColor: whiteColor,
            centerTitle: true,
            title: Text(
              'Edit Profile'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: itArabic ? 24 :20, color: HexColor('#1E252D')),
            ),
            elevation: 0,
          ),
        ),
      ),
      body: BlocBuilder<SpecialtiesCubit, SpecialtiesState>(
  builder: (context, state) {
    var cubit = SpecialtiesCubit.get(context);
    return cubit.loadingButtonLoginProfile? Center(
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
    ) :  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: LayoutBuilder(
            builder: (context,constraints) {
              return RefreshIndicator(
                onRefresh: _refresh,
                color: mainColor,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(

                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .020,
                          ),
                          /*Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: width * 2.4,
                                height: width * 2.4,
                              ),
                              Container(
                                width: width * 2.9,
                                height: width * 2.9,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/images/profile_image.png'),
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 6,
                                  right: 0,
                                  child: SvgPicture.asset(
                                    'assets/images/camera2.svg',
                                    width: 32,
                                    height: 32,
                                  ))
                            ],
                          ),*/

/*
                          InkWell(
                            onTap: () async {
                             await pickImageFromGallery(context);
                             setState(() {

                             });
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: width * 2.4,
                                  height: width * 2.4,
                                ),
                                Container(
                                  width: width * 2.9,
                                  height: width * 2.9,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(
                                        imageUrlFromSHARED!,
                                    )),
                                  ),
                                ),
                                Positioned(
                                  bottom: 6,
                                  right: 0,
                                  child: SvgPicture.asset(
                                    'assets/images/camera2.svg',
                                    width: 32,
                                    height: 32,
                                  ),
                                ),
                              ],
                            ),
                          ),
*/
                          InkWell(
                            onTap: () async {
                              await pickImageFromGallery(context);
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: width * 2.4,
                                  height: width * 2.4,
                                ),
                                Container(
                                  width: width * 2.9,
                                  height: width * 2.9,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: _profileImage,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 6,
                                  right: 0,
                                  child: SvgPicture.asset(
                                    'assets/images/camera2.svg',
                                    width: 32,
                                    height: 32,
                                  ),
                                ),
                              ],
                            ),
                          ),


                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * .020,
                                ),
                                Text(
                                  'Full Name'.tr(),
                                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize:itArabic ? 18 : 14,
                                      fontWeight: FontWeight.w400,
                                      color: HexColor('#7B7D82')),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * .026,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20  , right: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context).brightness == Brightness.dark
                                            ? blackColor
                                            : HexColor('#E5E7EB')),
                                    color: Theme.of(context).brightness == Brightness.dark
                                        ? blackColor
                                        : textformColor,
                                    // Background color for the TextField
                                    borderRadius:
                                    BorderRadius.circular(16), // Adjust the corner radius
                                  ),
                                  child: TextField(

                                    controller: cubit.fullnameControllerEdiete,
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize:itArabic ? 20 :16,
                                      color: HexColor('#23262F'),
                                    ),
                                    decoration: InputDecoration(
                                      hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                                        fontSize: itArabic ? 18 :14,
                                        color: HexColor('#1E252D').withOpacity(.60),

                                      ),
                                      prefixIcon: IconButton(
                                        icon: SvgPicture.asset( 'assets/images/person_c.svg',),
                                        iconSize: 18,
                                        onPressed: () {},
                                      ),
                                      hintText: 'Your Name'.tr(),

                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                                      // Vertical padding for the TextField
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * .026,
                                ),


                                Text(
                                  'Phone'.tr(),
                                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: itArabic ? 18 :14,
                                      fontWeight: FontWeight.w400,
                                      color: HexColor('#7B7D82')),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * .024,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 6),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context).brightness == Brightness.dark
                                            ? blackColor
                                            : HexColor('#E5E7EB')),
                                    color: Theme.of(context).brightness == Brightness.dark
                                        ? blackColor
                                        : textformColor,
                                    // Background color for the TextField
                                    borderRadius:
                                    BorderRadius.circular(16), // Adjust the corner radius
                                  ),
                                  child: TextField(
                                    controller:cubit.PhoneControllerEdiete ,


                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize:itArabic ? 19 :15,
                                      color: HexColor('#23262F'),
                                    ),                      decoration: InputDecoration(
                                    prefixIcon: IconButton(
                                      icon: SvgPicture.asset('assets/images/phone-call.svg'),
                                      iconSize: 18,
                                      onPressed: () {},
                                    ),
                                    hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize:itArabic ? 18 : 14,
                                      color: HexColor('#1E252D').withOpacity(.60),

                                    ),
                                    hintText: 'Phone'.tr(),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(vertical: 15 , horizontal: 0),
                                    // Vertical padding for the TextField
                                  ),
                                  ),
                                ),



                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .024,
                          ),
                          ClipRect(
                            child: BackdropFilter(
                              filter: ui.ImageFilter.blur(sigmaX: .6, sigmaY: .6),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: HexColor('#2563EB'),
                                  borderRadius: BorderRadius.circular(
                                      16), // Border radius for the gradient
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle Create an Account
                                    // navigateTo(context, OtpView('create')); // Implement navigation as needed

                                   cubit.postEdieteProfileApi(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    onPrimary: Colors.white,
                                    // Text color
                                    shadowColor: Colors.transparent,
                                    // Remove shadow if any
                                    minimumSize: Size(double.infinity, 65.h),
                                    // Button size, using ScreenUtil for responsive sizing
                                    textStyle:
                                    Theme.of(context).textTheme.headline6!.copyWith(
                                      fontFamily: itArabic ? 'Somar-Bold' : 'Gilroy-Bold', // Font family
                                      fontSize:itArabic ? 22 : 18.sp, // Font size
                                      fontWeight: FontWeight.w400, // Font weight
                                      height: 1.25, // Line height
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          16), // Border radius for the button
                                    ),
                                  ),
                                  child: Text('Save changes'.tr()),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
        ),
      );
  },
),
    );
  }
}

class GenderSelectWidget extends StatefulWidget {
  @override
  _GenderSelectWidgetState createState() => _GenderSelectWidgetState();
}
class _GenderSelectWidgetState extends State<GenderSelectWidget> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        border: Border.all(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.black
                : HexColor('#E5E7EB')),
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : HexColor('#F9FAFB'), // Adjusted to use background color
        borderRadius: BorderRadius.circular(16),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedGender,
          style: Theme.of(context).textTheme.headline1,
          icon: Icon(Icons.arrow_drop_down, color: HexColor('#1E252D').withOpacity(0.60)),
          onChanged: (String? newValue) {
            setState(() {
              _selectedGender = newValue;
            });
          },
          items: <String>['Male'.tr(), 'Female'.tr()]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize:itArabic ? 19 :15,
                color: HexColor('#23262F'),
              ),),
            );
          }).toList(),
          hint: Text(
            'Gender'.tr(),
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize:itArabic ? 18 : 14,
              color: HexColor('#1E252D').withOpacity(0.60),
            ),
          ),
        ),
      ),
    );
  }
}