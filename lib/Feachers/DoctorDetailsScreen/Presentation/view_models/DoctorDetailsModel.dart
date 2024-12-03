
import 'dart:convert';

/*
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
  var city_id;
  var area_id;
  Videos? videos;
  var gender;
  var graduationYear;
  var idNumber;
  var children;
  var adults;
  var maxConsultationsPerDay;
  var specializationIds;
  var additionalSpecializationIds;
  var serviceIds;
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
  List<Specialization>? specializations;
  List<Specialization>? additional_specializations;
  List<Service>? allServices; // Add this field

  var countReviewsWithRating5;
  var countReviewsWithRating4;
  var countReviewsWithRating3;
  var countReviewsWithRating2;
  var countReviewsWithRating1;
  var reviewCount;
  var averageRating;
  List<FormattedReview?>? formatted5Reviews;
  var staticPatientCount;
  var availableAppointments;
  var waitingTime;
   
  var experienceYears;
  List<Branch>? branches; // Change this line to specify the type
  Enterprise enterprise;
  List<Insurance?>? insurances;

  Doctor({
    this.id,
    this.allServices, // Add this parameter

    this.enterpriseId,
    this.img,
    this.nameAr,
    this.videos,
    this.nameEn,
    this.lastNameAr,
    this.lastNameEn,
    this.email,
    this.mobile,
    this.city_id,
    this.area_id,
    this.gender,
    this.graduationYear,
    this.idNumber,
    this.children,
    this.adults,
    this.maxConsultationsPerDay,
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
    this.specializations,
    this.additional_specializations,
    this.countReviewsWithRating5,
    this.countReviewsWithRating4,
    this.countReviewsWithRating3,
    this.countReviewsWithRating2,
    this.countReviewsWithRating1,
    this.reviewCount,
    this.averageRating,
    this.formatted5Reviews,
    this.staticPatientCount,
    this.availableAppointments,
    this.waitingTime,
    this.experienceYears,
    this.branches,
    required this.enterprise,
    this.insurances,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      enterpriseId: json['enterprise_id'],
      img: json['img'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      lastNameAr: json['last_name_ar'],
      lastNameEn: json['last_name_en'],
      email: json['email'],
      mobile: json['mobile'],
      videos: json['videos'] != null ? Videos.fromJson(json['videos']) : null,
      city_id: json['city_id'],
      area_id: json['area_id'],
      gender: json['gender'],
      graduationYear: json['graduation_year'],
      idNumber: json['id_number'],
      children: json['children'],
      adults: json['adults'],
      maxConsultationsPerDay: json['max_consultations_per_day'],
      specializationIds: json['specialization_ids'] ?? [],
      additionalSpecializationIds: json['additional_specialization_ids'] ?? [],
      serviceIds: json['service_ids'] ?? [],
      jobTitleAr: json['job_title_ar'],
      jobTitleEn: json['job_title_en'],
      additionalJobTitleAr: json['additional_job_title_ar'],
      additionalJobTitleEn: json['additional_job_title_en'],
      papers: json['papers'],
      certificates: json['certificates'],
      certificateAr: json['certificate_ar'],
      certificateEn: json['certificate_en'],
      aboutAr: json['about_ar'],
      aboutEn: json['about_en'],
      additionalServicesAr: json['additional_services_ar'],
      additionalServicesEn: json['additional_services_en'],
      price: json['price'],
      insuranceIds: json['insurance_ids'] ?? [],
      branchIds: json['branch_ids'] ?? [],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isTop10: json['is_top_10'],
      isVip: json['is_vip'],
      isRecommended: json['is_recommended'],
      rank: json['rank'],
      city: json['city'],
      area: json['area'],
      acceptsSameDayAppointments: json['accepts_same_day_appointments'],

      specializations: (json['specializations'] as List?)
          ?.map((e) => Specialization.fromJson(e as Map<String, dynamic>))
          .toList(),
      additional_specializations: (json['additional_specializations'] as List?)
          ?.map((e) => Specialization.fromJson(e as Map<String, dynamic>))
          .toList(),
      countReviewsWithRating5: json['countReviewsWithRating5'],
      countReviewsWithRating4: json['countReviewsWithRating4'],
      countReviewsWithRating3: json['countReviewsWithRating3'],
      countReviewsWithRating2: json['countReviewsWithRating2'],
      countReviewsWithRating1: json['countReviewsWithRating1'],
      reviewCount: json['reviewCount'],
      averageRating: json['averageRating'],
      formatted5Reviews: (json['formatted5Reviews'] as List?)?.map((e) => FormattedReview.fromJson(e as Map<String, dynamic>)).toList(),
      staticPatientCount: json['staticPatientCount'],
      availableAppointments: (json['avaliable_appointments'] as List?)
          ?.map((e) => e == null
          ? null
          : AvailableAppointment.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
      waitingTime: json['waiting_time'],
      experienceYears: json['exp_years'],
      branches: (json['branches'] as List?)?.map((e) => Branch.fromJson(e as Map<String, dynamic>)).toList(),
      allServices: (json['all_services'] as List?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      enterprise: (json['enterprise'] != null ? Enterprise.fromJson(json['enterprise']) : null )!,

      insurances: (json['insurances'] as List?)
          ?.map((e) => e == null ? null : Insurance.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
    );
  }
}
*/

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
  var city_id;
  var area_id;
  Videos? videos;
  var gender;
  var graduationYear;
  var idNumber;
  var children;
  var adults;
  var maxConsultationsPerDay;
  var specializationIds;
  var additionalSpecializationIds;
  var serviceIds;
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
  List<Price>? price; // Updated to handle new price format
  List<WaitingTime>? waitingTime; // Updated to handle new waiting time format
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
  List<Specialization>? specializations;
  List<Specialization>? additional_specializations;
  List<Service>? allServices;

  var countReviewsWithRating5;
  var countReviewsWithRating4;
  var countReviewsWithRating3;
  var countReviewsWithRating2;
  var countReviewsWithRating1;
  var reviewCount;
  var averageRating;
  List<FormattedReview?>? formatted5Reviews;
  var staticPatientCount;
  var availableAppointments;
  var waitingTimeInMinutes;

  var experienceYears;
  List<Branch>? branches; // Updated Branch structure
  Enterprise enterprise;
  List<InsuranceGroup>? insurances; // Updated Insurance structure

  Doctor({
    this.id,
    this.allServices,
    this.enterpriseId,
    this.img,

    this.nameAr,
    this.videos,
    this.nameEn,
    this.lastNameAr,
    this.lastNameEn,
    this.email,
    this.mobile,
    this.city_id,
    this.area_id,
    this.gender,
    this.graduationYear,
    this.idNumber,
    this.children,
    this.adults,
    this.maxConsultationsPerDay,
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
    this.specializations,
    this.additional_specializations,
    this.countReviewsWithRating5,
    this.countReviewsWithRating4,
    this.countReviewsWithRating3,
    this.countReviewsWithRating2,
    this.countReviewsWithRating1,
    this.reviewCount,
    this.averageRating,
    this.formatted5Reviews,
    this.staticPatientCount,
    this.waitingTime,
    this.availableAppointments,
    this.waitingTimeInMinutes,
    this.experienceYears,
    this.branches,
    required this.enterprise,
    this.insurances,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      enterpriseId: json['enterprise_id'],
      img: json['img'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      lastNameAr: json['last_name_ar'],
      lastNameEn: json['last_name_en'],
      email: json['email'],
      mobile: json['mobile'],
      videos: json['videos'] != null ? Videos.fromJson(json['videos']) : null,
      city_id: json['city_id'],
      area_id: json['area_id'],
      gender: json['gender'],
      graduationYear: json['graduation_year'],
      idNumber: json['id_number'],
      children: json['children'],
      adults: json['adults'],
      allServices: (json['all_services'] as List?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxConsultationsPerDay: json['max_consultations_per_day'],
      specializationIds: json['specialization_ids'] ?? [],
      additionalSpecializationIds: json['additional_specialization_ids'] ?? [],
      serviceIds: json['service_ids'] ?? [],
      jobTitleAr: json['job_title_ar'],
      jobTitleEn: json['job_title_en'],
      additionalJobTitleAr: json['additional_job_title_ar'],
      additionalJobTitleEn: json['additional_job_title_en'],
      papers: json['papers'],
      certificates: json['certificates'],
      certificateAr: json['certificate_ar'],
      certificateEn: json['certificate_en'],
      aboutAr: json['about_ar'],
      aboutEn: json['about_en'],
      additionalServicesAr: json['additional_services_ar'],
      additionalServicesEn: json['additional_services_en'],
      price: (json['price'] as List?)
          ?.map((e) => Price.fromJson(e as Map<String, dynamic>))
          .toList(),
      waitingTime: (json['waiting_time'] as List?)
          ?.map((e) => WaitingTime.fromJson(e as Map<String, dynamic>))
          .toList(),
      insuranceIds: json['insurance_ids'] ?? [],
      branchIds: json['branch_ids'] ?? [],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      isTop10: json['is_top_10'],
      isVip: json['is_vip'],
      isRecommended: json['is_recommended'],
      rank: json['rank'],
      city: json['city'],

      area: json['area'],
      acceptsSameDayAppointments: json['accepts_same_day_appointments'],
      specializations: (json['specializations'] as List?)
          ?.map((e) => Specialization.fromJson(e as Map<String, dynamic>))
          .toList(),
      additional_specializations: (json['additional_specializations'] as List?)
          ?.map((e) => Specialization.fromJson(e as Map<String, dynamic>))
          .toList(),
      countReviewsWithRating5: json['countReviewsWithRating5'],
      countReviewsWithRating4: json['countReviewsWithRating4'],
      countReviewsWithRating3: json['countReviewsWithRating3'],
      countReviewsWithRating2: json['countReviewsWithRating2'],
      countReviewsWithRating1: json['countReviewsWithRating1'],
      reviewCount: json['reviewCount'],
      averageRating: json['averageRating'],
      formatted5Reviews: (json['formatted5Reviews'] as List?)
          ?.map((e) =>
      e == null ? null : FormattedReview.fromJson(e as Map<String, dynamic>))
          .toList(),
      staticPatientCount: json['staticPatientCount'],
      availableAppointments: json['available_appointments'],
      waitingTimeInMinutes: json['waiting_time_in_minutes'],
      experienceYears: json['exp_years'],
      branches: (json['branches'] as List?)
          ?.map((e) => Branch.fromJson(e as Map<String, dynamic>))
          .toList(),
      enterprise: Enterprise.fromJson(json['enterprise']),
      insurances: (json['insurances'] as List?)
          ?.map((e) => InsuranceGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Specialization {
  var id;
  var nameAr;
  var nameEn;
  var icon;
  var createdAt;
  var updatedAt;

  Specialization({
    this.id,
    this.nameAr,
    this.nameEn,
    this.icon,
    this.createdAt,
    this.updatedAt,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) {
    return Specialization(
      id: json['id'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      icon: json['icon'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
class Videos {
  var video_1;
  var video_2;
  var video_3;


  Videos({
    this.video_1,
    this.video_2,
    this.video_3,
    
  });

  factory Videos.fromJson(Map<String, dynamic> json) {
    return Videos(
      video_1: json['video_1'],
      video_2: json['video_2'],
      video_3: json['video_3'],
     
    );
  }
}

class FormattedReview {
  var id;
  var rating;
  var comment;
  var userName;
  var staticImage;
  var timeAgo;
  var time_ago_en;

  FormattedReview({
    this.id,
    this.rating,
    this.comment,
    this.userName,
    this.staticImage,
    this.timeAgo,
    this.time_ago_en,
  });

  factory FormattedReview.fromJson(Map<String, dynamic> json) {
    return FormattedReview(
      id: json['id'],
      rating: json['rating'],
      comment: json['comment'],
      userName: json['user_name'],
      staticImage: json['static_image'],
      timeAgo: json['time_ago'],
      time_ago_en: json['time_ago_en'],
    );
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

  AvailableAppointment({
    this.id,
    this.doctorId,
    this.day,
    this.time,
    this.date,
    this.createdAt,
    this.updatedAt,
  });

  factory AvailableAppointment.fromJson(Map<String, dynamic> json) {
    return AvailableAppointment(
      id: json['id'],
      doctorId: json['doctor_id'],
      day: json['day'],
      time: json['time'],
      date: json['date'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
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
  var locationFeatureIds;
  var insuranceIds;
  var logo;
  var specialMarkAr;
  var specialMarkEn;
  var location;
  var tax;
  var registrationNo;
  var sms;
  var phone;
  var about;
  var time;
  var hasLab;
  var hasRadiology;
  var year;
  var status;
  var createdAt;
  var updatedAt;

  Branch({
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
    this.location,
    this.tax,
    this.registrationNo,
    this.sms,
    this.phone,
    this.about,
    this.time,
    this.hasLab,
    this.hasRadiology,
    this.year,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      id: json['id'],
      enterpriseId: json['enterprise_id'],
      typeAr: json['type_ar'],
      typeEn: json['type_en'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      cityId: json['city_id'],
      areaId: json['area_id'],
      locationFeatureIds: json['location_feature_ids'] ?? [],
      insuranceIds: json['insurance_ids'] ?? [],
      logo: json['logo'],
      specialMarkAr: json['special_mark_ar'],
      specialMarkEn: json['special_mark_en'],
      location: json['location'],
      tax: json['tax'],
      registrationNo: json['registration_no'],
      sms: json['sms'],
      phone: json['phone'],
      about: json['about'],
      time: json['time'],
      hasLab: json['has_lab'],
      hasRadiology: json['has_radiology'],
      year: json['year'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class WaitingTime {
  var enterpriseId;
  var waitingTime;

  WaitingTime({this.enterpriseId, this.waitingTime});

  factory WaitingTime.fromJson(Map<String, dynamic> json) {
    return WaitingTime(
      enterpriseId: json['enterprise_id'],
      waitingTime: json['waiting_time'],
    );
  }
}

class Price {
  var enterpriseId;
  var price;

  Price({this.enterpriseId, this.price});

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      enterpriseId: json['enterprise_id'],
      price: json['price'],
    );
  }
}

class InsuranceGroup {
  var enterpriseId;
  List<Insurance>? insurances;

  InsuranceGroup({this.enterpriseId, this.insurances});

  factory InsuranceGroup.fromJson(Map<String, dynamic> json) {
    return InsuranceGroup(
      enterpriseId: json['enterprise_id'],
      insurances: (json['insurances'] as List?)
          ?.map((e) => Insurance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
  var locationFeatureIds;
  var insuranceIds;
  var logo;
  var specialMarkAr;
  var specialMarkEn;
  var papersLicenses;
  var location;
  var tax;
  var registrationNo;
  var sms;
  var phone;
  var about;
  var time;
  var gallery;
  var hasLab;
  var hasRadiology;
  var year;
  var status;
  var createdAt;
  var updatedAt;

  Enterprise({
    this.id,
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

  factory Enterprise.fromJson(Map<String, dynamic> json) {
    return Enterprise(
      id: json['id'],
      typeAr: json['type_ar'],
      typeEn: json['type_en'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      cityId: json['city_id'],
      areaId: json['area_id'],
      locationFeatureIds: json['location_feature_ids'] ?? [],
      insuranceIds: json['insurance_ids'] ?? [],
      logo: json['logo'],
      specialMarkAr: json['special_mark_ar'],
      specialMarkEn: json['special_mark_en'],
      papersLicenses: json['papers_licenses'],
      location: json['location'],
      tax: json['tax'],
      registrationNo: json['registration_no'],
      sms: json['sms'],
      phone: json['phone'],
      about: json['about'],
      time: json['time'],
      gallery: json['gallery'],
      hasLab: json['has_lab'],
      hasRadiology: json['has_radiology'],
      year: json['year'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Insurance {
  var id;
  var nameAr;
  var enterprise_id;
  var nameEn;
  var createdAt;
  var updatedAt;

  Insurance({
    this.id,
    this.nameAr,
    this.nameEn,
    this.enterprise_id,
    this.createdAt,
    this.updatedAt,
  });

  factory Insurance.fromJson(Map<String, dynamic> json) {
    return Insurance(
      id: json['id'],
      nameAr: json['name_ar'],
      enterprise_id: json['enterprise_id'],
      nameEn: json['name_en'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}


class Schedule {
  final String startTime;
  final String endTime;

  Schedule({required this.startTime, required this.endTime});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      startTime: json['start_time'],
      endTime: json['end_time'],
    );
  }
}




class Service {
  var id;
  var nameAr;
  var nameEn;
  var specializationId;
  var createdAt;
  var updatedAt;
  Specialization? specialization;

  Service({
    this.id,
    this.nameAr,
    this.nameEn,
    this.specializationId,
    this.createdAt,
    this.updatedAt,
    this.specialization,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      specializationId: json['specialization_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      specialization: json['specialization'] != null
          ? Specialization.fromJson(json['specialization'])
          : null,
    );
  }
}

