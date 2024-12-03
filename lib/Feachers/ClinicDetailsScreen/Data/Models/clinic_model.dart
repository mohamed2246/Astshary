/*

import 'dart:convert';

EnterpriseResponse enterpriseResponseFromJson(String str) => EnterpriseResponse.fromJson(json.decode(str));

class EnterpriseResponse {
  Enterprise enterprise;
  List<dynamic> enterpriseSchedules;
  List<LocationFeature> locationFeatures;
  List<Insurance> insurances;
  List<Branch> branches;
  List<Specialization> specializations;
  var patientsCount;
  List<Review> reviews;
  var reviewCount;
  double averageRating;
  var status;

  EnterpriseResponse({
    required this.enterprise,
    required this.enterpriseSchedules,
    required this.locationFeatures,
    required this.insurances,
    required this.branches,
    required this.specializations,
    required this.patientsCount,
    required this.reviews,
    required this.reviewCount,
    required this.averageRating,
    required this.status,
  });

  factory EnterpriseResponse.fromJson(Map<String, dynamic> json) => EnterpriseResponse(
    enterprise: Enterprise.fromJson(json['enterprise']),
    enterpriseSchedules: json['enterprise_schedules'] != null ? List<dynamic>.from(json['enterprise_schedules']) : [],
    locationFeatures: json['locationFeatures'] != null ? List<LocationFeature>.from(json['locationFeatures'].map((x) => LocationFeature.fromJson(x))) : [],
    insurances: json['insurances'] != null ? List<Insurance>.from(json['insurances'].map((x) => Insurance.fromJson(x))) : [],
    branches: json['branches'] != null ? List<Branch>.from(json['branches'].map((x) => Branch.fromJson(x))) : [],
    specializations: json['specializations'] != null ? List<Specialization>.from(json['specializations'].map((x) => Specialization.fromJson(x))) : [],
    patientsCount: json['patients_count'] ?? 0,
    reviews: json['reviews'] != null ? List<Review>.from(json['reviews'].map((x) => Review.fromJson(x))) : [],
    reviewCount: json['reviewCount'] ?? 0,
    averageRating: json['averageRating'] != null ? double.parse(json['averageRating'].toString()) : 0.0,
    status: json['status'] ?? 0,
  );
}

class Enterprise {
  var id;
  String typeAr;
  String typeEn;
  String nameAr;
  String nameEn;
  var cityId;
  var areaId;
  List<dynamic> locationFeatureIds;
  String logo;
  String specialMarkAr;
  String specialMarkEn;
  List<dynamic> papersLicenses;
  String location;
  String tax;
  String registrationNo;
  String sms;
  String phone;
  String about;
  dynamic time;
  List<dynamic> gallery;
  bool hasLab;
  bool hasRadiology;
  String year;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  var doctorCount;
  var specializationCount;
  City city;
  Area area;
  List<Doctor> doctors;

  Enterprise({
    required this.id,
    required this.typeAr,
    required this.typeEn,
    required this.nameAr,
    required this.nameEn,
    required this.cityId,
    required this.areaId,
    required this.locationFeatureIds,
    required this.logo,
    required this.specialMarkAr,
    required this.specialMarkEn,
    required this.papersLicenses,
    required this.location,
    required this.tax,
    required this.registrationNo,
    required this.sms,
    required this.phone,
    required this.about,
    this.time,
    required this.gallery,
    required this.hasLab,
    required this.hasRadiology,
    required this.year,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.doctorCount,
    required this.specializationCount,
    required this.city,
    required this.area,
    required this.doctors,
  });

  factory Enterprise.fromJson(Map<String, dynamic> json) => Enterprise(
    id: json['id'] ?? 0,
    typeAr: json['type_ar'] ?? '',
    typeEn: json['type_en'] ?? '',
    nameAr: json['name_ar'] ?? '',
    nameEn: json['name_en'] ?? '',
    cityId: json['city_id'] ?? 0,
    areaId: json['area_id'] ?? 0,
    locationFeatureIds: json['location_feature_ids'] != null ? List<dynamic>.from(json['location_feature_ids']) : [],
    logo: json['logo'] ?? '',
    specialMarkAr: json['special_mark_ar'] ?? '',
    specialMarkEn: json['special_mark_en'] ?? '',
    papersLicenses: json['papers_licenses'] != null ? List<dynamic>.from(jsonDecode(json['papers_licenses'])) : [],
    location: json['location'] ?? '',
    tax: json['tax'] ?? '',
    registrationNo: json['registration_no'] ?? '',
    sms: json['sms'] ?? '',
    phone: json['phone'] ?? '',
    about: json['about'] ?? '',
    time: json['time'],
    gallery: json['gallery'] != null ? List<dynamic>.from(jsonDecode(json['gallery'])) : [],
    hasLab: json['has_lab'] == "true",
    hasRadiology: json['has_radiology'] == "true",
    year: json['year'] ?? '',
    status: json['status'] ?? '',
    createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
    doctorCount: json['doctor_count'] ?? 0,
    specializationCount: json['specialization_count'] ?? 0,
    city: City.fromJson(json['city'] ?? {}),
    area: Area.fromJson(json['area'] ?? {}),
    doctors: json['doctors'] != null ? List<Doctor>.from(json['doctors'].map((x) => Doctor.fromJson(x))) : [],
  );
}

class Area {
  var id;
  String nameAr;
  String nameEn;
  var cityId;
  DateTime createdAt;
  DateTime updatedAt;

  Area({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.cityId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Area.fromJson(Map<String, dynamic> json) => Area(
    id: json['id'] ?? 0,
    nameAr: json['name_ar'] ?? '',
    nameEn: json['name_en'] ?? '',
    cityId: json['city_id'] ?? 0,
    createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
  );
}

class Branch {
  var id;
  var enterpriseId;
  String typeAr;
  String typeEn;
  String nameAr;
  String nameEn;
  var cityId;
  var areaId;
  List<dynamic> locationFeatureIds;
  List<dynamic> insuranceIds;
  String logo;
  String specialMarkAr;
  String specialMarkEn;
  List<dynamic> papersLicenses;
  String location;
  String tax;
  String registrationNo;
  String sms;
  String phone;
  String about;
  String aboutEn;
  dynamic time;
  List<dynamic> gallery;
  bool hasLab;
  bool hasRadiology;
  String year;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> schedules;
  City city;
  Area area;
  List<LocationFeature> locationFeatures;
  List<Insurance> insurances;
  var reviewCount;
  double averageRating;
  var doctorsCount;
  List<Specialization> specializations;
  var specializationsCount;
  var staticPatientCount;

  Branch({
    required this.id,
    required this.enterpriseId,
    required this.typeAr,
    required this.typeEn,
    required this.nameAr,
    required this.nameEn,
    required this.cityId,
    required this.areaId,
    required this.locationFeatureIds,
    required this.insuranceIds,
    required this.logo,
    required this.aboutEn,
    required this.specialMarkAr,
    required this.specialMarkEn,
    required this.papersLicenses,
    required this.location,
    required this.tax,
    required this.registrationNo,
    required this.sms,
    required this.phone,
    this.about = '',
    this.time,
    required this.gallery,
    required this.hasLab,
    required this.hasRadiology,
    required this.year,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.schedules,
    required this.city,
    required this.area,
    required this.locationFeatures,
    required this.insurances,
    required this.reviewCount,
    required this.averageRating,
    required this.doctorsCount,
    required this.specializations,
    required this.specializationsCount,
    required this.staticPatientCount,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    id: json['id'] ?? 0,
    enterpriseId: json['enterprise_id'] ?? 0,
    typeAr: json['type_ar'] ?? '',
    typeEn: json['type_en'] ?? '',
    nameAr: json['name_ar'] ?? '',
    nameEn: json['name_en'] ?? '',
    cityId: json['city_id'] ?? 0,
    areaId: json['area_id'] ?? 0,
    locationFeatureIds: json['location_feature_ids'] != null ? List<dynamic>.from(json['location_feature_ids']) : [],
    insuranceIds: json['insurance_ids'] != null ? List<dynamic>.from(json['insurance_ids']) : [],
    logo: json['logo'] ?? '',
    specialMarkAr: json['special_mark_ar'] ?? '',
    specialMarkEn: json['special_mark_en'] ?? '',
    papersLicenses: json['papers_licenses'] != null ? List<dynamic>.from(jsonDecode(json['papers_licenses'])) : [],
    location: json['location'] ?? '',
    tax: json['tax'] ?? '',
    registrationNo: json['registration_no'] ?? '',
    sms: json['sms'] ?? '',
    phone: json['phone'] ?? '',
    aboutEn: json['about_en'] ?? '',
    about: json['about'] ?? '',
    time: json['time'],
    gallery: json['gallery'] != null ? List<dynamic>.from(jsonDecode(json['gallery'])) : [],
    hasLab: json['has_lab'] == "true",
    hasRadiology: json['has_radiology'] == "true",
    year: json['year'] ?? '',
    status: json['status'] ?? '',
    createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
    schedules: json['schedules'] != null ? List<dynamic>.from(json['schedules']) : [],
    city: City.fromJson(json['city'] ?? {}),
    area: Area.fromJson(json['area'] ?? {}),
    locationFeatures: json['locationFeatures'] != null ? List<LocationFeature>.from(json['locationFeatures'].map((x) => LocationFeature.fromJson(x))) : [],
    insurances: json['insurances'] != null ? List<Insurance>.from(json['insurances'].map((x) => Insurance.fromJson(x))) : [],
    reviewCount: json['reviewCount'] ?? 0,
    averageRating: json['averageRating'] != null ? double.parse(json['averageRating'].toString()) : 0.0,
    doctorsCount: json['doctorsCount'] ?? 0,
    specializations: json['specializations'] != null ? List<Specialization>.from(json['specializations'].map((x) => Specialization.fromJson(x))) : [],
    specializationsCount: json['specializationsCount'] ?? 0,
    staticPatientCount: json['staticPatientCount'] ?? 0,
  );
}

class City {
  var id;
  String categoryAr;
  String categoryEn;
  String nameAr;
  String nameEn;
  DateTime createdAt;
  DateTime updatedAt;

  City({
    required this.id,
    required this.categoryAr,
    required this.categoryEn,
    required this.nameAr,
    required this.nameEn,
    required this.createdAt,
    required this.updatedAt,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json['id'] ?? 0,
    categoryAr: json['category_ar'] ?? '',
    categoryEn: json['category_en'] ?? '',
    nameAr: json['name_ar'] ?? '',
    nameEn: json['name_en'] ?? '',
    createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
  );
}

class Doctor {
  var id;
  var enterpriseId;
  String img;
  String nameAr;
  String nameEn;
  String lastNameAr;
  String lastNameEn;
  String email;
  String mobile;
  String gender;
  String graduationYear;
  String idNumber;
  String children;
  String adults;
  var maxConsultationsPerDay;
  List<dynamic> specializationIds;
  List<dynamic> additionalSpecializationIds;
  List<dynamic> serviceIds;
  String jobTitleAr;
  String jobTitleEn;
  String additionalJobTitleAr;
  String additionalJobTitleEn;
  List<dynamic> papers;
  List<dynamic> certificates;
  String certificateAr;
  String certificateEn;
  String aboutAr;
  String aboutEn;
  double price;
  List<dynamic> insuranceIds;
  List<dynamic> branchIds;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Doctor({
    required this.id,
    required this.enterpriseId,
    required this.img,
    required this.nameAr,
    required this.nameEn,
    required this.lastNameAr,
    required this.lastNameEn,
    required this.email,
    required this.mobile,
    required this.gender,
    required this.graduationYear,
    required this.idNumber,
    required this.children,
    required this.adults,
    required this.maxConsultationsPerDay,
    required this.specializationIds,
    required this.additionalSpecializationIds,
    required this.serviceIds,
    required this.jobTitleAr,
    required this.jobTitleEn,
    required this.additionalJobTitleAr,
    required this.additionalJobTitleEn,
    required this.papers,
    required this.certificates,
    required this.certificateAr,
    required this.certificateEn,
    required this.aboutAr,
    required this.aboutEn,
    required this.price,
    required this.insuranceIds,
    required this.branchIds,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json['id'] ?? 0,
    enterpriseId: json['enterprise_id'] ?? 0,
    img: json['img'] ?? '',
    nameAr: json['name_ar'] ?? '',
    nameEn: json['name_en'] ?? '',
    lastNameAr: json['last_name_ar'] ?? '',
    lastNameEn: json['last_name_en'] ?? '',
    email: json['email'] ?? '',
    mobile: json['mobile'] ?? '',
    gender: json['gender'] ?? '',
    graduationYear: json['graduation_year'] ?? '',
    idNumber: json['id_number'] ?? '',
    children: json['children'] ?? '',
    adults: json['adults'] ?? '',
    maxConsultationsPerDay: json['max_consultations_per_day'] ?? 0,
    specializationIds: json['specialization_ids'] != null ? List<dynamic>.from(json['specialization_ids']) : [],
    additionalSpecializationIds: json['additional_specialization_ids'] != null ? List<dynamic>.from(json['additional_specialization_ids']) : [],
    serviceIds: json['service_ids'] != null ? List<dynamic>.from(json['service_ids']) : [],
    jobTitleAr: json['job_title_ar'] ?? '',
    jobTitleEn: json['job_title_en'] ?? '',
    additionalJobTitleAr: json['additional_job_title_ar'] ?? '',
    additionalJobTitleEn: json['additional_job_title_en'] ?? '',
    papers: json['papers'] != null ? List<dynamic>.from(jsonDecode(json['papers'])) : [],
    certificates: json['certificates'] != null ? List<dynamic>.from(jsonDecode(json['certificates'])) : [],
    certificateAr: json['certificate_ar'] ?? '',
    certificateEn: json['certificate_en'] ?? '',
    aboutAr: json['about_ar'] ?? '',
    aboutEn: json['about_en'] ?? '',
    price: json['price'] != null ? double.parse(json['price'].toString()) : 0.0,
    insuranceIds: json['insurance_ids'] != null ? List<dynamic>.from(json['insurance_ids']) : [],
    branchIds: json['branch_ids'] != null ? List<dynamic>.from(json['branch_ids']) : [],
    status: json['status'] ?? '',
    createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
  );
}

class Insurance {
  var id;
  String nameAr;
  String nameEn;
  DateTime createdAt;
  DateTime updatedAt;

  Insurance({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Insurance.fromJson(Map<String, dynamic> json) => Insurance(
    id: json['id'] ?? 0,
    nameAr: json['name_ar'] ?? '',
    nameEn: json['name_en'] ?? '',
    createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
  );
}

class LocationFeature {
  var id;
  String nameAr;
  String nameEn;
  DateTime createdAt;
  DateTime updatedAt;

  LocationFeature({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LocationFeature.fromJson(Map<String, dynamic> json) => LocationFeature(
    id: json['id'] ?? 0,
    nameAr: json['name_ar'] ?? '',
    nameEn: json['name_en'] ?? '',
    createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
  );
}

class Review {
  var id;
  dynamic doctorId;
  dynamic branchId;
  var enterpriseId;
  var userId;
  var rating;
  String comment;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Review({
    required this.id,
    this.doctorId,
    this.branchId,
    required this.enterpriseId,
    required this.userId,
    required this.rating,
    required this.comment,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json['id'] ?? 0,
    doctorId: json['doctor_id'],
    branchId: json['branch_id'],
    enterpriseId: json['enterprise_id'] ?? 0,
    userId: json['user_id'] ?? 0,
    rating: json['rating'] != null ? int.parse(json['rating'].toString()) : 0,
    comment: json['comment'] ?? '',
    status: json['status'] ?? '',
    createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
  );
}

class Specialization {
  var id;
  String nameAr;
  String nameEn;
  String icon;
  DateTime createdAt;
  DateTime updatedAt;

  Specialization({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) => Specialization(
    id: json['id'] ?? 0,
    nameAr: json['name_ar'] ?? '',
    nameEn: json['name_en'] ?? '',
    icon: json['icon'] ?? '',
    createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
  );
}
*/



import 'dart:convert';

EnterpriseResponse enterpriseResponseFromJson(String str) => EnterpriseResponse.fromJson(json.decode(str));

class EnterpriseResponse {
  Enterprise enterprise;
  List<dynamic> enterpriseSchedules;
  List<LocationFeature> locationFeatures;
  List<Insurance> insurances;
  List<Branch> branches;
  List<Specialization> specializations;
  var patientsCount;
  List<Review> reviews;
  var reviewCount;
  double averageRating;
  var status;

  EnterpriseResponse({
    required this.enterprise,
    required this.enterpriseSchedules,
    required this.locationFeatures,
    required this.insurances,
    required this.branches,
    required this.specializations,
    required this.patientsCount,
    required this.reviews,
    required this.reviewCount,
    required this.averageRating,
    required this.status,
  });

  factory EnterpriseResponse.fromJson(Map<String, dynamic> json) => EnterpriseResponse(
    enterprise: Enterprise.fromJson(json['enterprise']),
    enterpriseSchedules: json['enterprise_schedules'] != null ? List<dynamic>.from(json['enterprise_schedules']) : [],
    locationFeatures: json['locationFeatures'] != null ? List<LocationFeature>.from(json['locationFeatures'].map((x) => LocationFeature.fromJson(x))) : [],
    insurances: json['insurances'] != null ? List<Insurance>.from(json['insurances'].map((x) => Insurance.fromJson(x))) : [],
    branches: json['branches'] != null ? List<Branch>.from(json['branches'].map((x) => Branch.fromJson(x))) : [],
    specializations: json['specializations'] != null ? List<Specialization>.from(json['specializations'].map((x) => Specialization.fromJson(x))) : [],
    patientsCount: json['patients_count'] ?? 0,
    reviews: json['reviews'] != null ? List<Review>.from(json['reviews'].map((x) => Review.fromJson(x))) : [],
    reviewCount: json['reviewCount'] ?? 0,
    averageRating: json['averageRating'] != null ? double.parse(json['averageRating'].toString()) : 0.0,
    status: json['status'] ?? 0,
  );
}

class Enterprise {
  var id;
  String typeAr;
  String typeEn;
  String nameAr;
  String nameEn;
  var cityId;
  var areaId;
  List<dynamic> locationFeatureIds;
  String logo;
  String specialMarkAr;
  String specialMarkEn;
  List<dynamic> papersLicenses;
  String location;
  String tax;
  String registrationNo;
  String sms;
  String phone;
  String about;
  dynamic time;
  List<dynamic> gallery;
  bool hasLab;
  bool hasRadiology;
  String year;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  var doctorCount;
  var specializationCount;
  City city;
  Area area;
  List<Doctor> doctors;

  Enterprise({
    required this.id,
    required this.typeAr,
    required this.typeEn,
    required this.nameAr,
    required this.nameEn,
    required this.cityId,
    required this.areaId,
    required this.locationFeatureIds,
    required this.logo,
    required this.specialMarkAr,
    required this.specialMarkEn,
    required this.papersLicenses,
    required this.location,
    required this.tax,
    required this.registrationNo,
    required this.sms,
    required this.phone,
    required this.about,
    this.time,
    required this.gallery,
    required this.hasLab,
    required this.hasRadiology,
    required this.year,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.doctorCount,
    required this.specializationCount,
    required this.city,
    required this.area,
    required this.doctors,
  });

  factory Enterprise.fromJson(Map<String, dynamic> json) => Enterprise(
    id: json['id'] ?? 0,
    typeAr: json['type_ar'] ?? '',
    typeEn: json['type_en'] ?? '',
    nameAr: json['name_ar'] ?? '',
    nameEn: json['name_en'] ?? '',
    cityId: json['city_id'] ?? 0,
    areaId: json['area_id'] ?? 0,
    locationFeatureIds: json['location_feature_ids'] != null ? List<dynamic>.from(json['location_feature_ids']) : [],
    logo: json['logo'] ?? '',
    specialMarkAr: json['special_mark_ar'] ?? '',
    specialMarkEn: json['special_mark_en'] ?? '',
    papersLicenses: json['papers_licenses'] != null ? List<dynamic>.from(jsonDecode(json['papers_licenses'])) : [],
    location: json['location'] ?? '',
    tax: json['tax'] ?? '',
    registrationNo: json['registration_no'] ?? '',
    sms: json['sms'] ?? '',
    phone: json['phone'] ?? '',
    about: json['about'] ?? '',
    time: json['time'],
    gallery: json['gallery'] != null ? List<dynamic>.from(jsonDecode(json['gallery'])) : [],
    hasLab: json['has_lab'] == "true",
    hasRadiology: json['has_radiology'] == "true",
    year: json['year'] ?? '',
    status: json['status'] ?? '',
    createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
    doctorCount: json['doctor_count'] ?? 0,
    specializationCount: json['specialization_count'] ?? 0,
    city: City.fromJson(json['city'] ?? {}),
    area: Area.fromJson(json['area'] ?? {}),
    doctors: json['doctors'] != null ? List<Doctor>.from(json['doctors'].map((x) => Doctor.fromJson(x))) : [],
  );
}

class Area {
  var id;
  String nameAr;
  String nameEn;
  var cityId;
  DateTime createdAt;
  DateTime updatedAt;

  Area({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.cityId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Area.fromJson(Map<String, dynamic> json) => Area(
    id: json['id'] ?? 0,
    nameAr: json['name_ar'] ?? '',
    nameEn: json['name_en'] ?? '',
    cityId: json['city_id'] ?? 0,
    createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
  );
}

class Branch {
  var id;
  var enterpriseId;
  String typeAr;
  String typeEn;
  String nameAr;
  String nameEn;
  var cityId;
  var areaId;
  List<dynamic> locationFeatureIds;
  String logo;
  String specialMarkAr;
  String specialMarkEn;
  List<dynamic> papersLicenses;
  String location;
  String tax;
  String registrationNo;
  String sms;
  String phone;
  String about;
  String aboutEn;
  dynamic time;
  List<dynamic> gallery;
  bool hasLab;
  bool hasRadiology;
  String year;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> schedules;
  City city;
  Area area;
  List<LocationFeature> locationFeatures;
  List<Insurance> insurances;
  var reviewCount;
  double averageRating;
  var doctorsCount;
  List<Specialization> specializations;
  var specializationsCount;
  var staticPatientCount;

  Branch({
    required this.id,
    required this.enterpriseId,
    required this.typeAr,
    required this.typeEn,
    required this.nameAr,
    required this.nameEn,
    required this.cityId,
    required this.areaId,
    required this.locationFeatureIds,
    required this.logo,
    required this.aboutEn,
    required this.specialMarkAr,
    required this.specialMarkEn,
    required this.papersLicenses,
    required this.location,
    required this.tax,
    required this.registrationNo,
    required this.sms,
    required this.phone,
    this.about = '',
    this.time,
    required this.gallery,
    required this.hasLab,
    required this.hasRadiology,
    required this.year,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.schedules,
    required this.city,
    required this.area,
    required this.locationFeatures,
    required this.insurances,
    required this.reviewCount,
    required this.averageRating,
    required this.doctorsCount,
    required this.specializations,
    required this.specializationsCount,
    required this.staticPatientCount,
  });

  factory Branch.fromJson(Map<String, dynamic> json) =>
      Branch(
    id: json['id'] ?? 0,
    enterpriseId: json['enterprise_id'] ?? 0,
    typeAr: json['type_ar'] ?? '',
    typeEn: json['type_en'] ?? '',
    nameAr: json['name_ar'] ?? '',
    nameEn: json['name_en'] ?? '',
    cityId: json['city_id'] ?? 0,
    areaId: json['area_id'] ?? 0,
    locationFeatureIds: json['location_feature_ids'] != null ? List<dynamic>.from(json['location_feature_ids']) : [],
    logo: json['logo'] ?? '',
    specialMarkAr: json['special_mark_ar'] ?? '',
    specialMarkEn: json['special_mark_en'] ?? '',
    papersLicenses: json['papers_licenses'] != null ? List<dynamic>.from(jsonDecode(json['papers_licenses'])) : [],
    location: json['location'] ?? '',
    tax: json['tax'] ?? '',
    registrationNo: json['registration_no'] ?? '',
    sms: json['sms'] ?? '',
    phone: json['phone'] ?? '',
    aboutEn: json['about_en'] ?? '',
    about: json['about'] ?? '',
    time: json['time'],
    gallery: json['gallery'] != null ? List<dynamic>.from(jsonDecode(json['gallery'])) : [],
    hasLab: json['has_lab'] == "true",
    hasRadiology: json['has_radiology'] == "true",
    year: json['year'] ?? '',
    status: json['status'] ?? '',
    createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
    schedules: json['schedules'] != null ? List<dynamic>.from(json['schedules']) : [],
    city: City.fromJson(json['city'] ?? {}),
    area: Area.fromJson(json['area'] ?? {}),
    locationFeatures: json['locationFeatures'] != null ? List<LocationFeature>.from(json['locationFeatures'].map((x) => LocationFeature.fromJson(x))) : [],
    insurances: json['insurances'] != null ? List<Insurance>.from(json['insurances'].map((x) => Insurance.fromJson(x))) : [],
    reviewCount: json['reviewCount'] ?? 0,
    averageRating: json['averageRating'] != null ? double.parse(json['averageRating'].toString()) : 0.0,
    doctorsCount: json['doctorsCount'] ?? 0,
    specializations: json['specializations'] != null ? List<Specialization>.from(json['specializations'].map((x) => Specialization.fromJson(x))) : [],
    specializationsCount: json['specializationsCount'] ?? 0,
    staticPatientCount: json['staticPatientCount'] ?? 0,
  );
}

class City {
  var id;
  String categoryAr;
  String categoryEn;
  String nameAr;
  String nameEn;
  DateTime createdAt;
  DateTime updatedAt;

  City({
    required this.id,
    required this.categoryAr,
    required this.categoryEn,
    required this.nameAr,
    required this.nameEn,
    required this.createdAt,
    required this.updatedAt,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json['id'] ?? 0,
    categoryAr: json['category_ar'] ?? '',
    categoryEn: json['category_en'] ?? '',
    nameAr: json['name_ar'] ?? '',
    nameEn: json['name_en'] ?? '',
    createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
  );
}

class Doctor {
  var id;
  var enterpriseId;
  String img;
  String nameAr;
  String nameEn;
  String lastNameAr;
  String lastNameEn;
  String email;
  String mobile;
  String gender;
  String graduationYear;
  String idNumber;
  String children;
  String adults;
  var maxConsultationsPerDay;
  List<dynamic> serviceIds;
  String jobTitleAr;
  String jobTitleEn;
  String additionalJobTitleAr;
  String additionalJobTitleEn;
  String certificateAr;
  String certificateEn;
  String aboutAr;
  String aboutEn;
  double price;
  List<dynamic> branchIds;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Doctor({
    required this.id,
    required this.enterpriseId,
    required this.img,
    required this.nameAr,
    required this.nameEn,
    required this.lastNameAr,
    required this.lastNameEn,
    required this.email,
    required this.mobile,
    required this.gender,
    required this.graduationYear,
    required this.idNumber,
    required this.children,
    required this.adults,
    required this.maxConsultationsPerDay,
    required this.serviceIds,
    required this.jobTitleAr,
    required this.jobTitleEn,
    required this.additionalJobTitleAr,
    required this.additionalJobTitleEn,
    required this.certificateAr,
    required this.certificateEn,
    required this.aboutAr,
    required this.aboutEn,
    required this.price,
    required this.branchIds,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json['id'] ?? 0,
    enterpriseId: json['enterprise_id'] ?? 0,
    img: json['img'] ?? '',
    nameAr: json['name_ar'] ?? '',
    nameEn: json['name_en'] ?? '',
    lastNameAr: json['last_name_ar'] ?? '',
    lastNameEn: json['last_name_en'] ?? '',
    email: json['email'] ?? '',
    mobile: json['mobile'] ?? '',
    gender: json['gender'] ?? '',
    graduationYear: json['graduation_year'] ?? '',
    idNumber: json['id_number'] ?? '',
    children: json['children'] ?? '',
    adults: json['adults'] ?? '',
    maxConsultationsPerDay: json['max_consultations_per_day'] ?? 0,
    serviceIds: json['service_ids'] != null ? List<dynamic>.from(json['service_ids']) : [],
    jobTitleAr: json['job_title_ar'] ?? '',
    jobTitleEn: json['job_title_en'] ?? '',
    additionalJobTitleAr: json['additional_job_title_ar'] ?? '',
    additionalJobTitleEn: json['additional_job_title_en'] ?? '',
    certificateAr: json['certificate_ar'] ?? '',
    certificateEn: json['certificate_en'] ?? '',
    aboutAr: json['about_ar'] ?? '',
    aboutEn: json['about_en'] ?? '',
    price: json['price'] != null ? double.parse(json['price'].toString()) : 0.0,
    branchIds: json['branch_ids'] != null ? List<dynamic>.from(json['branch_ids']) : [],
    status: json['status'] ?? '',
    createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
  );
}

class Insurance {
  var id;
  String nameAr;
  String nameEn;
  DateTime createdAt;
  DateTime updatedAt;

  Insurance({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Insurance.fromJson(Map<String, dynamic> json) => Insurance(
    id: json['id'] ?? 0,
    nameAr: json['name_ar'] ?? '',
    nameEn: json['name_en'] ?? '',
    createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
  );
}

class LocationFeature {
  var id;
  String nameAr;
  String nameEn;
  DateTime createdAt;
  DateTime updatedAt;

  LocationFeature({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LocationFeature.fromJson(Map<String, dynamic> json) => LocationFeature(
    id: json['id'] ?? 0,
    nameAr: json['name_ar'] ?? '',
    nameEn: json['name_en'] ?? '',
    createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
  );
}

class Review {
  var id;
  dynamic doctorId;
  dynamic branchId;
  var enterpriseId;
  var userId;
  var rating;
  String comment;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Review({
    required this.id,
    this.doctorId,
    this.branchId,
    required this.enterpriseId,
    required this.userId,
    required this.rating,
    required this.comment,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json['id'] ?? 0,
    doctorId: json['doctor_id'],
    branchId: json['branch_id'],
    enterpriseId: json['enterprise_id'] ?? 0,
    userId: json['user_id'] ?? 0,
    rating: json['rating'] != null ? int.parse(json['rating'].toString()) : 0,
    comment: json['comment'] ?? '',
    status: json['status'] ?? '',
    createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
  );
}

class Specialization {
  var id;
  String nameAr;
  String nameEn;
  String icon;
  DateTime createdAt;
  DateTime updatedAt;

  Specialization({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) => Specialization(
    id: json['id'] ?? 0,
    nameAr: json['name_ar'] ?? '',
    nameEn: json['name_en'] ?? '',
    icon: json['icon'] ?? '',
    createdAt: DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String()),
    updatedAt: DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String()),
  );
}
