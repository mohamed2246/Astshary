class SearchAreaModel {
  int? id;
  String? nameAr;
  String? nameEn;
  String? cityId;
  String? createdAt;
  String? updatedAt;
  String? status;

  SearchAreaModel({
    this.id,
    this.nameAr,
    this.nameEn,
    this.cityId,
    this.createdAt,
    this.updatedAt,
    this.status,
  });

  SearchAreaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['city_id'] = this.cityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    return data;
  }

  static List<SearchAreaModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => SearchAreaModel.fromJson(json)).toList();
  }
}
