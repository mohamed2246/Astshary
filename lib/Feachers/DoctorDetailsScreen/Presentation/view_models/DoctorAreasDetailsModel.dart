class DoctorAreasDetailsModel {
  Area? area;
  int? status;

  DoctorAreasDetailsModel({this.area, this.status});

  DoctorAreasDetailsModel.fromJson(Map<String, dynamic> json) {
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Area {
  int? id;
  String? nameAr;
  String? nameEn;
  String? cityId;
  String? createdAt;
  String? updatedAt;

  Area(
      {this.id,
        this.nameAr,
        this.nameEn,
        this.cityId,
        this.createdAt,
        this.updatedAt});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['city_id'] = this.cityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
