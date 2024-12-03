/*
class AllReviewsModel {
  Doctor? doctor;
  List<Reviews>? reviews;
  StarPercentages? starPercentages;
  var status;

  AllReviewsModel(
      {this.doctor, this.reviews, this.starPercentages, this.status});

  AllReviewsModel.fromJson(Map<String, dynamic> json) {
    doctor =
    json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    starPercentages = json['starPercentages'] != null
        ? new StarPercentages.fromJson(json['starPercentages'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    if (this.starPercentages != null) {
      data['starPercentages'] = this.starPercentages!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Doctor {
  var id;
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

  List<String>? specializationIds;
  List<String>? additionalSpecializationIds;
  List<String>? serviceIds;
  String? jobTitleAr;
  String? jobTitleEn;
  String? additionalJobTitleAr;
  String? additionalJobTitleEn;
  String? papers;
  String? certificates;
  String? certificateAr;
  String? certificateEn;
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
  String? expYears;
  var reviewCount;
  String? averageRating;

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
        this.reviewCount,
        this.averageRating});

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
    reviewCount = json['reviewCount'];
    averageRating = json['averageRating'];
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
    data['reviewCount'] = this.reviewCount;
    data['averageRating'] = this.averageRating;
    return data;
  }
}

class Reviews {
  var id;
  String? rating;
  String? comment;
  String? userName;
  String? staticImage;
  String? timeAgo;
  String? timeAgoEn;

  Reviews(
      {this.id,
        this.rating,
        this.comment,
        this.userName,
        this.staticImage,
        this.timeAgo,
        this.timeAgoEn});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rating = json['rating'];
    comment = json['comment'];
    userName = json['user_name'];
    staticImage = json['static_image'];
    timeAgo = json['time_ago'];
    timeAgoEn = json['time_ago_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['user_name'] = this.userName;
    data['static_image'] = this.staticImage;
    data['time_ago'] = this.timeAgo;
    data['time_ago_en'] = this.timeAgoEn;
    return data;
  }
}

class StarPercentages {
  var i1;
  var i2;
  var i3;
  var i4;
  var i5;

  StarPercentages({this.i1, this.i2, this.i3, this.i4, this.i5});

  StarPercentages.fromJson(Map<String, dynamic> json) {
    i1 = json['1'];
    i2 = json['2'];
    i3 = json['3'];
    i4 = json['4'];
    i5 = json['5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.i1;
    data['2'] = this.i2;
    data['3'] = this.i3;
    data['4'] = this.i4;
    data['5'] = this.i5;
    return data;
  }
}
*/

class AllReviewsModel {
  Doctor? doctor;
  List<Reviews>? reviews;
  StarPercentages? starPercentages;
  var status;
  var itCanMakeReview;
  var doctor_appointment_id ;

  AllReviewsModel(
      {this.doctor, this.reviews, this.starPercentages, this.status , this.itCanMakeReview , this.doctor_appointment_id});

  AllReviewsModel.fromJson(Map<String, dynamic> json) {
    doctor =
    json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
    starPercentages = json['starPercentages'] != null
        ? StarPercentages.fromJson(json['starPercentages'])
        : null;
    status = json['status'];
    itCanMakeReview = json['itCanMakeReview'];
    doctor_appointment_id = json['doctor_appointment_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    if (starPercentages != null) {
      data['starPercentages'] = starPercentages!.toJson();
    }
    data['itCanMakeReview'] = itCanMakeReview;
    data['doctor_appointment_id'] = doctor_appointment_id;
    return data;
  }
}

class Doctor {
  var id;
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
  String? consultationDuration;
  List<String>? specializationIds;
  List<String>? additionalSpecializationIds;
  List<String>? serviceIds;
  String? jobTitleAr;
  String? jobTitleEn;
  String? additionalJobTitleAr;
  String? additionalJobTitleEn;
  String? papers;
  String? certificates;
  String? certificateAr;
  String? certificateEn;
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
  String? expYears;
  var reviewCount;
  String? averageRating;

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
        this.reviewCount,
        this.averageRating});

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
    specializationIds = json['specialization_ids'] != null ? List<String>.from(json['specialization_ids']) : null;
    additionalSpecializationIds = json['additional_specialization_ids'] != null ? List<String>.from(json['additional_specialization_ids']) : null;
    serviceIds = json['service_ids'] != null ? List<String>.from(json['service_ids']) : null;
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
    reviewCount = json['reviewCount'];
    averageRating = json['averageRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    data['reviewCount'] = reviewCount;
    data['averageRating'] = averageRating;
    return data;
  }
}

class Reviews {
  var id;
  String? rating;
  String? comment;
  String? audio;
  String? userName;
  String? staticImage;
  String? timeAgo;
  String? timeAgoEn;

  Reviews(
      {this.id,
        this.rating,
        this.comment,
        this.userName,
        this.audio,
        this.staticImage,
        this.timeAgo,
        this.timeAgoEn});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rating = json['rating'];
    comment = json['comment'];
    userName = json['user_name'];
    staticImage = json['static_image'];
    audio = json['audio'];
    timeAgo = json['time_ago'];
    timeAgoEn = json['time_ago_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['rating'] = rating;
    data['comment'] = comment;
    data['user_name'] = userName;
    data['static_image'] = staticImage;
    data['audio'] = audio;
    data['time_ago'] = timeAgo;
    data['time_ago_en'] = timeAgoEn;
    return data;
  }
}

class StarPercentages {
  var i1;
  var i2;
  var i3;
  var i4;
  var i5;

  StarPercentages({this.i1, this.i2, this.i3, this.i4, this.i5});

  StarPercentages.fromJson(Map<String, dynamic> json) {
    i1 = json['1'];
    i2 = json['2'];
    i3 = json['3'];
    i4 = json['4'];
    i5 = json['5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['1'] = i1;
    data['2'] = i2;
    data['3'] = i3;
    data['4'] = i4;
    data['5'] = i5;
    return data;
  }
}

