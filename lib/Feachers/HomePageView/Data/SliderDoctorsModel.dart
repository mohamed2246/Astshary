/*
class SliderDoctorsModel {
  List<Doctors>? doctors;
  var status;

  SliderDoctorsModel({this.doctors, this.status});

  SliderDoctorsModel.fromJson(Map<String, dynamic> json) {
    if (json['doctors'] != null) {
      doctors = <Doctors>[];
      json['doctors'].forEach((v) {
        doctors!.add(new Doctors.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doctors != null) {
      data['doctors'] = this.doctors!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Doctors {
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
  Null? ageFrom;
  Null? ageTo;
  var maxConsultationsPerDay;
  Null? consultationDuration;
  List<String>? specializationIds;
  List<String>? additionalSpecializationIds;
  List<String>? serviceIds;
  var jobTitleAr;
  var jobTitleEn;
  var additionalJobTitleAr;
  var additionalJobTitleEn;
  var papers;
  var certificates;
  var certificateAr;
  var certificateEn;
  var aboutAr;
  var aboutEn;
  var additionalServicesAr;
  var additionalServicesEn;
  var price;
  List<String>? insuranceIds;
  List<String>? branchIds;
  var status;
  var createdAt;
  var updatedAt;
  var isTop10;
  var isVip;
  var isRecommended;
  var rank;
  var city;
  var area;
  var acceptsSameDayAppointments;
  var expYears;
  List<Specializations>? specializations;

  Doctors(
      {this.id,
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
        this.ageTo,
        this.maxConsultationsPerDay,
        this.consultationDuration,
        this.specializationIds,
        this.additionalSpecializationIds,
        this.serviceIds,
        this.jobTitleAr,
        this.jobTitleEn,
        this.additionalJobTitleAr,
        this.additionalJobTitleEn,
        this.papers,
        this.certificates,
        this.certificateAr,
        this.certificateEn,
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
        this.expYears,
        this.specializations});

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
    consultationDuration = json['consultation_duration'];
    specializationIds = json['specialization_ids'].cast<String>();
    additionalSpecializationIds =
        json['additional_specialization_ids'].cast<String>();
    serviceIds = json['service_ids'].cast<String>();
    jobTitleAr = json['job_title_ar'];
    jobTitleEn = json['job_title_en'];
    additionalJobTitleAr = json['additional_job_title_ar'];
    additionalJobTitleEn = json['additional_job_title_en'];
    papers = json['papers'];
    certificates = json['certificates'];
    certificateAr = json['certificate_ar'];
    certificateEn = json['certificate_en'];
    aboutAr = json['about_ar'];
    aboutEn = json['about_en'];
    additionalServicesAr = json['additional_services_ar'];
    additionalServicesEn = json['additional_services_en'];
    price = json['price'];
    insuranceIds = json['insurance_ids'].cast<String>();
    branchIds = json['branch_ids'].cast<String>();
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isTop10 = json['is_top_10'];
    isVip = json['is_vip'];
    isRecommended = json['is_recommended'];
    rank = json['rank'];
    city = json['city'];
    area = json['area'];
    acceptsSameDayAppointments = json['accepts_same_day_appointments'];
    expYears = json['exp_years'];
    if (json['specializations'] != null) {
      specializations = <Specializations>[];
      json['specializations'].forEach((v) {
        specializations!.add(new Specializations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['enterprise_id'] = this.enterpriseId;
    data['img'] = this.img;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['last_name_ar'] = this.lastNameAr;
    data['last_name_en'] = this.lastNameEn;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['gender'] = this.gender;
    data['graduation_year'] = this.graduationYear;
    data['id_number'] = this.idNumber;
    data['children'] = this.children;
    data['adults'] = this.adults;
    data['age_from'] = this.ageFrom;
    data['age_to'] = this.ageTo;
    data['max_consultations_per_day'] = this.maxConsultationsPerDay;
    data['consultation_duration'] = this.consultationDuration;
    data['specialization_ids'] = this.specializationIds;
    data['additional_specialization_ids'] = this.additionalSpecializationIds;
    data['service_ids'] = this.serviceIds;
    data['job_title_ar'] = this.jobTitleAr;
    data['job_title_en'] = this.jobTitleEn;
    data['additional_job_title_ar'] = this.additionalJobTitleAr;
    data['additional_job_title_en'] = this.additionalJobTitleEn;
    data['papers'] = this.papers;
    data['certificates'] = this.certificates;
    data['certificate_ar'] = this.certificateAr;
    data['certificate_en'] = this.certificateEn;
    data['about_ar'] = this.aboutAr;
    data['about_en'] = this.aboutEn;
    data['additional_services_ar'] = this.additionalServicesAr;
    data['additional_services_en'] = this.additionalServicesEn;
    data['price'] = this.price;
    data['insurance_ids'] = this.insuranceIds;
    data['branch_ids'] = this.branchIds;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_top_10'] = this.isTop10;
    data['is_vip'] = this.isVip;
    data['is_recommended'] = this.isRecommended;
    data['rank'] = this.rank;
    data['city'] = this.city;
    data['area'] = this.area;
    data['accepts_same_day_appointments'] = this.acceptsSameDayAppointments;
    data['exp_years'] = this.expYears;
    if (this.specializations != null) {
      data['specializations'] =
          this.specializations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Specializations {
  var id;
  var nameAr;
  var nameEn;
  var icon;
  var createdAt;
  var updatedAt;
  var isMostSelected;

  Specializations(
      {this.id,
        this.nameAr,
        this.nameEn,
        this.icon,
        this.createdAt,
        this.updatedAt,
        this.isMostSelected});

  Specializations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    icon = json['icon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isMostSelected = json['is_most_selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['icon'] = this.icon;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_most_selected'] = this.isMostSelected;
    return data;
  }
}
*/



class SliderDoctorsModel {
  List<Doctors>? doctors;
  var status;

  SliderDoctorsModel({this.doctors, this.status});

  SliderDoctorsModel.fromJson(Map<String, dynamic> json) {
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
  var ageFrom;
  var ageTo;
  var maxConsultationsPerDay;
  var consultationDuration;
  List<String>? specializationIds;
  List<String>? additionalSpecializationIds;
  List<String>? serviceIds;
  var jobTitleAr;
  var jobTitleEn;
  var additionalJobTitleAr;
  var additionalJobTitleEn;
  var papers;
  var certificates;
  var certificateAr;
  var certificateEn;
  var aboutAr;
  var aboutEn;
  var additionalServicesAr;
  var additionalServicesEn;
  var price;
  List<String>? insuranceIds;
  List<String>? branchIds;
  var status;
  var createdAt;
  var updatedAt;
  var isTop10;
  var isVip;
  var isRecommended;
  var rank;
  var city;
  var area;
  var acceptsSameDayAppointments;
  var expYears;
  List<Specializations>? specializations;

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
    this.ageTo,
    this.maxConsultationsPerDay,
    this.consultationDuration,
    this.specializationIds,
    this.additionalSpecializationIds,
    this.serviceIds,
    this.jobTitleAr,
    this.jobTitleEn,
    this.additionalJobTitleAr,
    this.additionalJobTitleEn,
    this.papers,
    this.certificates,
    this.certificateAr,
    this.certificateEn,
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
    this.expYears,
    this.specializations,
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
    consultationDuration = json['consultation_duration'];
    specializationIds = (json['specialization_ids'] as List?)?.map((e) => e.toString()).toList();
    additionalSpecializationIds = (json['additional_specialization_ids'] as List?)?.map((e) => e.toString()).toList();
    serviceIds = (json['service_ids'] as List?)?.map((e) => e.toString()).toList();
    jobTitleAr = json['job_title_ar'];
    jobTitleEn = json['job_title_en'];
    additionalJobTitleAr = json['additional_job_title_ar'];
    additionalJobTitleEn = json['additional_job_title_en'];
    papers = json['papers'];
    certificates = json['certificates'];
    certificateAr = json['certificate_ar'];
    certificateEn = json['certificate_en'];
    aboutAr = json['about_ar'];
    aboutEn = json['about_en'];
    additionalServicesAr = json['additional_services_ar'];
    additionalServicesEn = json['additional_services_en'];
    price = json['price'];
    insuranceIds = (json['insurance_ids'] as List?)?.map((e) => e.toString()).toList();
    branchIds = (json['branch_ids'] as List?)?.map((e) => e.toString()).toList();
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isTop10 = json['is_top_10'];
    isVip = json['is_vip'];
    isRecommended = json['is_recommended'];
    rank = json['rank'];
    city = json['city'];
    area = json['area'];
    acceptsSameDayAppointments = json['accepts_same_day_appointments'];
    expYears = json['exp_years'];
    if (json['specializations'] != null) {
      specializations = <Specializations>[];
      json['specializations'].forEach((v) {
        specializations!.add(Specializations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['enterprise_id'] = enterpriseId;
    data['img'] = img;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
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
    data['consultation_duration'] = consultationDuration;
    data['specialization_ids'] = specializationIds;
    data['additional_specialization_ids'] = additionalSpecializationIds;
    data['service_ids'] = serviceIds;
    data['job_title_ar'] = jobTitleAr;
    data['job_title_en'] = jobTitleEn;
    data['additional_job_title_ar'] = additionalJobTitleAr;
    data['additional_job_title_en'] = additionalJobTitleEn;
    data['papers'] = papers;
    data['certificates'] = certificates;
    data['certificate_ar'] = certificateAr;
    data['certificate_en'] = certificateEn;
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
    data['exp_years'] = expYears;
    if (specializations != null) {
      data['specializations'] = specializations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Specializations {
  var id;
  var nameAr;
  var nameEn;
  var icon;
  var createdAt;
  var updatedAt;
  var isMostSelected;

  Specializations({
    this.id,
    this.nameAr,
    this.nameEn,
    this.icon,
    this.createdAt,
    this.updatedAt,
    this.isMostSelected,
  });

  Specializations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    icon = json['icon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isMostSelected = json['is_most_selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['name_en'] = nameEn;
    data['icon'] = icon;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_most_selected'] = isMostSelected;
    return data;
  }
}
