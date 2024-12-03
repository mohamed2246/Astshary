class RescaudaulRecervation {
  Reservation? reservation;
  var message;

  RescaudaulRecervation({this.reservation, this.message});

  RescaudaulRecervation.fromJson(Map<String, dynamic> json) {
    reservation = json['reservation'] != null
        ? new Reservation.fromJson(json['reservation'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reservation != null) {
      data['reservation'] = this.reservation!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Reservation {
  var id;
  var enterpriseId;
  var doctorId;
  var specializationId;
  var patientId;
  var doctorAppointmentId;
  var status;
  var prescription;
  var isInsured;
  var insuranceCard;
  var insuranceId;
  var personPhone;
  var createdAt;
  var updatedAt;

  Reservation(
      {this.id,
        this.enterpriseId,
        this.doctorId,
        this.specializationId,
        this.patientId,
        this.doctorAppointmentId,
        this.status,
        this.prescription,
        this.isInsured,
        this.insuranceCard,
        this.insuranceId,
        this.personPhone,
        this.createdAt,
        this.updatedAt});

  Reservation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enterpriseId = json['enterprise_id'];
    doctorId = json['doctor_id'];
    specializationId = json['specialization_id'];
    patientId = json['patient_id'];
    doctorAppointmentId = json['doctor_appointment_id'];
    status = json['status'];
    prescription = json['prescription'];
    isInsured = json['is_insured'];
    insuranceCard = json['insurance_card'];
    insuranceId = json['insurance_id'];
    personPhone = json['person_phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['enterprise_id'] = this.enterpriseId;
    data['doctor_id'] = this.doctorId;
    data['specialization_id'] = this.specializationId;
    data['patient_id'] = this.patientId;
    data['doctor_appointment_id'] = this.doctorAppointmentId;
    data['status'] = this.status;
    data['prescription'] = this.prescription;
    data['is_insured'] = this.isInsured;
    data['insurance_card'] = this.insuranceCard;
    data['insurance_id'] = this.insuranceId;
    data['person_phone'] = this.personPhone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
