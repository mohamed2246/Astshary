class SearchSpecModel {
  int? id;
  String? nameAr;
  String? nameEn;
  String? icon;
  String? createdAt;
  String? updatedAt;
  String? isMostSelected;

  SearchSpecModel(
      {this.id,
        this.nameAr,
        this.nameEn,
        this.icon,
        this.createdAt,
        this.updatedAt,
        this.isMostSelected});

  SearchSpecModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    icon = json['icon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isMostSelected = json['is_most_selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['icon'] = this.icon;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_most_selected'] = this.isMostSelected;
    return data;
  }
}
