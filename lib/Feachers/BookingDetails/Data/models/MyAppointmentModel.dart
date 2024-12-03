class MyAppointmentModel {
  List<Appointments>? appointments;
  int? status;
  bool? is_entry_is_first_come_first_served;
  Doctor? doctor;

  MyAppointmentModel({this.appointments, this.status, this.doctor});

  MyAppointmentModel.fromJson(Map<String, dynamic> json) {
    if (json['appointments'] != null) {
      appointments = <Appointments>[];
      json['appointments'].forEach((v) {
        appointments!.add(Appointments.fromJson(v));
      });
    } else {
      appointments = [];
    }
    status = json['status'] ?? 0;
    is_entry_is_first_come_first_served = json['is_entry_is_first_come_first_served'] ?? false;
    doctor = json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (appointments != null) {
      data['appointments'] = appointments!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['is_entry_is_first_come_first_served'] = is_entry_is_first_come_first_served;
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    return data;
  }
}

class Appointments {
  int? id;
  String? doctorId;
  String? enterpriseId;
  String? day;
  String? time;
  String? from;
  String? to;
  String? date;
  String? isActive;
  String? createdAt;
  String? updatedAt;

  Appointments({
    this.id,
    this.doctorId,
    this.enterpriseId,
    this.day,
    this.time,
    this.date,
    this.from,
    this.to,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  Appointments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    enterpriseId = json['enterprise_id'];
    day = json['day'];
    time = json['time'];
    from = json['from'];
    to = json['to'];
    date = json['date'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['enterprise_id'] = enterpriseId;
    data['day'] = day;
    data['time'] = time;
    data['date'] = date;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['from'] = from;
    data['to'] = to;
    return data;
  }
}

class Doctor {
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
  String? cityIds;
  String? areaIds;
  List<String>? specializationIds;
  List<String>? additionalSpecializationIds;
  List<String>? serviceIds;
  String? jobTitleAr;
  String? jobTitleEn;
  String? additionalJobTitleAr;
  String? additionalJobTitleEn;
  String? papers;
  String? expYears;
  String? aboutAr;
  String? aboutEn;
  String? price;
  List<String>? insuranceIds;
  List<String>? branchIds;
  String? status;
  String? isTop10;
  String? isVip;
  String? isRecommended;
  String? city;
  String? createdAt;
  String? updatedAt;

  Doctor({
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
    this.cityIds,
    this.areaIds,
    this.specializationIds,
    this.additionalSpecializationIds,
    this.serviceIds,
    this.jobTitleAr,
    this.jobTitleEn,
    this.additionalJobTitleAr,
    this.additionalJobTitleEn,
    this.papers,
    this.expYears,
    this.aboutAr,
    this.aboutEn,
    this.price,
    this.insuranceIds,
    this.branchIds,
    this.status,
    this.isTop10,
    this.isVip,
    this.isRecommended,
    this.city,
    this.createdAt,
    this.updatedAt,
  });

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
    cityIds = json['city_ids'];
    areaIds = json['area_ids'];
    specializationIds = json['specialization_ids'] != null
        ? List<String>.from(json['specialization_ids'])
        : [];
    additionalSpecializationIds = json['additional_specialization_ids'] != null
        ? List<String>.from(json['additional_specialization_ids'])
        : [];
    serviceIds = json['service_ids'] != null
        ? List<String>.from(json['service_ids'])
        : [];
    jobTitleAr = json['job_title_ar'];
    jobTitleEn = json['job_title_en'];
    additionalJobTitleAr = json['additional_job_title_ar'];
    additionalJobTitleEn = json['additional_job_title_en'];
    papers = json['papers'];
    expYears = json['exp_years'];
    aboutAr = json['about_ar'];
    aboutEn = json['about_en'];
    price = json['price'];
    insuranceIds = json['insurance_ids'] != null
        ? List<String>.from(json['insurance_ids'])
        : [];
    branchIds = json['branch_ids'] != null
        ? List<String>.from(json['branch_ids'])
        : [];
    status = json['status'];
    isTop10 = json['is_top_10'];
    isVip = json['is_vip'];
    isRecommended = json['is_recommended'];
    city = json['city'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['city_ids'] = cityIds;
    data['area_ids'] = areaIds;
    data['specialization_ids'] = specializationIds ?? [];
    data['additional_specialization_ids'] = additionalSpecializationIds ?? [];
    data['service_ids'] = serviceIds ?? [];
    data['job_title_ar'] = jobTitleAr;
    data['job_title_en'] = jobTitleEn;
    data['additional_job_title_ar'] = additionalJobTitleAr;
    data['additional_job_title_en'] = additionalJobTitleEn;
    data['papers'] = papers;
    data['exp_years'] = expYears;
    data['about_ar'] = aboutAr;
    data['about_en'] = aboutEn;
    data['price'] = price;
    data['insurance_ids'] = insuranceIds ?? [];
    data['branch_ids'] = branchIds ?? [];
    data['status'] = status;
    data['is_top_10'] = isTop10;
    data['is_vip'] = isVip;
    data['is_recommended'] = isRecommended;
    data['city'] = city;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
