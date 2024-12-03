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

  Reviews(
      {this.id,
        this.rating,
        this.comment,
        this.userName,
        this.staticImage,
        this.timeAgo});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rating = json['rating'];
    comment = json['comment'];
    userName = json['user_name'];
    staticImage = json['static_image'];
    timeAgo = json['time_ago'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['user_name'] = this.userName;
    data['static_image'] = this.staticImage;
    data['time_ago'] = this.timeAgo;
    return data;
  }
}
