import 'dart:convert';

class Specialization {
  var id;
  var nameAr;
  var nameEn;
  var icon;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isMostSelected;

  Specialization({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
    required this.isMostSelected,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) {
    return Specialization(
      id: json['id'],
      nameAr: json['name_ar'],
      nameEn: json['name_en'],
      icon: json['icon'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      isMostSelected: json['is_most_selected'] == "1",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_ar': nameAr,
      'name_en': nameEn,
      'icon': icon,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'is_most_selected': isMostSelected ? "1" : "0",
    };
  }
}

class SpecializationsResponse {
  final List<Specialization> specializations;
  final List<Specialization> otherSpecializations;
  final List<Specialization> mostSelectedSpecializations;
  var status;

  SpecializationsResponse({
    required this.specializations,
    required this.otherSpecializations,
    required this.mostSelectedSpecializations,
    required this.status,
  });

  factory SpecializationsResponse.fromJson(Map<String, dynamic> json) {
    return SpecializationsResponse(
      specializations: List<Specialization>.from(json['specializations'].map((x) => Specialization.fromJson(x))),
      otherSpecializations: List<Specialization>.from(json['otherSpecializations'].map((x) => Specialization.fromJson(x))),
      mostSelectedSpecializations: List<Specialization>.from(json['mostSelectedSpecializations'].map((x) => Specialization.fromJson(x))),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'specializations': List<dynamic>.from(specializations.map((x) => x.toJson())),
      'otherSpecializations': List<dynamic>.from(otherSpecializations.map((x) => x.toJson())),
      'mostSelectedSpecializations': List<dynamic>.from(mostSelectedSpecializations.map((x) => x.toJson())),
      'status': status,
    };
  }
}