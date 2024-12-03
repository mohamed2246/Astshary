
class ClinicDoctorsBranch {
  List<Doctors>? doctors;
  int? status;

  ClinicDoctorsBranch({this.doctors, this.status});

  ClinicDoctorsBranch.fromJson(Map<String, dynamic> json) {
    if (json['doctors'] != null) {
      doctors = <Doctors>[];
      json['doctors'].forEach((v) {
        doctors!.add(Doctors.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doctors != null) {
      data['doctors'] = doctors!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class Doctors {
  int? id;
  String? enterpriseId;
  String? img;
  String? nameAr;
  String? nameEn;
  String? lastNameAr;
  String? lastNameEn;
  String? email;
  String? mobile;
  String? gender;
  String? graduationYear;
  String? idNumber;
  String? children;
  String? adults;
  String? ageFrom;
  String? ageTo;
  String? maxConsultationsPerDay;
  List<String>? specializationIds;
  List<String>? additionalSpecializationIds;
  List<String>? serviceIds;
  String? jobTitleAr;
  String? jobTitleEn;
  String? additionalJobTitleAr;
  String? additionalJobTitleEn;
  String? papers;
  String? aboutAr;
  String? aboutEn;
  String? additionalServicesAr;
  String? additionalServicesEn;
  String? price;
  List<String>? insuranceIds;
  List<String>? branchIds;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? isTop10;
  String? isVip;
  String? isRecommended;
  String? rank;
  String? city;
  String? area;
  String? acceptsSameDayAppointments;
  List<AvaliableAppointments>? avaliableAppointments;
  List<Branches>? branches;
  int? reviewCount;
  String? averageRating;
  bool? isIntegratedClinic;
  List<Specializations>? specializations;
  List<Services>? services;
  int? staticPatientCount;
  List<Area>? areas;

  Doctors({
    this.id,
    this.enterpriseId,
    this.img,
    this.nameAr,
    this.nameEn,
    this.lastNameAr,
    this.lastNameEn,
    this.email,
    this.mobile,
    this.gender,
    this.graduationYear,
    this.idNumber,
    this.children,
    this.adults,
    this.ageFrom,
    this.areas,
    this.ageTo,
    this.maxConsultationsPerDay,
    this.specializationIds,
    this.additionalSpecializationIds,
    this.serviceIds,
    this.jobTitleAr,
    this.jobTitleEn,
    this.additionalJobTitleAr,
    this.additionalJobTitleEn,
    this.papers,
    this.aboutAr,
    this.aboutEn,
    this.additionalServicesAr,
    this.additionalServicesEn,
    this.price,
    this.insuranceIds,
    this.branchIds,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.isTop10,
    this.isVip,
    this.isRecommended,
    this.rank,
    this.city,
    this.area,
    this.acceptsSameDayAppointments,
    this.avaliableAppointments,
    this.branches,
    this.reviewCount,
    this.isIntegratedClinic,
    this.averageRating,
    this.specializations,
    this.services,
    this.staticPatientCount,
  });

  Doctors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enterpriseId = json['enterprise_id'];
    img = json['img'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    lastNameAr = json['last_name_ar'];
    lastNameEn = json['last_name_en'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    graduationYear = json['graduation_year'];
    idNumber = json['id_number'];
    children = json['children'];
    adults = json['adults'];
    ageFrom = json['age_from'];
    ageTo = json['age_to'];
    maxConsultationsPerDay = json['max_consultations_per_day'];
    specializationIds = (json['specialization_ids'] as List<dynamic>?)?.cast<String>();
    additionalSpecializationIds = (json['additional_specialization_ids'] as List<dynamic>?)?.cast<String>();
    serviceIds = (json['service_ids'] as List<dynamic>?)?.cast<String>();
    jobTitleAr = json['job_title_ar'];
    jobTitleEn = json['job_title_en'];
    additionalJobTitleAr = json['additional_job_title_ar'];
    additionalJobTitleEn = json['additional_job_title_en'];
    papers = json['papers'];
    aboutAr = json['about_ar'];
    aboutEn = json['about_en'];
    additionalServicesAr = json['additional_services_ar'];
    additionalServicesEn = json['additional_services_en'];
    price = json['price'];
    insuranceIds = (json['insurance_ids'] as List<dynamic>?)?.cast<String>();
    branchIds = (json['branch_ids'] as List<dynamic>?)?.cast<String>();
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isTop10 = json['is_top_10'];
    isVip = json['is_vip'];
    isIntegratedClinic = json['isIntegratedClinic'];
    isRecommended = json['is_recommended'];
    rank = json['rank'];
    city = json['city'];
    area = json['area'];
    areas = json['areas'] != null
        ? List<Area>.from(json['areas'].map((v) => Area.fromJson(v)))
        : null;
    acceptsSameDayAppointments = json['accepts_same_day_appointments'];
    if (json['available_appointments'] != null) {
      avaliableAppointments = <AvaliableAppointments>[];
      json['available_appointments'].forEach((v) {
        avaliableAppointments!.add(AvaliableAppointments.fromJson(v));
      });
    }
    if (json['branches'] != null) {
      branches = <Branches>[];
      json['branches'].forEach((v) {
        branches!.add(Branches.fromJson(v));
      });
    }
    reviewCount = json['reviewCount'];
    averageRating = json['averageRating'];
    if (json['specializations'] != null) {
      specializations = <Specializations>[];
      json['specializations'].forEach((v) {
        specializations!.add(Specializations.fromJson(v));
      });
    }
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
    staticPatientCount = json['staticPatientCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['enterprise_id'] = enterpriseId;
    data['img'] = img;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['isIntegratedClinic'] = isIntegratedClinic;
    data['last_name_ar'] = lastNameAr;
    data['last_name_en'] = lastNameEn;
    data['email'] = email;
    data['mobile'] = mobile;
    data['gender'] = gender;
    data['graduation_year'] = graduationYear;
    data['id_number'] = idNumber;
    data['children'] = children;
    data['adults'] = adults;
    data['age_from'] = ageFrom;
    data['age_to'] = ageTo;
    data['max_consultations_per_day'] = maxConsultationsPerDay;
    data['specialization_ids'] = specializationIds;
    data['additional_specialization_ids'] = additionalSpecializationIds;
    data['service_ids'] = serviceIds;
    data['job_title_ar'] = jobTitleAr;
    data['job_title_en'] = jobTitleEn;
    data['additional_job_title_ar'] = additionalJobTitleAr;
    data['additional_job_title_en'] = additionalJobTitleEn;
    data['papers'] = papers;
    data['about_ar'] = aboutAr;
    data['about_en'] = aboutEn;
    data['additional_services_ar'] = additionalServicesAr;
    data['additional_services_en'] = additionalServicesEn;
    data['price'] = price;
    data['insurance_ids'] = insuranceIds;
    data['branch_ids'] = branchIds;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_top_10'] = isTop10;
    data['is_vip'] = isVip;
    data['is_recommended'] = isRecommended;
    data['rank'] = rank;
    data['city'] = city;
    data['area'] = area;



    data['accepts_same_day_appointments'] = acceptsSameDayAppointments;

    if (this.areas != null) {
      data['areas'] = this.areas!.map((v) => v.toJson()).toList();
    }
    if (avaliableAppointments != null) {
      data['available_appointments'] = avaliableAppointments!.map((v) => v.toJson()).toList();
    }
    if (branches != null) {
      data['branches'] = branches!.map((v) => v.toJson()).toList();
    }
    data['reviewCount'] = reviewCount;
    data['averageRating'] = averageRating;
    if (specializations != null) {
      data['specializations'] = specializations!.map((v) => v.toJson()).toList();
    }
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    data['staticPatientCount'] = staticPatientCount;
    return data;
  }
}

class AvaliableAppointments {
  int? id;
  String? doctorId;
  String? day;
  String? time;
  String? date;
  String? createdAt;
  String? updatedAt;

  AvaliableAppointments({
    this.id,
    this.doctorId,
    this.day,
    this.time,
    this.date,
    this.createdAt,
    this.updatedAt,
  });

  AvaliableAppointments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    day = json['day'];
    time = json['time'];
    date = json['date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['day'] = day;
    data['time'] = time;
    data['date'] = date;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Branches {
  int? id;
  String? enterpriseId;
  String? typeAr;
  String? typeEn;
  String? nameAr;
  String? nameEn;
  String? cityId;
  String? areaId;
  List<String>? locationFeatureIds;
  List<String>? insuranceIds;
  String? logo;
  String? specialMarkAr;
  String? specialMarkEn;
  String? papersLicenses;
  String? location;
  String? tax;
  String? registrationNo;
  String? sms;
  String? phone;
  String? about;
  Null? time;
  String? gallery;
  String? hasLab;
  String? hasRadiology;
  String? year;
  String? status;
  String? createdAt;
  String? updatedAt;

  Branches({
    this.id,
    this.enterpriseId,
    this.typeAr,
    this.typeEn,
    this.nameAr,
    this.nameEn,
    this.cityId,
    this.areaId,
    this.locationFeatureIds,
    this.insuranceIds,
    this.logo,
    this.specialMarkAr,
    this.specialMarkEn,
    this.papersLicenses,
    this.location,
    this.tax,
    this.registrationNo,
    this.sms,
    this.phone,
    this.about,
    this.time,
    this.gallery,
    this.hasLab,
    this.hasRadiology,
    this.year,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Branches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enterpriseId = json['enterprise_id'];
    typeAr = json['type_ar'];
    typeEn = json['type_en'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    cityId = json['city_id'];
    areaId = json['area_id'];
    locationFeatureIds = (json['location_feature_ids'] as List<dynamic>?)?.cast<String>();
    insuranceIds = (json['insurance_ids'] as List<dynamic>?)?.cast<String>();
    logo = json['logo'];
    specialMarkAr = json['special_mark_ar'];
    specialMarkEn = json['special_mark_en'];
    papersLicenses = json['papers_licenses'];
    location = json['location'];
    tax = json['tax'];
    registrationNo = json['registration_no'];
    sms = json['sms'];
    phone = json['phone'];
    about = json['about'];
    time = json['time'];
    gallery = json['gallery'];
    hasLab = json['has_lab'];
    hasRadiology = json['has_radiology'];
    year = json['year'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['enterprise_id'] = enterpriseId;
    data['type_ar'] = typeAr;
    data['type_en'] = typeEn;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['city_id'] = cityId;
    data['area_id'] = areaId;
    data['location_feature_ids'] = locationFeatureIds;
    data['insurance_ids'] = insuranceIds;
    data['logo'] = logo;
    data['special_mark_ar'] = specialMarkAr;
    data['special_mark_en'] = specialMarkEn;
    data['papers_licenses'] = papersLicenses;
    data['location'] = location;
    data['tax'] = tax;
    data['registration_no'] = registrationNo;
    data['sms'] = sms;
    data['phone'] = phone;
    data['about'] = about;
    data['time'] = time;
    data['gallery'] = gallery;
    data['has_lab'] = hasLab;
    data['has_radiology'] = hasRadiology;
    data['year'] = year;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Specializations {
  int? id;
  String? nameAr;
  String? nameEn;
  String? icon;
  String? createdAt;
  String? updatedAt;

  Specializations({
    this.id,
    this.nameAr,
    this.nameEn,
    this.icon,
    this.createdAt,
    this.updatedAt,
  });

  Specializations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    icon = json['icon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['icon'] = icon;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Services {
  int? id;
  String? nameAr;
  String? nameEn;
  String? createdAt;
  String? updatedAt;

  Services({
    this.id,
    this.nameAr,
    this.nameEn,
    this.createdAt,
    this.updatedAt,
  });

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
class Area {
  int? id;
  var nameAr;
  var nameEn;
  var cityId;
  var createdAt;
  var updatedAt;

  Area(
      {this.id,
        this.nameAr,
        this.nameEn,
        this.cityId,
        this.createdAt,
        this.updatedAt});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['city_id'] = this.cityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
