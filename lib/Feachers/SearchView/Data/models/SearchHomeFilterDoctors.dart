import 'dart:convert';

class SearchHomeFilterDoctors {
  String? status;
  String? type;
  PaginatedData? data;

  SearchHomeFilterDoctors({this.status, this.type, this.data});

  SearchHomeFilterDoctors.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    type = json['type'];
    data = json['data'] != null ? new PaginatedData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['type'] = this.type;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class PaginatedData {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  PaginatedData(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  PaginatedData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
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
  var ageFrom;
  var ageTo;
  var maxConsultationsPerDay;
  String? consultationDuration;
  String? waitingTime;
  List<String>? specializationIds;
  List<String>? additionalSpecializationIds;
  var serviceIds;
  String? jobTitleAr;
  String? jobTitleEn;
  String? additionalJobTitleAr;
  String? additionalJobTitleEn;
  String? papers;
  String? certificates;
  String? certificateAr;
  String? certificateEn;
  String? expYears;
  String? aboutAr;
  String? aboutEn;
  String? additionalServicesAr;
  String? additionalServicesEn;
  String? price;
  List<String>? insuranceIds;
  String? status;
  String? isTop10;
  String? isVip;
  String? isRecommended;
  var rank;
  var city;
  var area;
  String? createdAt;
  String? updatedAt;
  String? cityId;
  String? areaId;
  String? reviewsAvgRating;
  List<Specializations>? specializations;
  AvaliableAppointments? avaliableAppointments;
  int? reviewCount;
  String? averageRating;
  Enterprise? enterprise;
  Cities? cities;
  Areas? areas;

  Data(
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
        this.waitingTime,
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
        this.expYears,
        this.aboutAr,
        this.aboutEn,
        this.additionalServicesAr,
        this.additionalServicesEn,
        this.price,
        this.insuranceIds,
        this.status,
        this.isTop10,
        this.isVip,
        this.isRecommended,
        this.rank,
        this.city,
        this.area,
        this.createdAt,
        this.updatedAt,
        this.cityId,
        this.areaId,
        this.reviewsAvgRating,
        this.specializations,
        this.avaliableAppointments,
        this.reviewCount,
        this.averageRating,
        this.enterprise,
        this.cities,
        this.areas});

  Data.fromJson(Map<String, dynamic> json) {
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
    waitingTime = json['waiting_time'];
    specializationIds = json['specialization_ids'] != null ? json['specialization_ids'].cast<String>() : [];
    additionalSpecializationIds = json['additional_specialization_ids'] != null ? json['additional_specialization_ids'].cast<String>() : [];
    serviceIds = json['service_ids'];
    jobTitleAr = json['job_title_ar'];
    jobTitleEn = json['job_title_en'];
    additionalJobTitleAr = json['additional_job_title_ar'];
    additionalJobTitleEn = json['additional_job_title_en'];
    papers = json['papers'];
    certificates = json['certificates'];
    certificateAr = json['certificate_ar'];
    certificateEn = json['certificate_en'];
    expYears = json['exp_years'];
    aboutAr = json['about_ar'];
    aboutEn = json['about_en'];
    additionalServicesAr = json['additional_services_ar'];
    additionalServicesEn = json['additional_services_en'];
    price = json['price'];
    insuranceIds = json['insurance_ids'] != null ? json['insurance_ids'].cast<String>() : [];
    status = json['status'];
    isTop10 = json['is_top_10'];
    isVip = json['is_vip'];
    isRecommended = json['is_recommended'];
    rank = json['rank'];
    city = json['city'];
    area = json['area'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cityId = json['city_id'];
    areaId = json['area_id'];
    reviewsAvgRating = json['reviews_avg_rating'];
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
    enterprise = json['enterprise'] != null
        ? new Enterprise.fromJson(json['enterprise'])
        : null;
    cities =
    json['cities'] != null ? new Cities.fromJson(json['cities']) : null;
    areas = json['areas'] != null ? new Areas.fromJson(json['areas']) : null;
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
    data['waiting_time'] = this.waitingTime;
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
    data['exp_years'] = this.expYears;
    data['about_ar'] = this.aboutAr;
    data['about_en'] = this.aboutEn;
    data['additional_services_ar'] = this.additionalServicesAr;
    data['additional_services_en'] = this.additionalServicesEn;
    data['price'] = this.price;
    data['insurance_ids'] = this.insuranceIds;
    data['status'] = this.status;
    data['is_top_10'] = this.isTop10;
    data['is_vip'] = this.isVip;
    data['is_recommended'] = this.isRecommended;
    data['rank'] = this.rank;
    data['city'] = this.city;
    data['area'] = this.area;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['city_id'] = this.cityId;
    data['area_id'] = this.areaId;
    data['reviews_avg_rating'] = this.reviewsAvgRating;
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
      data['enterprise'] = this.enterprise!.toJson();
    }
    if (this.cities != null) {
      data['cities'] = this.cities!.toJson();
    }
    if (this.areas != null) {
      data['areas'] = this.areas!.toJson();
    }
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
  String? isMostSelected;

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
  int? id;
  String? doctorId;
  String? enterpriseId;
  String? day;
  String? time;
  String? date;
  String? isActive;
  String? createdAt;
  String? updatedAt;

  AvaliableAppointments(
      {this.id,
        this.doctorId,
        this.enterpriseId,
        this.day,
        this.time,
        this.date,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  AvaliableAppointments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    enterpriseId = json['enterprise_id'];
    day = json['day'];
    time = json['time'];
    date = json['date'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor_id'] = this.doctorId;
    data['enterprise_id'] = this.enterpriseId;
    data['day'] = this.day;
    data['time'] = this.time;
    data['date'] = this.date;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Enterprise {
  String? nameAr;
  String? nameEn;
  String? logo;

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

class Cities {
  int? id;
  String? categoryAr;
  String? categoryEn;
  String? nameAr;
  String? nameEn;
  String? createdAt;
  String? updatedAt;
  String? status;

  Cities(
      {this.id,
        this.categoryAr,
        this.categoryEn,
        this.nameAr,
        this.nameEn,
        this.createdAt,
        this.updatedAt,
        this.status});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryAr = json['category_ar'];
    categoryEn = json['category_en'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
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
    data['status'] = this.status;
    return data;
  }
}

class Areas {
  int? id;
  String? nameAr;
  String? nameEn;
  String? cityId;
  String? createdAt;
  String? updatedAt;
  String? status;

  Areas(
      {this.id,
        this.nameAr,
        this.nameEn,
        this.cityId,
        this.createdAt,
        this.updatedAt,
        this.status});

  Areas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['city_id'] = this.cityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
