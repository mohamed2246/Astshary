class SearchCity {
  int? id;
  String? categoryAr;
  String? categoryEn;
  String? nameAr;
  String? nameEn;
  String? createdAt;
  String? updatedAt;
  String? status;

  SearchCity(
      {this.id,
        this.categoryAr,
        this.categoryEn,
        this.nameAr,
        this.nameEn,
        this.createdAt,
        this.updatedAt,
        this.status});

  SearchCity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryAr = json['category_ar'];
    categoryEn = json['category_en'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
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
    data['status'] = this.status;
    return data;
  }
}
