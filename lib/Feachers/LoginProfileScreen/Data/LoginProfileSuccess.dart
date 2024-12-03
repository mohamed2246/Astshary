class LoginProfileSuccess {
  String? status;
  Patient? patient;

  LoginProfileSuccess({this.status, this.patient});

  LoginProfileSuccess.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    patient =
    json['patient'] != null ? new Patient.fromJson(json['patient']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.patient != null) {
      data['patient'] = this.patient!.toJson();
    }
    return data;
  }
}

class Patient {
  int? id;
  String? name;
  String? phone;
  String? gender;
  String? isInsuranceSubscriber;
  String? isBookingForSomeoneElse;
  String? status;
  var image;
  String? createdAt;
  String? updatedAt;
  String? notification_avaliable;

  Patient(
      {this.id,
        this.name,
        this.phone,
        this.gender,
        this.isInsuranceSubscriber,
        this.isBookingForSomeoneElse,
        this.status,
        this.notification_avaliable,
        this.image,
        this.createdAt,
        this.updatedAt});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notification_avaliable = json['notification_avaliable'];
    name = json['name'];
    phone = json['phone'];
    gender = json['gender'];
    isInsuranceSubscriber = json['is_insurance_subscriber'];
    isBookingForSomeoneElse = json['is_booking_for_someone_else'];
    status = json['status'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    return data;
  }
}
