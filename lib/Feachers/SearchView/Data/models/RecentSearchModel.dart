class RecentSearchModel {
  String? status;
  List<Data>? data;

  RecentSearchModel({this.status, this.data});

  RecentSearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  SearchQuery? searchQuery;
  String? createdAt;

  Data({this.id, this.searchQuery, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    searchQuery = json['search_query'] != null
        ? new SearchQuery.fromJson(json['search_query'])
        : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.searchQuery != null) {
      data['search_query'] = this.searchQuery!.toJson();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

class SearchQuery {
  String? name;
  String? specialization;
  String? gender;
  String? expYears;
  String? rating;

  SearchQuery(
      {this.name,
        this.specialization,
        this.gender,
        this.expYears,
        this.rating});

  SearchQuery.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    specialization = json['specialization'];
    gender = json['gender'];
    expYears = json['exp_years'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['specialization'] = this.specialization;
    data['gender'] = this.gender;
    data['exp_years'] = this.expYears;
    data['rating'] = this.rating;
    return data;
  }
}
