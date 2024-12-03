/*
class ConfirmationModel {
  String? message;
  Reservation? reservation;
  Enterprise? enterprise;
  ReservationDetails? reservationDetails;

  ConfirmationModel({this.message, this.reservation, this.enterprise, this.reservationDetails});

  ConfirmationModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    reservation = json['reservation'] != null
        ? new Reservation.fromJson(json['reservation'])
        : null;
    enterprise = json['enterprise'] != null
        ? new Enterprise.fromJson(json['enterprise'])
        : null;
    reservationDetails = json['reservation_details'] != null
        ? new ReservationDetails.fromJson(json['reservation_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.reservation != null) {
      data['reservation'] = this.reservation!.toJson();
    }
    if (this.enterprise != null) {
      data['enterprise'] = this.enterprise!.toJson();
    }
    if (this.reservationDetails != null) {
      data['reservation_details'] = this.reservationDetails!.toJson();
    }
    return data;
  }
}

class Reservation {
  String? enterpriseId;
  String? doctorId;
  String? specializationId;
  int? patientId;
  String? doctorAppointmentId;
  String? status;
  String? isInsured;
  String? insuranceId;
  String? prescription;
  String? insuranceCard;
  String? updatedAt;
  String? createdAt;
  int? id;

  Reservation(
      {this.enterpriseId,
        this.doctorId,
        this.specializationId,
        this.patientId,
        this.doctorAppointmentId,
        this.status,
        this.isInsured,
        this.insuranceId,
        this.prescription,
        this.insuranceCard,
        this.updatedAt,
        this.createdAt,
        this.id});

  Reservation.fromJson(Map<String, dynamic> json) {
    enterpriseId = json['enterprise_id'];
    doctorId = json['doctor_id'];
    specializationId = json['specialization_id'];
    patientId = json['patient_id'];
    doctorAppointmentId = json['doctor_appointment_id'];
    status = json['status'];
    isInsured = json['is_insured'];
    insuranceId = json['insurance_id'];
    prescription = json['prescription'];
    insuranceCard = json['insurance_card'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enterprise_id'] = this.enterpriseId;
    data['doctor_id'] = this.doctorId;
    data['specialization_id'] = this.specializationId;
    data['patient_id'] = this.patientId;
    data['doctor_appointment_id'] = this.doctorAppointmentId;
    data['status'] = this.status;
    data['is_insured'] = this.isInsured;
    data['insurance_id'] = this.insuranceId;
    data['prescription'] = this.prescription;
    data['insurance_card'] = this.insuranceCard;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

class Enterprise {
  String? phone;
  String? addressAr;
  String? addressEn;
  String? location;

  Enterprise({this.phone, this.addressAr, this.addressEn, this.location});

  Enterprise.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    addressAr = json['address_ar'];
    addressEn = json['address_en'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['address_ar'] = this.addressAr;
    data['address_en'] = this.addressEn;
    data['location'] = this.location;
    return data;
  }
}

class ReservationDetails {
  String? date;
  String? day;
  String? time;

  ReservationDetails({this.date, this.day, this.time});

  ReservationDetails.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = json['day'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['day'] = this.day;
    data['time'] = this.time;
    return data;
  }
}
*/



class ConfirmationModel {
  String message;
  Reservation reservation;
  Enterprise enterprise;
  Pricing pricing;
  ReservationDetails reservationDetails;

  ConfirmationModel({
    this.message = '',
    Reservation? reservation,
    Enterprise? enterprise,
    Pricing? pricing,
    ReservationDetails? reservationDetails,
  })  : reservation = reservation ?? Reservation(),
        enterprise = enterprise ?? Enterprise(),
        pricing = pricing ?? Pricing(), // Ensure pricing is initialized

      reservationDetails = reservationDetails ?? ReservationDetails();

  ConfirmationModel.fromJson(Map<String, dynamic> json)
      : message = json['message'] ?? '',
        reservation = json['reservation'] != null
            ? Reservation.fromJson(json['reservation'])
            : Reservation(),
        enterprise = json['enterprise'] != null
            ? Enterprise.fromJson(json['enterprise'])
            : Enterprise(),

        pricing = json['pricing'] != null
            ? Pricing.fromJson(json['pricing'])
            : Pricing(),
        reservationDetails = json['reservation_details'] != null
            ? ReservationDetails.fromJson(json['reservation_details'])
            : ReservationDetails();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['reservation'] = reservation.toJson();
    data['enterprise'] = enterprise.toJson();
    data['pricing'] = pricing.toJson()!;
    data['reservation_details'] = reservationDetails.toJson();
    return data;
  }
}

class Reservation {
  String enterpriseId;
  String doctorId;
  String specializationId;
  int patientId;
  String doctorAppointmentId;
  String status;
  String isInsured;
  String insuranceId;
  String prescription;
  String insuranceCard;
  String updatedAt;
  String createdAt;
  int id;
  String notificationAvaliable;
  Patient patient;

  Reservation({
    this.enterpriseId = '',
    this.doctorId = '',
    this.specializationId = '',
    this.patientId = 0,
    this.doctorAppointmentId = '',
    this.status = '',
    this.isInsured = '',
    this.insuranceId = '',
    this.prescription = '',
    this.insuranceCard = '',
    this.updatedAt = '',
    this.createdAt = '',
    this.id = 0,
    this.notificationAvaliable = '',
    Patient? patient,
  }) : patient = patient ?? Patient();

  Reservation.fromJson(Map<String, dynamic> json)
      : enterpriseId = json['enterprise_id'] ?? '',
        doctorId = json['doctor_id'] ?? '',
        specializationId = json['specialization_id'] ?? '',
        patientId = json['patient_id'] ?? 0,
        doctorAppointmentId = json['doctor_appointment_id'] ?? '',
        status = json['status'] ?? '',
        isInsured = json['is_insured'] ?? '',
        insuranceId = json['insurance_id'] ?? '',
        prescription = json['prescription'] ?? '',
        insuranceCard = json['insurance_card'] ?? '',
        updatedAt = json['updated_at'] ?? '',
        createdAt = json['created_at'] ?? '',
        id = json['id'] ?? 0,
        notificationAvaliable = json['notification_avaliable'] ?? '',
        patient = json['patient'] != null ? Patient.fromJson(json['patient']) : Patient();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['enterprise_id'] = enterpriseId;
    data['doctor_id'] = doctorId;
    data['specialization_id'] = specializationId;
    data['patient_id'] = patientId;
    data['doctor_appointment_id'] = doctorAppointmentId;
    data['status'] = status;
    data['is_insured'] = isInsured;
    data['insurance_id'] = insuranceId;
    data['prescription'] = prescription;
    data['insurance_card'] = insuranceCard;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['notification_avaliable'] = notificationAvaliable;
    data['patient'] = patient.toJson();
    return data;
  }
}

class Enterprise {
  String phone;
  String addressAr;
  String addressEn;
  String location;

  Enterprise({
    this.phone = '',
    this.addressAr = '',
    this.addressEn = '',
    this.location = '',
  });

  Enterprise.fromJson(Map<String, dynamic> json)
      : phone = json['phone'] ?? '',
        addressAr = json['address_ar'] ?? '',
        addressEn = json['address_en'] ?? '',
        location = json['location'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['address_ar'] = addressAr;
    data['address_en'] = addressEn;
    data['location'] = location;
    return data;
  }
}

class ReservationDetails {
  String date;
  String day;
  var time;
  var from;
  var to;

  ReservationDetails({
    this.date = '',
    this.day = '',
    this.time = '',
    this.from = '',
    this.to = '',
  });

  ReservationDetails.fromJson(Map<String, dynamic> json)
      : date = json['date'] ?? '',
        day = json['day'] ?? '',
        to = json['to'] ?? '',
        from = json['from'] ?? '',
        time = json['time'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['day'] = day;
    data['from'] = from;
    data['to'] = to;
    data['time'] = time;
    return data;
  }
}

class Pricing {
  var price_before_discount;
  var price_after_discount;
  var discount_rate;


  Pricing({
    this.price_before_discount = '',
    this.discount_rate = '',
    this.price_after_discount = '',
  });

  Pricing.fromJson(Map<String, dynamic> json)
      : price_before_discount = json['price_before_discount'] ?? '',
        discount_rate = json['discount_rate'] ?? '',
        price_after_discount = json['price_after_discount'] ?? '';

        Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price_before_discount'] = price_before_discount;
    data['discount_rate'] = discount_rate;
    data['price_after_discount'] = price_after_discount; // Add this line
    return data;
  }
}


class Patient {
  int id;
  String name;
  String phone;
  String gender;
  String isInsuranceSubscriber;
  String isBookingForSomeoneElse;
  String status;
  String image;
  String createdAt;
  String updatedAt;
  String token;
  String notificationAvaliable;

  Patient({
    this.id = 0,
    this.name = '',
    this.phone = '',
    this.gender = '',
    this.isInsuranceSubscriber = '',
    this.isBookingForSomeoneElse = '',
    this.status = '',
    this.image = '',
    this.createdAt = '',
    this.updatedAt = '',
    this.token = '',
    this.notificationAvaliable = '',
  });

  Patient.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        name = json['name'] ?? '',
        phone = json['phone'] ?? '',
        gender = json['gender'] ?? '',
        isInsuranceSubscriber = json['is_insurance_subscriber'] ?? '',
        isBookingForSomeoneElse = json['is_booking_for_someone_else'] ?? '',
        status = json['status'] ?? '',
        image = json['image'] ?? '',
        createdAt = json['created_at'] ?? '',
        updatedAt = json['updated_at'] ?? '',
        token = json['token'] ?? '',
        notificationAvaliable = json['notification_avaliable'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['gender'] = gender;
    data['is_insurance_subscriber'] = isInsuranceSubscriber;
    data['is_booking_for_someone_else'] = isBookingForSomeoneElse;
    data['status'] = status;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['token'] = token;
    data['notification_avaliable'] = notificationAvaliable;
    return data;
  }
}
