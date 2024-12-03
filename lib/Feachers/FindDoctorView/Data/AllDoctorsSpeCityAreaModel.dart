



import 'dart:convert';

class DoctorResponse {
  final List<Doctor> doctors;

  DoctorResponse({required this.doctors});

  factory DoctorResponse.fromJson(Map<String, dynamic> json) {
    return DoctorResponse(
      doctors: (json['doctors'] as List)
          .map((i) => Doctor.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctors': doctors.map((e) => e.toJson()).toList(),
    };
  }
}

class Doctor {
  var id;
  var enterpriseId;
  var img;
  var nameAr;
  var nameEn;
  var lastNameAr;
  var lastNameEn;
  var email;
  var mobile;
  var gender;
  var graduationYear;
  var idNumber;
  var children;
  var adults;
  var ageTo;
  var isIntegratedClinic;
  var jobTitleAr;
  var jobTitleEn;
  var additionalJobTitleAr;
  var additionalJobTitleEn;
  var expYears;
  var aboutAr;
  var aboutEn;
  var price;
  var status;
  var isTop10;
  var isVip;
  var isRecommended;
  var rank;
  var city;
  var area;
  var searched_specialization_type;

  final DateTime createdAt;
  final DateTime updatedAt;
  final List<City> cities;
  final List<Area> areas;
  final List<Branch> allBranches;
  final List<Specialization> specializations;
  final List<Specialization> additional_specializations;
  var countReviewsWithRating5;
  var countReviewsWithRating4;
  var countReviewsWithRating3;
  var countReviewsWithRating2;
  var countReviewsWithRating1;
  var reviewCount;
  final double? averageRating;
  var vacation;
  var vacationData;
  final List<AvailableAppointment> availableAppointments;
  final Enterprise enterprise;

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
    required this.searched_specialization_type,
    required this.graduationYear,
    required this.idNumber,
    required this.children,
    required this.isIntegratedClinic,
    required this.adults,
    this.ageTo,
    required this.jobTitleAr,
    required this.jobTitleEn,
    required this.additionalJobTitleAr,
    required this.additionalJobTitleEn,
    required this.expYears,
    required this.aboutAr,
    required this.aboutEn,
    required this.price,
    required this.status,
    required this.isTop10,
    required this.isVip,
    required this.isRecommended,
    this.rank,
    required this.city,
    this.area,
    required this.createdAt,
    required this.updatedAt,
    required this.cities,
    required this.areas,
    required this.allBranches,
    required this.specializations,
    required this.additional_specializations,
    required this.countReviewsWithRating5,
    required this.countReviewsWithRating4,
    required this.countReviewsWithRating3,
    required this.countReviewsWithRating2,
    required this.countReviewsWithRating1,
    required this.reviewCount,
    this.averageRating,
    required this.vacation,
    this.vacationData,
    required this.availableAppointments,
    required this.enterprise,
  });

/*
  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      enterpriseId: json['enterprise_id'] ?? '',
      img: json['img'] ?? '',
      searched_specialization_type: json['searched_specialization_type'] ?? '',
      nameAr: json['name_ar'] ?? '',
      nameEn: json['name_en'] ?? '',
      lastNameAr: json['last_name_ar'] ?? '',
      lastNameEn: json['last_name_en'] ?? '',
      email: json['email'] ?? '',
      isIntegratedClinic: json['isIntegratedClinic'] ?? '',
      mobile: json['mobile'] ?? '',
      gender: json['gender'] ?? '',
      graduationYear: json['graduation_year'] ?? '',
      idNumber: json['id_number'] ?? '',
      children: json['children'] == "true",
      adults: json['adults'] == "true",
      ageTo: json['age_to'],  // This might be null
      jobTitleAr: json['job_title_ar'] ?? '',
      jobTitleEn: json['job_title_en'] ?? '',
      additionalJobTitleAr: json['additional_job_title_ar'] ?? '',
      additionalJobTitleEn: json['additional_job_title_en'] ?? '',
      expYears: json['exp_years'] ?? '',
      aboutAr: json['about_ar'] ?? '',
      aboutEn: json['about_en'] ?? '',
      price: json['price'] ?? '',
      status: json['status'] ?? '',
      isTop10: json['is_top_10'] == "1",
      isVip: json['is_vip'] == "1",
      isRecommended: json['is_recommended'] == "1",
      rank: json['rank'] != null ? json['rank'].toString() : '',  // This might be null
      city: json['city'] != null ? json['city'].toString() : '',  // This might be null
      area: json['area'] != null ? json['area'].toString() : '',  // This might be null
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      cities: json['cities'] != null ? (json['cities'] as List).map((i) => City.fromJson(i)).toList() : [],
      areas: json['areas'] != null ? (json['areas'] as List).map((i) => Area.fromJson(i)).toList() : [],
      allBranches: json['all_branches'] != null ? (json['all_branches'] as List).map((i) => Branch.fromJson(i)).toList() : [],
      specializations: json['specializations'] != null ? (json['specializations'] as List).map((i) => Specialization.fromJson(i)).toList() : [],
      additional_specializations: json['additional_specializations'] != null ? (json['additional_specializations'] as List).map((i) => Specialization.fromJson(i)).toList() : [],
      countReviewsWithRating5: json['countReviewsWithRating5'] ?? 0,
      countReviewsWithRating4: json['countReviewsWithRating4'] ?? 0,
      countReviewsWithRating3: json['countReviewsWithRating3'] ?? 0,
      countReviewsWithRating2: json['countReviewsWithRating2'] ?? 0,
      countReviewsWithRating1: json['countReviewsWithRating1'] ?? 0,
      reviewCount: json['reviewCount'] ?? 0,
      averageRating: json['averageRating'] != null ? double.parse(json['averageRating']) : null,
      vacation: json['vacation'] ?? false,
      vacationData: json['vacation_data'],
      availableAppointments: json['available_appointments'] != null
          ? (json['available_appointments'] as List).map((e) => AvailableAppointment.fromJson(e)).toList()
          : [],
      enterprise: Enterprise.fromJson(json['enterprise']),
    );
  }
*/
  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      enterpriseId: json['enterprise_id'] ?? '',
      img: json['img'] ?? '',
      searched_specialization_type: json['searched_specialization_type'] ?? '',
      nameAr: json['name_ar'] ?? '',
      nameEn: json['name_en'] ?? '',
      lastNameAr: json['last_name_ar'] ?? '',
      lastNameEn: json['last_name_en'] ?? '',
      email: json['email'] ?? '',
      isIntegratedClinic: json['isIntegratedClinic'] ?? '',
      mobile: json['mobile'] ?? '',
      gender: json['gender'] ?? '',
      graduationYear: json['graduation_year'] ?? '',
      idNumber: json['id_number'] ?? '',
      children: json['children'] == "true",
      adults: json['adults'] == "true",
      ageTo: json['age_to'],  // This might be null
      jobTitleAr: json['job_title_ar'] ?? '',
      jobTitleEn: json['job_title_en'] ?? '',
      additionalJobTitleAr: json['additional_job_title_ar'] ?? '',
      additionalJobTitleEn: json['additional_job_title_en'] ?? '',
      expYears: json['exp_years'] ?? '',
      aboutAr: json['about_ar'] ?? '',
      aboutEn: json['about_en'] ?? '',
      price: json['price'] ?? '',
      status: json['status'] ?? '',
      isTop10: json['is_top_10'] == "1",
      isVip: json['is_vip'] == "1",
      isRecommended: json['is_recommended'] == "1",
      rank: json['rank'] != null ? json['rank'].toString() : '',  // This might be null
      city: json['city'] != null ? json['city'].toString() : '',  // This might be null
      area: json['area'] != null ? json['area'].toString() : '',  // This might be null
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      cities: json['cities'] != null
          ? (json['cities'] as List).map((i) => City.fromJson(i)).toList()
          : [],  // Handle null case
      areas: json['areas'] != null
          ? (json['areas'] as List).map((i) => Area.fromJson(i)).toList()
          : [],  // Handle null case
      allBranches: json['all_branches'] != null
          ? (json['all_branches'] as List).map((i) => Branch.fromJson(i)).toList()
          : [],  // Handle null case
      specializations: json['specializations'] != null
          ? (json['specializations'] as List)
          .map((i) => Specialization.fromJson(i))
          .toList()
          : [],  // Handle null case
      additional_specializations: json['additional_specializations'] != null
          ? (json['additional_specializations'] as List)
          .map((i) => Specialization.fromJson(i))
          .toList()
          : [],  // Handle null case
      countReviewsWithRating5: json['countReviewsWithRating5'] ?? 0,
      countReviewsWithRating4: json['countReviewsWithRating4'] ?? 0,
      countReviewsWithRating3: json['countReviewsWithRating3'] ?? 0,
      countReviewsWithRating2: json['countReviewsWithRating2'] ?? 0,
      countReviewsWithRating1: json['countReviewsWithRating1'] ?? 0,
      reviewCount: json['reviewCount'] ?? 0,
      averageRating: json['averageRating'] != null
          ? double.parse(json['averageRating'])
          : null,  // Handle null case
      vacation: json['vacation'] ?? false,
      vacationData: json['vacation_data'],
      availableAppointments: json['available_appointments'] != null
          ? (json['available_appointments'] as List)
          .map((e) => AvailableAppointment.fromJson(e))
          .toList()
          : [],  // Handle null case
      enterprise: json['enterprise'] != null
          ? Enterprise.fromJson(json['enterprise'])
          : Enterprise(id: 0, typeAr: '', typeEn: '', nameAr: '', nameEn: '', cityId: 0, areaId: 0, logo: '', specialMarkAr: '', specialMarkEn: '', location: '', tax: '', registrationNo: '', sms: '', phone: '', aboutAr: '', aboutEn: '', time: '', hasLab: false, hasRadiology: false, year: 0, status: '', createdAt: DateTime.now(), updatedAt: DateTime.now()), // Default if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'enterprise_id': enterpriseId,
      'img': img,
      'searched_specialization_type': searched_specialization_type,
      'name_ar': nameAr,
      'name_en': nameEn,
      'last_name_ar': lastNameAr,
      'last_name_en': lastNameEn,
      'email': email,
      'mobile': mobile,
      'gender': gender,
      'graduation_year': graduationYear,
      'id_number': idNumber,
      'children': children,
      'adults': adults,
      'age_to': ageTo,
      'job_title_ar': jobTitleAr,
      'job_title_en': jobTitleEn,
      'additional_job_title_ar': additionalJobTitleAr,
      'additional_job_title_en': additionalJobTitleEn,
      'exp_years': expYears,
      'isIntegratedClinic': isIntegratedClinic,
      'about_ar': aboutAr,
      'about_en': aboutEn,
      'price': price,
      'status': status,
      'is_top_10': isTop10 ? "1" : "0",
      'is_vip': isVip ? "1" : "0",
      'is_recommended': isRecommended ? "1" : "0",
      'rank': rank,
      'city': city,
      'area': area,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'cities': cities.map((e) => e.toJson()).toList(),
      'areas': areas.map((e) => e.toJson()).toList(),
      'all_branches': allBranches.map((e) => e.toJson()).toList(),
      'specializations': specializations.map((e) => e.toJson()).toList(),
      'additional_specializations': additional_specializations.map((e) => e.toJson()).toList(),
      'countReviewsWithRating5': countReviewsWithRating5,
      'countReviewsWithRating4': countReviewsWithRating4,
      'countReviewsWithRating3': countReviewsWithRating3,
      'countReviewsWithRating2': countReviewsWithRating2,
      'countReviewsWithRating1': countReviewsWithRating1,
      'reviewCount': reviewCount,
      'averageRating': averageRating,
      'vacation': vacation,
      'vacation_data': vacationData,
      'available_appointments': availableAppointments.map((e) => e.toJson()).toList(),
      'enterprise': enterprise.toJson(),
    };
  }
}

class City {
  var id;
  var categoryAr;
  var categoryEn;
  var nameAr;
  var nameEn;
  final DateTime createdAt;
  final DateTime updatedAt;

  City({
    required this.id,
    required this.categoryAr,
    required this.categoryEn,
    required this.nameAr,
    required this.nameEn,
    required this.createdAt,
    required this.updatedAt,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      categoryAr: json['category_ar'] ?? 'null',
      categoryEn: json['category_en'] ?? 'null',
      nameAr: json['name_ar'] ?? 'null',
      nameEn: json['name_en'] ?? 'null',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_ar': categoryAr,
      'category_en': categoryEn,
      'name_ar': nameAr,
      'name_en': nameEn,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

class Area {
  var id;
  var nameAr;
  var nameEn;
  var cityId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Area({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.cityId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(
      id: json['id'],
      nameAr: json['name_ar'] ?? 'null',
      nameEn: json['name_en'] ?? 'null',
      cityId: int.parse(json['city_id']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_ar': nameAr,
      'name_en': nameEn,
      'city_id': cityId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

class Branch {
  var id;
  var enterpriseId;
  var typeAr;
  var typeEn;
  var nameAr;
  var nameEn;
  var cityId;
  var areaId;

  var logo;
  var specialMarkAr;
  var specialMarkEn;
  var location;
  var tax;
  var registrationNo;
  var sms;
  var phone;
  var aboutAr;
  var aboutEn;
  var time;
  var hasLab;
  var hasRadiology;
  var year;
  var status;
  var addressAr;
  var addressEn;
  final DateTime createdAt;
  final DateTime updatedAt;

  Branch({
    required this.id,
    required this.enterpriseId,
    required this.typeAr,
    required this.typeEn,
    required this.nameAr,
    required this.nameEn,
    required this.cityId,
    required this.areaId,

    required this.logo,
    required this.specialMarkAr,
    required this.specialMarkEn,
    required this.location,
    required this.tax,
    required this.registrationNo,
    required this.sms,
    required this.phone,
    required this.aboutAr,
    required this.aboutEn,
    this.time,
    required this.hasLab,
    required this.hasRadiology,
    required this.year,
    required this.status,
    required this.addressAr,
    required this.addressEn,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      id: json['id'],
      enterpriseId: json['enterprise_id'] ?? 'null',
      typeAr: json['type_ar'] ?? 'null',
      typeEn: json['type_en'] ?? 'null',
      nameAr: json['name_ar'] ?? 'null',
      nameEn: json['name_en'] ?? 'null',
      cityId: int.parse(json['city_id']),
      areaId: int.parse(json['area_id']),

      logo: json['logo'] ?? 'null',
      specialMarkAr: json['special_mark_ar'] ?? 'null',
      specialMarkEn: json['special_mark_en'] ?? 'null',
      location: json['location'] ?? 'null',
      tax: json['tax'] ?? 'null',
      registrationNo: json['registration_no'] ?? 'null',
      sms: json['sms'] ?? 'null',
      phone: json['phone'] ?? 'null',
      aboutAr: json['about_ar'] ?? 'null',
      aboutEn: json['about_en'] ?? 'null',
      time: json['time'] ?? 'null',
      hasLab: json['has_lab'] == "true",
      hasRadiology: json['has_radiology'] == "true",
      year: int.parse(json['year']),
      status: json['status'] ?? 'null',
      addressAr: json['address_ar'] ?? 'null',
      addressEn: json['address_en'] ?? 'null',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'enterprise_id': enterpriseId,
      'type_ar': typeAr,
      'type_en': typeEn,
      'name_ar': nameAr,
      'name_en': nameEn,
      'city_id': cityId,
      'area_id': areaId,

      'logo': logo,
      'special_mark_ar': specialMarkAr,
      'special_mark_en': specialMarkEn,
      'location': location,
      'tax': tax,
      'registration_no': registrationNo,
      'sms': sms,
      'phone': phone,
      'about_ar': aboutAr,
      'about_en': aboutEn,
      'time': time,
      'has_lab': hasLab ? "true" : "false",
      'has_radiology': hasRadiology ? "true" : "false",
      'year': year,
      'status': status,
      'address_ar': addressAr,
      'address_en': addressEn,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

class Specialization {
  var id;
  var nameAr;
  var nameEn;
  var icon;
  final DateTime createdAt;
  final DateTime updatedAt;
  var isMostSelected;

  Specialization({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
    required this.isMostSelected,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) {
    return Specialization(
      id: json['id'],
      nameAr: json['name_ar'] ?? 'null',
      nameEn: json['name_en'] ?? 'null',
      icon: json['icon'] ?? 'null',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      isMostSelected: json['is_most_selected'] == "1",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_ar': nameAr,
      'name_en': nameEn,
      'icon': icon,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'is_most_selected': isMostSelected ? "1" : "0",
    };
  }
}

class Enterprise {
  var id;
  var typeAr;
  var typeEn;
  var nameAr;
  var nameEn;
  var cityId;
  var areaId;

  var logo;
  var specialMarkAr;
  var specialMarkEn;
  var location;
  var tax;
  var registrationNo;
  var sms;
  var phone;
  var aboutAr;
  var aboutEn;
  var time;
  var hasLab;
  var hasRadiology;
  var year;
  var status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Enterprise({
    required this.id,
    required this.typeAr,
    required this.typeEn,
    required this.nameAr,
    required this.nameEn,
    required this.cityId,
    required this.areaId,

    required this.logo,
    required this.specialMarkAr,
    required this.specialMarkEn,
    required this.location,
    required this.tax,
    required this.registrationNo,
    required this.sms,
    required this.phone,
    required this.aboutAr,
    required this.aboutEn,
    this.time,
    required this.hasLab,
    required this.hasRadiology,
    required this.year,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Enterprise.fromJson(Map<String, dynamic> json) {
    return Enterprise(
      id: json['id'],
      typeAr: json['type_ar'] ?? 'null',
      typeEn: json['type_en'] ?? 'null',
      nameAr: json['name_ar'] ?? 'null',
      nameEn: json['name_en'] ?? 'null',
      cityId: int.parse(json['city_id']),
      areaId: int.parse(json['area_id']),
      logo: json['logo'] ?? 'null',
      specialMarkAr: json['special_mark_ar'] ?? 'null',
      specialMarkEn: json['special_mark_en'] ?? 'null',
      location: json['location'] ?? 'null',
      tax: json['tax'] ?? 'null',
      registrationNo: json['registration_no'] ?? 'null',
      sms: json['sms'] ?? 'null',
      phone: json['phone'] ?? 'null',
      aboutAr: json['about_ar'] ?? 'null',
      aboutEn: json['about_en'] ?? 'null',
      time: json['time'] ?? 'null',  // This might be null
      hasLab: json['has_lab'] == "true",
      hasRadiology: json['has_radiology'] == "true",
      year: json['year'] != null ? int.parse(json['year']) : null,  // This might be null
      status: json['status'] ?? 'null',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type_ar': typeAr,
      'type_en': typeEn,
      'name_ar': nameAr,
      'name_en': nameEn,
      'city_id': cityId,
      'area_id': areaId,

      'logo': logo,
      'special_mark_ar': specialMarkAr,
      'special_mark_en': specialMarkEn,
      'location': location,
      'tax': tax,
      'registration_no': registrationNo,
      'sms': sms,
      'phone': phone,
      'about_ar': aboutAr,
      'about_en': aboutEn,
      'time': time,
      'has_lab': hasLab ? "true" : "false",
      'has_radiology': hasRadiology ? "true" : "false",
      'year': year,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

class AvailableAppointment {
  var id;
  var doctorId;
  var enterpriseId;
  var day;
  var time;
  var date;
  var isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  AvailableAppointment({
    required this.id,
    required this.doctorId,
    required this.enterpriseId,
    required this.day,
    required this.time,
    required this.date,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AvailableAppointment.fromJson(Map<String, dynamic> json) {
    return AvailableAppointment(
      id: json['id'],
      doctorId: json['doctor_id'],
      enterpriseId: json['enterprise_id'],
      day: json['day'],
      time: json['time'] ?? '',
      date: json['date'] ?? '',
      isActive: json['is_active'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctor_id': doctorId,
      'enterprise_id': enterpriseId,
      'day': day,
      'time': time,
      'date': date,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}




