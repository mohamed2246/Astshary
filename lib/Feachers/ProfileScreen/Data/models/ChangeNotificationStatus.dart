class ChangeNotificationStatus {
  String? status;
  String? message;
  Data? data;

  ChangeNotificationStatus({this.status, this.message, this.data});

  ChangeNotificationStatus.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
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
  var token;
  String? notificationAvaliable;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
