class ReviewsClinic {
  List<Reviews>? reviews;
  int? status;

  ReviewsClinic({this.reviews, this.status});

  ReviewsClinic.fromJson(Map<String, dynamic> json) {

    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}


class Reviews {
  int? id;
  String? rating;
  var comment;
  String? userName;
  String? staticImage;
  String? timeAgo;
  String? audio;
  String? doctor_name_ar;
  String? doctor_name_en;

  Reviews(
      {this.id,
        this.rating,
        this.comment,
        this.userName,
        this.staticImage,
        this.audio,
        this.doctor_name_ar,
        this.doctor_name_en,

        this.timeAgo});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rating = json['rating'];
    comment = json['comment'];
    userName = json['user_name'];
    staticImage = json['static_image'];
    timeAgo = json['time_ago'];
    audio = json['audio'];
    doctor_name_ar = json['doctor_name_ar'];
    doctor_name_en = json['doctor_name_en'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['user_name'] = this.userName;
    data['static_image'] = this.staticImage;
    data['time_ago'] = this.timeAgo;
    data['audio'] = audio;
    data['doctor_name_ar'] = doctor_name_ar;
    data['doctor_name_en'] = doctor_name_en;

    return data;
  }
}
