/*
class AllRecomendedDoctors {
  List<Doctors>? doctors;
  var status;

  AllRecomendedDoctors({this.doctors, this.status});

  AllRecomendedDoctors.fromJson(Map<String, dynamic> json) {
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
  var insuranceIds;
  var branchIds;
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
  AvaliableAppointments? avaliableAppointments;
  var reviewCount;
 var averageRating;
  List<Enterprise>? enterprise;

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
        this.specializations,
        this.avaliableAppointments,
        this.reviewCount,
        this.averageRating,
        this.enterprise});

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
    insuranceIds = json['insurance_ids'];
    branchIds = json['branch_ids'];
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
    avaliableAppointments = json['avaliable_appointments'] != null
        ? new AvaliableAppointments.fromJson(json['avaliable_appointments'])
        : null;
    reviewCount = json['reviewCount'];
    averageRating = json['averageRating'];
    if (json['enterprise'] != null) {
      enterprise = <Enterprise>[];
      json['enterprise'].forEach((v) {
        enterprise!.add(new Enterprise.fromJson(v));
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
    if (this.avaliableAppointments != null) {
      data['avaliable_appointments'] = this.avaliableAppointments!.toJson();
    }
    data['reviewCount'] = this.reviewCount;
    data['averageRating'] = this.averageRating;
    if (this.enterprise != null) {
      data['enterprise'] = this.enterprise!.map((v) => v.toJson()).toList();
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

class AvaliableAppointments {
  var id;
 var doctorId;
 var day;
 var time;
 var date;
 var createdAt;
 var updatedAt;

  AvaliableAppointments(
      {this.id,
        this.doctorId,
        this.day,
        this.time,
        this.date,
        this.createdAt,
        this.updatedAt});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor_id'] = this.doctorId;
    data['day'] = this.day;
    data['time'] = this.time;
    data['date'] = this.date;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Enterprise {
 var nameAr;
 var nameEn;

  Enterprise({this.nameAr, this.nameEn});

  Enterprise.fromJson(Map<String, dynamic> json) {
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    return data;
  }
}
*/
/*class AllRecommendedDoctors {
  List<Doctor>? doctors;
  var status;

  AllRecommendedDoctors({this.doctors, this.status});

  AllRecommendedDoctors.fromJson(Map<String, dynamic> json) {
    if (json['doctors'] != null) {
      doctors = <Doctor>[];
      json['doctors'].forEach((v) {
        doctors!.add(Doctor.fromJson(v));
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
  var ageFrom;
  var ageTo;
 var maxConsultationsPerDay;
  var consultationDuration;

 var jobTitleAr;
 var jobTitleEn;
 var additionalJobTitleAr;
 var additionalJobTitleEn;
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
  List<Specialization>? specializations;
  AvailableAppointment? availableAppointments;
  var reviewCount;
 var averageRating;
  Enterprise? enterprise;

  Doctor(
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

        this.jobTitleAr,
        this.jobTitleEn,
        this.additionalJobTitleAr,
        this.additionalJobTitleEn,
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
        this.availableAppointments,
        this.reviewCount,
        this.averageRating,
        this.enterprise});

  Doctor.fromJson(Map<String, dynamic> json) {
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

    jobTitleAr = json['job_title_ar'];
    jobTitleEn = json['job_title_en'];
    additionalJobTitleAr = json['additional_job_title_ar'];
    additionalJobTitleEn = json['additional_job_title_en'];
    certificateAr = json['certificate_ar'];
    certificateEn = json['certificate_en'];
    aboutAr = json['about_ar'];
    aboutEn = json['about_en'];
    additionalServicesAr = json['additional_services_ar'];
    additionalServicesEn = json['additional_services_en'];
    price = json['price'];
    insuranceIds = json['insurance_ids'] != null ? List<String>.from(json['insurance_ids']) : null;
    branchIds = json['branch_ids'] != null ? List<String>.from(json['branch_ids']) : null;
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
    specializations = json['specializations'] != null
        ? List<Specialization>.from(json['specializations'].map((v) => Specialization.fromJson(v)))
        : null;
    availableAppointments = json['avaliable_appointments'] != null
        ? AvailableAppointment.fromJson(json['avaliable_appointments'])
        : null;
    reviewCount = json['reviewCount'];
    averageRating = json['averageRating'];
    enterprise = json['enterprise'] != null
        ? Enterprise.fromJson(json['enterprise'])
        : null;
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

    data['job_title_ar'] = this.jobTitleAr;
    data['job_title_en'] = this.jobTitleEn;
    data['additional_job_title_ar'] = this.additionalJobTitleAr;
    data['additional_job_title_en'] = this.additionalJobTitleEn;
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
      data['specializations'] = this.specializations!.map((v) => v.toJson()).toList();
    }
    if (this.availableAppointments != null) {
      data['avaliable_appointments'] = this.availableAppointments!.toJson();
    }
    data['reviewCount'] = this.reviewCount;
    data['averageRating'] = this.averageRating;
    if (this.enterprise != null) {
      data['enterprise'] = this.enterprise!.toJson();
    }
    return data;
  }
}

class Specialization {
  var id;
 var nameAr;
 var nameEn;
 var icon;
 var createdAt;
 var updatedAt;
 var isMostSelected;

  Specialization(
      {this.id,
        this.nameAr,
        this.nameEn,
        this.icon,
        this.createdAt,
        this.updatedAt,
        this.isMostSelected});

  Specialization.fromJson(Map<String, dynamic> json) {
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

class AvailableAppointment {
  var id;
 var doctorId;
 var day;
 var time;
 var date;
 var createdAt;
 var updatedAt;

  AvailableAppointment(
      {this.id,
        this.doctorId,
        this.day,
        this.time,
        this.date,
        this.createdAt,
        this.updatedAt});

  AvailableAppointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    day = json['day'];
    time = json['time'];
    date = json['date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor_id'] = this.doctorId;
    data['day'] = this.day;
    data['time'] = this.time;
    data['date'] = this.date;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Enterprise {
 var nameAr;
 var nameEn;

  Enterprise({this.nameAr, this.nameEn});

  Enterprise.fromJson(Map<String, dynamic> json) {
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    return data;
  }
}*/



class AllRecommendedDoctors {
  List<Doctor>? doctors;
  var status;

  AllRecommendedDoctors({this.doctors, this.status});

  AllRecommendedDoctors.fromJson(Map<String, dynamic> json) {
    if (json['doctors'] != null) {
      doctors = <Doctor>[];
      json['doctors'].forEach((v) {
        doctors!.add(Doctor.fromJson(v));
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

class Doctor {
  var id;
  var enterpriseId;
  var img;
  var nameAr;
  var nameEn;
  var lastNameAr;
  var lastNameEn;
  var email;
  var isIntegratedClinic;
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
  var jobTitleAr;
  var jobTitleEn;
  var additionalJobTitleAr;
  var additionalJobTitleEn;
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
  List<Specialization>? specializations;
  AvailableAppointment? availableAppointments;
  var reviewCount;
  var averageRating;
  Enterprise? enterprise;
  List<City>? cities;
  List<Area>? areas;

  Doctor(
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
        this.isIntegratedClinic,
        this.adults,
        this.ageFrom,
        this.ageTo,
        this.maxConsultationsPerDay,
        this.consultationDuration,
        this.jobTitleAr,
        this.jobTitleEn,
        this.additionalJobTitleAr,
        this.additionalJobTitleEn,
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
        this.availableAppointments,
        this.reviewCount,
        this.averageRating,
        this.enterprise,
        this.cities,
        this.areas});

/*
  Doctor.fromJson(Map<String, dynamic> json) {
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
    jobTitleAr = json['job_title_ar'];
    jobTitleEn = json['job_title_en'];
    additionalJobTitleAr = json['additional_job_title_ar'];
    additionalJobTitleEn = json['additional_job_title_en'];
    certificateAr = json['certificate_ar'];
    certificateEn = json['certificate_en'];
    aboutAr = json['about_ar'];
    aboutEn = json['about_en'];
    additionalServicesAr = json['additional_services_ar'];
    additionalServicesEn = json['additional_services_en'];
    price = json['price'];
    insuranceIds = json['insurance_ids'] != null ? List<String>.from(json['insurance_ids']) : null;
    branchIds = json['branch_ids'] != null ? List<String>.from(json['branch_ids']) : null;
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
    specializations = json['specializations'] != null
        ? List<Specialization>.from(json['specializations'].map((v) => Specialization.fromJson(v)))
        : null;
    availableAppointments = json['avaliable_appointments'] != null
        ? AvailableAppointment.fromJson(json['avaliable_appointments'])
        : null;
    reviewCount = json['reviewCount'];
    averageRating = json['averageRating'];
    enterprise = json['enterprise'] != null
        ? Enterprise.fromJson(json['enterprise'])
        : null;
    cities = json['cities'] != null
        ? List<City>.from(json['cities'].map((v) => City.fromJson(v)))
        : null;
    areas = json['areas'] != null
        ? List<Area>.from(json['areas'].map((v) => Area.fromJson(v)))
        : null;
  }
*/
  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enterpriseId = json['enterprise_id'];
    img = json['img'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    isIntegratedClinic = json['isIntegratedClinic'];
    lastNameAr = json['last_name_ar'];
    lastNameEn = json['last_name_en'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    graduationYear = json['graduation_year'];
    idNumber = json['id_number'];
    children = json['children'] == "true";
    adults = json['adults'] == "true";
    ageFrom = int.tryParse(json['age_from'] ?? '0');
    ageTo = int.tryParse(json['age_to'] ?? '0');
    maxConsultationsPerDay = int.tryParse(json['max_consultations_per_day'] ?? '0');
    consultationDuration = int.tryParse(json['consultation_duration'] ?? '0');
    jobTitleAr = json['job_title_ar'];
    jobTitleEn = json['job_title_en'];
    additionalJobTitleAr = json['additional_job_title_ar'];
    additionalJobTitleEn = json['additional_job_title_en'];
    certificateAr = json['certificate_ar'];
    certificateEn = json['certificate_en'];
    aboutAr = json['about_ar'];
    aboutEn = json['about_en'];
    additionalServicesAr = json['additional_services_ar'];
    additionalServicesEn = json['additional_services_en'];
    price = json['price'];
    insuranceIds = json['insurance_ids'] != null ? List<String>.from(json['insurance_ids']) : null;
    branchIds = json['branch_ids'] != null ? List<String>.from(json['branch_ids']) : null;
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
    specializations = json['specializations'] != null
        ? List<Specialization>.from(json['specializations'].map((v) => Specialization.fromJson(v)))
        : null;
    availableAppointments = json['avaliable_appointments'] != null
        ? AvailableAppointment.fromJson(json['avaliable_appointments'])
        : null;
    reviewCount = json['reviewCount'];
    averageRating = json['averageRating'];
    enterprise = json['enterprise'] != null
        ? Enterprise.fromJson(json['enterprise'])
        : null;
    cities = json['cities'] != null
        ? [City.fromJson(json['cities'])]
        : null;
    areas = json['areas'] != null
        ? [Area.fromJson(json['areas'])]
        : null;
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
    data['isIntegratedClinic'] = this.isIntegratedClinic;
    data['graduation_year'] = this.graduationYear;
    data['id_number'] = this.idNumber;
    data['children'] = this.children;
    data['adults'] = this.adults;
    data['age_from'] = this.ageFrom;
    data['age_to'] = this.ageTo;
    data['max_consultations_per_day'] = this.maxConsultationsPerDay;
    data['consultation_duration'] = this.consultationDuration;
    data['job_title_ar'] = this.jobTitleAr;
    data['job_title_en'] = this.jobTitleEn;
    data['additional_job_title_ar'] = this.additionalJobTitleAr;
    data['additional_job_title_en'] = this.additionalJobTitleEn;
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
      data['specializations'] = this.specializations!.map((v) => v.toJson()).toList();
    }
    if (this.availableAppointments != null) {
      data['avaliable_appointments'] = this.availableAppointments!.toJson();
    }
    data['reviewCount'] = this.reviewCount;
    data['averageRating'] = this.averageRating;
    if (this.enterprise != null) {
      data['enterprise'] = this.enterprise!.toJson();
    }
    if (this.cities != null) {
      data['cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    if (this.areas != null) {
      data['areas'] = this.areas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Specialization {
  var id;
  var nameAr;
  var nameEn;
  var icon;
  var createdAt;
  var updatedAt;
  var isMostSelected;

  Specialization(
      {this.id,
        this.nameAr,
        this.nameEn,
        this.icon,
        this.createdAt,
        this.updatedAt,
        this.isMostSelected});

  Specialization.fromJson(Map<String, dynamic> json) {
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

class AvailableAppointment {
  var id;
  var doctorId;
  var day;
  var time;
  var date;
  var createdAt;
  var updatedAt;

  AvailableAppointment(
      {this.id,
        this.doctorId,
        this.day,
        this.time,
        this.date,
        this.createdAt,
        this.updatedAt});

  AvailableAppointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    day = json['day'];
    time = json['time'];
    date = json['date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor_id'] = this.doctorId;
    data['day'] = this.day;
    data['time'] = this.time;
    data['date'] = this.date;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Enterprise {
  var nameAr;
  var nameEn;
  var logo;

  Enterprise({this.nameAr, this.nameEn, this.logo});

  Enterprise.fromJson(Map<String, dynamic> json) {
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['logo'] = this.logo;
    return data;
  }
}

class City {
  var id;
  String? categoryAr;
  String? categoryEn;
  String? nameAr;
  String? nameEn;
  String? createdAt;
  String? updatedAt;

  City({this.id, this.categoryAr, this.categoryEn, this.nameAr, this.nameEn, this.createdAt, this.updatedAt});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryAr = json['category_ar'];
    categoryEn = json['category_en'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_ar'] = this.categoryAr;
    data['category_en'] = this.categoryEn;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Area {
  var id;
  String? nameAr;
  String? nameEn;
  var cityId;
  String? createdAt;
  String? updatedAt;

  Area({this.id, this.nameAr, this.nameEn, this.cityId, this.createdAt, this.updatedAt});

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


