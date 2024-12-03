import 'package:astshary/Core/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../../../Feachers/ChooseCityScreen/Presentation/view_models/specialties_cubit/specialties_cubit.dart';

class SharedPreferencesService {
  static const String onboardingKey = 'onboardingSeen';
  static const String nameKey = 'name';
  static const String phoneKey = 'phone';
  static const String imageKey = 'image';
  static const String patientId = '';
  Future<void> setOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(onboardingKey, true);
  }

  Future<bool> getOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(onboardingKey) ?? false;
  }


  Future<void> setName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(nameKey, name);
  }

  Future<String?> getName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(nameKey);
  }



  Future<void> setImage(String image) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(imageKey, image);
  }

  Future<String?> getImage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(imageKey);
  }



  Future<void> setPhone(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(phoneKey, phone);
  }

  Future<String?> getPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(phoneKey);
  }

Future<void> setpatientId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(patientId, id);
  }

  Future<String?> getpatientId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(patientId);
  }

  Future<void> logout(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(nameKey).then((value) async {
      await prefs.remove(phoneKey).then((value) async {
        await prefs.remove(imageKey).then((value) async {
          await prefs.remove(patientId).then((value){
            patientIdLocal = "";

            SpecialtiesCubit.get(context).Refresh();


            Navigator.of(context).pop(); // Dismiss the dialog and log out the user
          });

        });


      });
    });




  }



}

