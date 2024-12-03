// EnterpriseClinic_model.dart

import 'dart:convert';

class EnterpriseClinic {
  final int id;
  var userId;
  var typeAr;
  var typeEn;
  var nameAr;
  var nameEn;
  var cityId;
  var areaId;
  var locationFeatureIds;
  var insuranceIds;
  var logo;
  var specialMarkAr;
  final String? specialMarkEn;
  final List<String> papersLicenses;
  var location;
  var addressAr;
  var addressEn;
  var tax;
  var registrationNo;
  var sms;
  var phone;
  var about;
  var aboutEn;
  var time;
  final List<String>? gallery;
  final bool hasLab;
  final bool hasRadiology;
  var year;
  var status;
  var email;
  var password;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Pivot pivot;

  EnterpriseClinic({
    required this.id,
    required this.userId,
    required this.typeAr,
    required this.typeEn,
    required this.nameAr,
    required this.nameEn,
    required this.cityId,
    required this.areaId,
    this.locationFeatureIds,
    this.insuranceIds,
    required this.logo,
    this.specialMarkAr,
    this.specialMarkEn,
    required this.papersLicenses,
    this.location,
    required this.addressAr,
    required this.addressEn,
    this.tax,
    this.registrationNo,
    required this.sms,
    required this.phone,
    this.about,
    this.aboutEn,
    this.time,
    this.gallery,
    required this.hasLab,
    required this.hasRadiology,
    this.year,
    required this.status,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory EnterpriseClinic.fromJson(Map<String, dynamic> json) {
    return EnterpriseClinic(
      id: json['id'],
      userId: json['user_id'],
      typeAr: json['type_ar'],
      typeEn: json['type_en'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      cityId: json['city_id'],
      areaId: json['area_id'],
      locationFeatureIds: json['location_feature_ids'],
      insuranceIds: json['insurance_ids'],
      logo: json['logo'],
      specialMarkAr: json['special_mark_ar'],
      specialMarkEn: json['special_mark_en'],
      papersLicenses: List<String>.from(jsonDecode(json['papers_licenses'])),
      location: json['location'],
      addressAr: json['address_ar'],
      addressEn: json['address_en'],
      tax: json['tax'],
      registrationNo: json['registration_no'],
      sms: json['sms'],
      phone: json['phone'],
      about: json['about'],
      aboutEn: json['about_en'],
      time: json['time'],
      gallery: json['gallery'] != null
          ? List<String>.from(jsonDecode(json['gallery']))
          : null,
      hasLab: json['has_lab'].toString().toLowerCase() == 'true',
      hasRadiology:
      json['has_radiology'].toString().toLowerCase() == 'true',
      year: json['year'],
      status: json['status'],
      email: json['email'],
      password: json['password'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      pivot: Pivot.fromJson(json['pivot']),
    );
  }
}

class Pivot {
  var doctorId;
  var EnterpriseClinicId;

  Pivot({required this.doctorId, required this.EnterpriseClinicId});

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      doctorId: json['doctor_id'],
      EnterpriseClinicId: json['EnterpriseClinic_id'],
    );
  }
}
