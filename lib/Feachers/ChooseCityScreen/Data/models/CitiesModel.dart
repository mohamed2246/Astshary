class CitiesModel {
  List<Cities>? cities;
  int? status;

  CitiesModel({this.cities, this.status});

  CitiesModel.fromJson(Map<String, dynamic> json) {
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(new Cities.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cities != null) {
      data['cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Cities {
  int? id;
  String? categoryAr;
  String? categoryEn;
  String? nameAr;
  String? nameEn;
  String? createdAt;
  String? updatedAt;

  Cities(
      {this.id,
        this.categoryAr,
        this.categoryEn,
        this.nameAr,
        this.nameEn,
        this.createdAt,
        this.updatedAt});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryAr = json['category_ar'];
    categoryEn = json['category_en'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_ar'] = this.categoryAr;
    data['category_en'] = this.categoryEn;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}