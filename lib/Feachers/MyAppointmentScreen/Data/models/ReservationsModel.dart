import 'dart:convert';

class AppointmentResponse {
  List<Appointment> upcoming;
  List<Appointment> current;
  List<Appointment> cancel;
  int status;

  AppointmentResponse({
    required this.upcoming,
    required this.current,
    required this.cancel,
    required this.status,
  });

  factory AppointmentResponse.fromJson(Map<String, dynamic> json) {
    return AppointmentResponse(
      upcoming: List<Appointment>.from(json['upcoming'].map((x) => Appointment.fromJson(x))),
      current: List<Appointment>.from(json['current'].map((x) => Appointment.fromJson(x))),
      cancel: List<Appointment>.from(json['cancel'].map((x) => Appointment.fromJson(x))),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'upcoming': List<dynamic>.from(upcoming.map((x) => x.toJson())),
      'current': List<dynamic>.from(current.map((x) => x.toJson())),
      'cancel': List<dynamic>.from(cancel.map((x) => x.toJson())),
      'status': status,
    };
  }
}

class Appointment {
  var doctorNameAr;
  int id;
  var doctorNameEn;
  var doctorAdditionalJobTitleAr;
  var doctorAdditionalJobTitleEn;
  var doctorImg;
  DoctorAppointment doctorAppointment;
  var isInsured;
  var insuranceId;
  var insuranceCard;

  Appointment({
    required this.doctorNameAr,
    required this.id,
    required this.doctorNameEn,
    required this.doctorAdditionalJobTitleAr,
    required this.doctorAdditionalJobTitleEn,
    required this.doctorImg,
    required this.doctorAppointment,
    required this.isInsured,
    this.insuranceId,
    this.insuranceCard,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      doctorNameAr: json['doctor_name_ar'],
      id: json['id'],
      doctorNameEn: json['doctor_name_en'],
      doctorAdditionalJobTitleAr: json['doctor_additional_job_title_ar'],
      doctorAdditionalJobTitleEn: json['doctor_additional_job_title_en'],
      doctorImg: json['doctor_img'],
      doctorAppointment: DoctorAppointment.fromJson(json['doctor_appointment']),
      isInsured: json['is_insured'],
      insuranceId: json['insurance_id'],
      insuranceCard: json['insurance_card'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctor_name_ar': doctorNameAr,
      'doctor_name_en': doctorNameEn,
      'doctor_additional_job_title_ar': doctorAdditionalJobTitleAr,
      'doctor_additional_job_title_en': doctorAdditionalJobTitleEn,
      'doctor_img': doctorImg,
      'doctor_appointment': doctorAppointment.toJson(),
      'is_insured': isInsured,
      'insurance_id': insuranceId,
      'insurance_card': insuranceCard,
    };
  }
}

class DoctorAppointment {
  int id;
  var doctorId;
  var enterpriseId;
  var day;
  var time;
  var from;
  var to;
  var date;
  var isActive;
  var createdAt;
  var updatedAt;

  DoctorAppointment({
    required this.id,
    required this.doctorId,
    required this.enterpriseId,
    required this.day,
    required this.time,
    required this.from,
    required this.to,
    required this.date,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DoctorAppointment.fromJson(Map<String, dynamic> json) {
    return DoctorAppointment(
      id: json['id'],
      doctorId: json['doctor_id'],
      enterpriseId: json['enterprise_id'],
      day: json['day'],
      time: json['time'],
      from: json['from'],
      to: json['to'],
      date: json['date'],
      isActive: json['is_active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctor_id': doctorId,
      'enterprise_id': enterpriseId,
      'day': day,
      'time': time,
      'from': from,
      'to': to,
      'date': date,
      'is_active': isActive,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
