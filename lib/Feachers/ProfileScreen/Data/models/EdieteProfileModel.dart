class EdieteProfileModel {
  Patient? patient;
 var status;
  var message;

  EdieteProfileModel({this.patient, this.status, this.message});

  EdieteProfileModel.fromJson(Map<String, dynamic> json) {
    patient =
    json['patient'] != null ? new Patient.fromJson(json['patient']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.patient != null) {
      data['patient'] = this.patient!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Patient {
 var id;
  var name;
  var phone;
  var gender;
  var isInsuranceSubscriber;
  var isBookingForSomeoneElse;
  var status;
  Null? image;
  var createdAt;
  var updatedAt;
  var token;
  var notificationAvaliable;

  Patient(
      {this.id,
        this.name,
        this.phone,
        this.gender,
        this.isInsuranceSubscriber,
        this.isBookingForSomeoneElse,
        this.status,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.token,
        this.notificationAvaliable});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    gender = json['gender'];
    isInsuranceSubscriber = json['is_insurance_subscriber'];
    isBookingForSomeoneElse = json['is_booking_for_someone_else'];
    status = json['status'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
    notificationAvaliable = json['notification_avaliable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['is_insurance_subscriber'] = this.isInsuranceSubscriber;
    data['is_booking_for_someone_else'] = this.isBookingForSomeoneElse;
    data['status'] = this.status;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['token'] = this.token;
    data['notification_avaliable'] = this.notificationAvaliable;
    return data;
  }
}
