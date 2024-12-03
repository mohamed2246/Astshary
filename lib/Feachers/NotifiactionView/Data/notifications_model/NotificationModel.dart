class notificationModel {
  List<Notifications>? notifications;
  var status;

  notificationModel({this.notifications, this.status});

  notificationModel.fromJson(Map<String, dynamic> json) {
    if (json['notifications'] != null) {
      notifications = <Notifications>[];
      json['notifications'].forEach((v) {
        notifications!.add(new Notifications.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notifications != null) {
      data['notifications'] =
          this.notifications!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Notifications {
  var id;
  var patientId;
  var doctor_id;
  var doctor_appointment_id;
  var enterpriseId;
  var titleAr;
  var titleEn;
  var status;
  var bodyAr;
  var done_make_review;
  var bodyEn;
  var createdAt;
  var enterprise_id;
  var updatedAt;
  var  isnew ;
  Notifications(
      {this.id,
        this.patientId,
        this.doctor_id,
        this.doctor_appointment_id,
        this.enterpriseId,
        this.titleAr,
        this.titleEn,
        this.status,
        this.bodyAr,
        this.done_make_review,
        this.isnew,
        this.bodyEn,
        this.enterprise_id,
        this.createdAt,
        this.updatedAt});

  Notifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    doctor_id = json['doctor_id'];
    doctor_appointment_id = json['doctor_appointment_id'];
    enterpriseId = json['enterprise_id'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    status = json['status'];
    enterprise_id = json['enterprise_id'];
    bodyAr = json['body_ar'];
    done_make_review = json['done_make_review'];
    bodyEn = json['body_en'];
    isnew = json['isnew'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patient_id'] = this.patientId;
    data['doctor_id'] = this.doctor_id;
    data['doctor_appointment_id'] = this.doctor_appointment_id;
    data['enterprise_id'] = this.enterpriseId;
    data['title_ar'] = this.titleAr;
    data['title_en'] = this.titleEn;
    data['enterprise_id'] = this.enterprise_id;
    data['body_ar'] = this.bodyAr;
    data['done_make_review'] = this.done_make_review;
    data['isnew'] = this.isnew;
    data['status'] = this.status;
    data['body_en'] = this.bodyEn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
