class InsurancesModel {
  List<Insurances>? insurances;
  var status;

  InsurancesModel({this.insurances, this.status});

  InsurancesModel.fromJson(Map<String, dynamic> json) {
    if (json['insurances'] != null) {
      insurances = <Insurances>[];
      json['insurances'].forEach((v) {
        insurances!.add(new Insurances.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.insurances != null) {
      data['insurances'] = this.insurances!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Insurances {
  var id;
  var nameAr;
  var nameEn;
  var createdAt;
  var updatedAt;

  Insurances(
      {this.id, this.nameAr, this.nameEn, this.createdAt, this.updatedAt});

  Insurances.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
